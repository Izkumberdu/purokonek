import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    String formattedDate = DateFormat('MMMM d, yyyy').format(DateTime.now());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                dateAndNotif(formattedDate),
                const SizedBox(height: 10),
                highlightBar(screenSize),
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
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          // Return a row for each item in the list
          return Row(
            children: [
              Container(
                width: 60,
                height: 60, // Adjust height as needed
                color: Colors.blue, // Adjust color as needed
              ),
              SizedBox(width: 10), // Add spacing between container and text
              Text(
                'Some text', // Replace with your actual text
                style: TextStyle(fontSize: 16),
              ),
            ],
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
          buildOption(const Color(0xFFFFF3EB), 'assets/icons/health_icon.png',
              'Health'),
          const Spacer(),
          buildOption(const Color(0xFFE9F6FF),
              'assets/icons/documents_icon.png', 'Documents'),
          const Spacer(),
          buildOption(
              const Color(0xFFEEFEF4), 'assets/icons/trash_icon.png', 'Waste'),
          const Spacer(),
          buildOption(
              const Color(0xFFF9F6ED), 'assets/icons/maps_icon.png', 'Maps'),
          const Spacer(),
          buildOption(const Color(0xFFF1E9FF), 'assets/icons/support_icon.png',
              'Support'),
        ],
      ),
    );
  }

  Widget buildOption(Color color, String iconPath, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        squareOption(color, iconPath),
        SizedBox(height: 4), // Add some spacing between the icon and the label
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
          width: 30, // Adjust this value to your preference for icon size
          height: 30, // Adjust this value to your preference for icon size
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
        color: Colors.green,
        borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
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
                      fontSize: 14, color: Color(0xFFC9C9C9))),
            ],
          ),
        ),
        const Spacer(),
        Container(
          width: 50,
          height: 50,
          child: Center(
            child: Image.asset(
              'assets/icons/notif_icon.png',
              width: 40, // Adjust this value to your preference for icon size
              height: 40, // Adjust this value to your preference for icon size
            ),
          ),
        )
      ],
    );
  }
}
