import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purokonek/Constants/prompt.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatState();
}

class _ChatState extends State<ChatBot> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "Joel");
  ChatUser geminiUser = ChatUser(
      id: "1",
      firstName: "PuroKonek Support",
      profileImage: "assets/images/profile.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PuroKonek Support"),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
        inputOptions: InputOptions(trailing: [
          IconButton(
              onPressed: _sendMediaMessage,
              icon: Icon(Icons.camera_alt_rounded)),
          IconButton(onPressed: _sendFromGallery, icon: Icon(Icons.photo))
        ]),
        currentUser: currentUser,
        onSend: _SendMessage,
        messages: messages);
  }

  void _SendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      String combinedText = prompt + question;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(combinedText, images: images)
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != Null && lastMessage?.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminiUser, createdAt: DateTime.now(), text: response);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
          user: currentUser,
          createdAt: DateTime.now(),
          text: "Describe this image",
          medias: [
            ChatMedia(url: file.path, fileName: "", type: MediaType.image),
          ]);
      _SendMessage(chatMessage);
    }
  }

  void _sendFromGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
          user: currentUser,
          createdAt: DateTime.now(),
          text: "",
          medias: [
            ChatMedia(url: file.path, fileName: "", type: MediaType.image),
          ]);
      _SendMessage(chatMessage);
    }
  }
}
