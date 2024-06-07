import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:purokonek/models/news_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  triggerNotifications1() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'Free Operation Tuli this Saturday!',
            body:
                'The Barangay is holding a Free Operation Tuli this Saturday on Alumnos Gym!'));
  }

  triggerNotifications2() {
    AwesomeNotifications().createNotification(
        schedule: NotificationAndroidCrontab.minutely(
            referenceDateTime: DateTime.now()),
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'Earth Day Celebration',
            body:
                'The Barangay is participating in the Earth Day Celebration, be sure to turn off electronics on 10:00AM!'));
  }

  @override
  Widget build(BuildContext context) {
    triggerNotifications1();
    triggerNotifications2();
    final Size screenSize = MediaQuery.of(context).size;
    String formattedDate = DateFormat('MMMM d, yyyy').format(DateTime.now());

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                dateAndNotif(formattedDate),
                const SizedBox(height: 10),
                highlightBar(screenSize), //NEEDS WORK
                const SizedBox(height: 10),
                servicesHeader(),
                const SizedBox(height: 10),
                servicesOptions(screenSize),
                const SizedBox(height: 10),
                newsHeader(),
                const SizedBox(height: 5),
                newsList(screenSize),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded newsList(Size screenSize) {
    List<NewsModel> news = NewsModel.getNews();
    return Expanded(
      child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          NewsModel item = news[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Image.asset(
                      width: 30,
                      height: 30,
                      item.icon,
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
                        item.title,
                        style: GoogleFonts.inter(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.description,
                        style: GoogleFonts.inter(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Align newsHeader() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text('News',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget servicesOptions(Size screenSize) {
    return Container(
      width: screenSize.width,
      height: 75,
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/healthpage');
            },
            child: buildOption(const Color(0xFFFFF3EB),
                'assets/icons/health_icon.png', 'Health'),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ' '); //NAVIGATE TO DOCU
            },
            child: buildOption(const Color(0xFFE9F6FF),
                'assets/icons/documents_icon.png', 'Documents'),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ' '); //NAVIGATE TO WASTE
              },
              child: buildOption(const Color(0xFFEEFEF4),
                  'assets/icons/trash_icon.png', 'Waste')),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/mapspage');
            },
            child: buildOption(
                const Color(0xFFF9F6ED), 'assets/icons/maps_icon.png', 'Maps'),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/chat');
            },
            child: buildOption(const Color(0xFFF1E9FF),
                'assets/icons/support_icon.png', 'Support'),
          ),
        ],
      ),
    );
  }

  Widget buildOption(Color color, String iconPath, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        squareOption(color, iconPath),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget squareOption(Color color, String iconPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 30,
          height: 30,
        ),
      ),
    );
  }

  Align servicesHeader() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text('Services',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Container highlightBar(Size screenSize) {
    return Container(
      width: screenSize.width,
      height: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Image.asset('assets/images/comelec.png'),
      ),
    );
  }

  Row dateAndNotif(String formattedDate) {
    return Row(
      children: [
        SizedBox(
          height: 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PuroKonek',
                  style: GoogleFonts.inter(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(formattedDate,
                  style: GoogleFonts.inter(
                      fontSize: 14, color: const Color(0xFFC9C9C9))),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: Image.asset(
              'assets/icons/notif_icon.png',
              width: 40,
              height: 40,
            ),
          ),
        )
      ],
    );
  }
}
