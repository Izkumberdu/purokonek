import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProofResidency extends StatefulWidget {
  const ProofResidency({super.key});

  @override
  State<ProofResidency> createState() => _ProofResidencyState();
}

class _ProofResidencyState extends State<ProofResidency> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xffE9F6FF),
            width: screenSize.width,
            height: screenSize.height,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
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
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Request Proof of Residency",
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff4A6C94)),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xffCFD3D4),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xff4A6C94))),
                                            labelText: "Given name",
                                            labelStyle: GoogleFonts.inter(
                                              color: const Color(0xff4A6C94),
                                            ))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Column(
                                children: [
                                  SizedBox(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xffCFD3D4),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xff4A6C94))),
                                            labelText: "Surname",
                                            labelStyle: GoogleFonts.inter(
                                              color: const Color(0xff4A6C94),
                                            ))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Column(
                                children: [
                                  SizedBox(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xffCFD3D4),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xff4A6C94))),
                                            labelText: "Address",
                                            labelStyle: GoogleFonts.inter(
                                              color: const Color(0xff4A6C94),
                                            ))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Column(
                                children: [
                                  SizedBox(
                                    child: TextField(
                                        decoration: InputDecoration(
                                          prefixIcon: SizedBox(
                                            width: 18,
                                            height: 20,
                                            child: Image.asset("assets/icons/Calendar.png"),
                                          ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xffCFD3D4),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xff4A6C94))),
                                            labelText: "Date of Birth",
                                            labelStyle: GoogleFonts.inter(
                                              color: const Color(0xff4A6C94),
                                            ))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Column(
                                children: [
                                  SizedBox(
                                    child: TextField(
                                        decoration: InputDecoration(
                                          prefixIcon: SizedBox(
                                            width: 18,
                                            height: 20,
                                            child: Image.asset("assets/icons/call_phone.png"),
                                          ),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xffCFD3D4),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xff4A6C94))),
                                            labelText: "Phone number",
                                            labelStyle: GoogleFonts.inter(
                                              color: const Color(0xff4A6C94),
                                            ))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Column(
                                children: [
                                  SizedBox(
                                    child: TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xffCFD3D4),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xff4A6C94))),
                                            labelText: "Proof of Identity",
                                            labelStyle: GoogleFonts.inter(
                                              color: const Color(0xff4A6C94),
                                            ))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              Container(
                                height: 78,
                                decoration: BoxDecoration(
                                  color: const Color (0xffE9F6FF),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/icons/Camera.png"),
                                    const SizedBox(width: 8,),
                                    Text(
                                      "Upload image or Use camera",
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: const Color (0xff4A6C94)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Container(
                                width: 400,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color (0xff4A6C94),
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: GestureDetector(
                                  onTap: () => {
                                    Navigator.pushNamed(context, '/homepage')
                                  },
                                  child: Center(
                                    child: Text("Submit request",
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: Colors.white
                                    ),),
                                  ),
                                ),
                              )
                            ],
                          )),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
