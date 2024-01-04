import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class layoutSecond extends StatefulWidget {
  const layoutSecond({super.key});

  @override
  State<layoutSecond> createState() => _layoutSecondState();
}

class _layoutSecondState extends State<layoutSecond> {
  @override
  Widget build(BuildContext context) {
    //final GlobalKey<SlideActionState> _key = GlobalKey();
    double screenWidth = MediaQuery.of(context).size.height;
    double screenHeight = MediaQuery.of(context).size.width;

    return Material(
      child: Center(
        child: Container(
          width: 316,
          height: 300,
          decoration: BoxDecoration(
              color: const Color(0xFF3BC2B6),
              borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                offset: const Offset(30, 30),
                blurRadius: 70.3,
                spreadRadius: -22,
                color: Colors.black.withOpacity(0.4),
              ),
              BoxShadow(
                offset: const Offset(-30, -30),
                blurRadius: 100,
                spreadRadius: 10,
                color: const Color(0xFBFFFFE5).withOpacity(0.9),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 19, top: 21),
                    child: Text(
                      'Daily Question',
                      style: GoogleFonts.poppins(
                        textStyle:const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 19 , top: 21),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.62),
                        borderRadius: BorderRadius.circular(109)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text('Answered' ,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              width: 28.63,
                              height: 31.89,
                              child: Image.asset('assets/dailyquestionavatar1.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight*0.08,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('What is one item on your partner\'s bucket list that they haven\'t mentioned to you yet?',
                  textAlign:  TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight*0.08,),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(),
                  child: Container(
                    height: 56,
                    width: 292,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color:  Color(0xff37a0a0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 21),
                          child: Text('Answer Now',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 44, // Diameter of the circle (twice the radius)
                            height: 44, // Diameter of the circle (twice the radius)
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFC9E5E5),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 1.899999976158142,
                                  spreadRadius: 0,
                                  color: Color(0x12000000).withOpacity(0.07), // The first two digits (12) represent the alpha (opacity)
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color(0xff37a0a0),
                                size: 33, // Size of the arrow icon (radius)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}