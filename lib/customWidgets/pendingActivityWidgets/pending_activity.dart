import 'package:flutter/material.dart';
import 'package:deeply_us_project/customWidgets/pendingActivityWidgets/no_of_days.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PendingAnswer extends StatefulWidget {
  const PendingAnswer({Key? key}) : super(key: key);

  @override
  State<PendingAnswer> createState() => _PendingAnswerState();
}

class _PendingAnswerState extends State<PendingAnswer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    double screenHeight = MediaQuery.of(context).size.width;
    double widthLayout = screenWidth*0.25;
    String pendingQuestion = 'What is one item on your partner\'s bucket list.....';
    String pendingQuestionCategory = 'Love';
    return Material(
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Center(
          child: Container(
            width: widthLayout,
            height: widthLayout * 1.025,
            decoration: BoxDecoration(
              color: const Color(0xFFff9797),
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 0),
                  blurRadius: 30.027416229248047,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                // Upper Part with the same color
                Container(
                  height: widthLayout * 1.025 - (widthLayout * 1.025) / 3.9,
                  width: widthLayout,
                  decoration: const BoxDecoration(
                    color: Color(0xFFff9797),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 15,
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.question,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            SizedBox(width: screenWidth*0.005,),
                            const Text(
                              '\u2022',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(width: screenWidth*0.005,),
                            Text(
                              pendingQuestionCategory,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -screenWidth*0.016,
                        top: screenHeight*0.03,
                        child: SizedBox(
                          height: screenHeight*0.1,
                          width: screenWidth*0.1,
                          child: NoOfDaysWidget(
                            days: 95,
                            height: screenHeight*0.1,
                            width: screenWidth*0.1,
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenHeight*0.05,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(screenWidth*0.02 , screenHeight*0.1 , 0 , 0),
                          child: SizedBox(
                            height: screenHeight*0.5,
                            width: screenWidth*0.18,
                            child: Text(
                              pendingQuestion,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: screenHeight*0.05,
                        right: screenWidth*0.015,
                        child: SizedBox(
                          height: screenHeight*0.05,
                          width: screenWidth*0.05,
                          child: OverflowBox(
                            maxWidth: screenHeight*0.2,
                            maxHeight: screenWidth*0.2,
                            child: Image.asset('assets/pendingActivityAvatar.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Lower Part with white color
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    print('button pressed');
                  },
                  child: Container(
                    height: (widthLayout * 1.025) / 3.9,
                    width: widthLayout,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth*0.02 , 0 , screenWidth*0.02 , 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.answerNow,
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: const Color(0xFF10b5a6),
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            width: screenWidth*0.035,
                            height: screenWidth*0.035,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF10b5a6),
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color(0xFF10b5a6),
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
