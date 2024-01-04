import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signinscreen.dart';
import 'signupscreen.dart';

class landingscreenui extends StatefulWidget {
  const landingscreenui({super.key});

  @override
  State<landingscreenui> createState() => _landingscreenuiState();
}

class _landingscreenuiState extends State<landingscreenui> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(34.5, 3, 15.34, 52),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-1.569, 2.11),
                    end: Alignment(1.546, -1.912),
                    colors: <Color>[
                      Color(0x33fed3c2),
                      Color(0x3300b0a0),
                      Color(0x3300d7c4),
                    ],
                    stops: <double>[0.171, 0.978, 0.978],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0 , screenWidth*0.2 , 0 , 0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            'Connect deeply',
                            style: GoogleFonts.poppins
                              (
                              color: const Color(0xFF00B0A0), // Use the color #00B0A0
                              fontSize: 24,// Adjust the font size as needed
                              fontWeight: FontWeight.w600,
                            )),
                         Text(
                            'with your loved one!',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF00B0A0), // Use the color #00B0A0
                              fontSize: 24,// Adjust the font size as needed
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(height: screenHeight*0.06,),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                            height: screenHeight*0.30,
                            width: screenWidth*0.82,
                            child: Image.asset(
                              'assets/deeplyUsLoginImage.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight*0.06,),
                        SizedBox(
                          height: 44,
                          width: screenWidth*0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => signinscreenui()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF00B0A0),
                              padding:const EdgeInsets.all(16.0),
                              visualDensity: VisualDensity.compact,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              'SIGN IN',
                              style: GoogleFonts.poppins(fontSize: 16.0 , fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight*0.03,),
                        SizedBox(
                          width: screenWidth*0.6,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const signupuiscreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary:const Color(0xFFFFFFFF),
                              padding:const EdgeInsets.all(16.0),
                              visualDensity: VisualDensity.compact,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child:  Text(
                              'SIGN UP',
                              style: GoogleFonts.poppins(fontSize: 16.0,
                                color: Color(0xFF00B0A0),
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight*0.03,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: screenWidth*0.1,
                              color: const Color(0xFF979797),
                            ),
                            SizedBox(width: screenWidth*0.02,),
                            const Text(
                              "OR",
                              style: TextStyle(color: Color(0xFF979797), fontSize: 12),
                            ),
                            SizedBox(width: screenWidth*0.02,),
                            Container(
                              height: 1,
                              width: screenWidth*0.1,
                              color: const Color(0xFF979797),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight*0.02,),
                        Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Image.asset(
                                'assets/googleLogo.png',
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Your other widgets go here
              ),
              Container(
                height: 180,
                width: 180,
                child: Image.asset('assets/ringImageSignIn.png'),
              ),
              Positioned(
                top: screenHeight*0.53,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 90,
                    width: 70,
                    decoration:const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/emailmobileicon.png'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight*0.23,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 500,
                    width: 200,
                    decoration:const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/leftringkandingscreen.png'),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 300,
                  width: 150,
                  decoration:const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/rightringlandingscreen.png'),
                          fit: BoxFit.fill
                      )
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 200,
                  width: 100,
                  decoration:const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/rightringlandingscreen.png'),
                          fit: BoxFit.fill
                      )
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
