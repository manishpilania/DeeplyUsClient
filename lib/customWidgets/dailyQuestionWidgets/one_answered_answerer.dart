import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutSecondB extends StatefulWidget {
  const LayoutSecondB({super.key});

  @override
  State<LayoutSecondB> createState() => LayoutSecondBState();
}

class LayoutSecondBState extends State<LayoutSecondB> {
  @override
  Widget build(BuildContext context) {
    //final GlobalKey<SlideActionState> _key = GlobalKey();
    double screenWidth = MediaQuery.of(context).size.height;
    double screenHeight = MediaQuery.of(context).size.width;
    double layoutWidth = screenWidth*0.4;
    double layoutHeight = screenHeight*0.75;

    return Material(
      child: Center(
        child: Container(
          width: layoutWidth,
          height: layoutHeight,
          decoration: BoxDecoration(
            color: const Color(0xFF3BC2B6),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 70.3,
                spreadRadius: -22,
                color: Colors.black.withOpacity(0.1),
              ),
              BoxShadow(
                offset: const Offset(-2, -2),
                blurRadius: 10,
                spreadRadius: 1,
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
                    padding: const EdgeInsets.only(left: 19, top: 10),
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
                    padding: const EdgeInsets.only(right: 19 , top: 10),
                    child: Container(
                      height: 40,
                      width: 74,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.62),
                          borderRadius: BorderRadius.circular(109)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child:SizedBox(
                              width: 28.63,
                              height: 31.89,
                              child: Image.asset('assets/dailyquestionavatar1.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              width: 26,
                              height: 23,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                              ),
                              child: Image.asset('assets/PlusButtonLayout2B.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight*0.1,),
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth*0.01 , 0 , screenWidth*0.01 , 0),
                child: Text('What is one item on your partner\'s bucket list that they haven\'t mentioned to you yet?',
                  textAlign:  TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight*0.1,),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(),
                  child: Container(
                    height: layoutHeight*0.2,
                    width: layoutWidth*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color:  const Color(0xff37a0a0),
                      boxShadow: [
                        BoxShadow(
                          offset:  const Offset(0, 4),
                          blurRadius: 1.899999976158142,
                          spreadRadius: 1,
                          color: const Color(0x12000000).withOpacity(0.07), // The first two digits (12) represent the alpha (opacity)
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 21),
                          child: Text('View Answer',
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFC9E5E5),
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