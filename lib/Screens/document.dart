import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purokonek/Screens/residency.dart';

class Document extends StatefulWidget {
  const Document({super.key});

  @override
  State<Document> createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: const Color(0xFFE9F6FF),
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
                  child: SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/documents_icon.png',
                          width: 25,
                          height: 25,
                        ),
                        const Spacer(),
                        Text(
                          'Documents',
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff4A6C94)),
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
                  width: double
                      .infinity, // Use double.infinity to match screen width
                  height: 700,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Request",
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => {
                                  Navigator.pushNamed(context, '/proofResidency')
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 45.5,
                                      height: 44.2,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFFF3EB),
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/icons/house.png",
                                          width: 21.5,
                                          height: 20.22,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Proof of Residency",
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "This document is typically used to prove an individual’s\nresidence in the barangay.",
                                          style: GoogleFonts.inter(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 45.5,
                                    height: 44.2,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffEEFEF4),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/icons/check.png",
                                        width: 21.5,
                                        height: 20.22,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Barangay Clearance",
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "certifies that you are a resident of the barangay and\nhave no pending cases or derogatory records.",
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 45.5,
                                    height: 44.2,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF9F6ED),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/icons/smile.png",
                                        width: 21.5,
                                        height: 20.22,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Certificate of Indigency",
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Certifies an individual or family as financially incapable\nor indigent, often required for applying for various\nsocial welfare programs.",
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 45.5,
                                height: 44.2,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE5E5E5),
                                    borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/icons/sad.png",
                                        width: 21.5,
                                        height: 20.22,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Barangay Blotter",
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "A record of incidents or complaints reported within the\nbarangay.",
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
