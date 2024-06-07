import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFFFF3EB),
            width: screenSize.width,
            height: screenSize.height,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 100,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/health_icon.png',
                            width: 25,
                            height: 25,
                          ),
                          const Spacer(),
                          Text(
                            'Health',
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFEC4A48)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  elevation: 5.0, // Adjust elevation as needed
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 700,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Text(
                              'Hospital & Ambulance Directory',
                              style: GoogleFonts.inter(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            directoryTile('Kamputhaw Emergency Response Team',
                                'Kamputhaw Barangay Road', '(032)231 4411'),
                            const SizedBox(height: 10),
                            directoryTile(
                                'Perpetual Succour Hospital of Cebu, Inc.',
                                ' Gorordo Avenue',
                                '(032)233 8620'),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container directoryTile(String name, String address, String phoneNumber) {
    return Container(
      width: 500,
      height: 100,
      padding:
          const EdgeInsets.all(10.0), // Adding some padding for better layout
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/mark.png',
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5), // Adding space between icon and text
              Expanded(
                child: Text(
                  address,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/phone.png',
                width: 20,
                height: 20,
              ),
              SizedBox(width: 5), // Adding space between icon and text
              Expanded(
                child: Text(
                  phoneNumber,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
