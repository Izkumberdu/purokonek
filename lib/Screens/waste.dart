import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purokonek/Constants/prompt.dart';
import 'package:purokonek/Constants/styles.dart';

class Waste extends StatefulWidget {
  const Waste({super.key});

  @override
  State<Waste> createState() => _WasteState();
}

class _WasteState extends State<Waste> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  final Gemini gemini = Gemini.instance;
  String responseText = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                wasteLogo(),
                SizedBox(
                  height: 20,
                ),
                schedule(),
                SizedBox(
                  height: 20,
                ),
                imagePickerContainer(),
                if (isLoading) CircularProgressIndicator(),
                if (responseText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      responseText,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEFEF4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_image == null) {
                          _showMyDialog();
                        } else {
                          _submitReport();
                        }
                      },
                      child: Text(
                        'Submit Report',
                        style:
                            SenSemiBold.copyWith(fontSize: 18, color: kGreen),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget schedule() {
    return Column(children: [
      Row(children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFEEFEF4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset(
              width: 30,
              height: 30,
              'assets/icons/trash_icon.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Biodegradeable',
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'Monday - Wednesday - Friday',
                style: GoogleFonts.inter(fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        )
      ]),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFFFFF3EB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                width: 30,
                height: 30,
                'assets/icons/trash_icon.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Non-Biodegradeable',
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Saturday - Tuesday',
                  style: GoogleFonts.inter(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      )
    ]);
  }

  Widget wasteLogo() {
    return Row(
      children: [
        Image.asset(
          'assets/icons/trash_icon.png',
          height: 24,
          width: 24,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          'Waste',
          style: SenSemiBold.copyWith(fontSize: 20, color: kLightGreen),
        )
      ],
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Please Select An image Before Submitting'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('We Cannot Process an image if there is none'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget imagePickerContainer() {
    return GestureDetector(
      onTap: () {
        _showImageSourceActionSheet(context);
      },
      child: Container(
        height: 350,
        width: 328,
        decoration: BoxDecoration(
          color: kLightGreen,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: _image == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 24,
                      color: kBlack,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Upload Photo/Camera',
                      style: SenMedium.copyWith(fontSize: 18, color: kBlack),
                    ),
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    File(_image!.path),
                    width: 328,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _image = pickedFile;
    });
  }

  Future<void> _submitReport() async {
    setState(() {
      isLoading = true;
      responseText = '';
    });

    if (_image == null) return;

    try {
      final imageBytes = File(_image!.path).readAsBytesSync();
      final response = await gemini.textAndImage(
        text: wastePrompt,
        images: [imageBytes],
      );

      final responseText =
          response?.content!.parts!.map((part) => part.text).join(" ") ??
              "No response text found.";
      setState(() {
        this.responseText = responseText;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        responseText = 'Failed to get response from Gemini.';
        isLoading = false;
      });
    }
  }
}
