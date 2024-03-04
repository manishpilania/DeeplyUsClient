import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../customWidgets/dailyQuestionWidgets/one_answered_pender.dart';
import '../customWidgets/dailyQuestionWidgets/one_answered_answerer.dart';
import '../customWidgets/dailyQuestionWidgets/both_answered_seen.dart';
import '../customWidgets/pendingActivityWidgets/pending_activity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final int numberOfChildren = 10;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Initialize ScreenUtil

    String name = "Sam";

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.w, 0.07.sh, 0.008.sw, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.hello,
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            color: const Color(0xFF3BC2B6),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          name,
                          style: GoogleFonts.poppins(
                            fontSize: 26.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 28.w,
                            height: 30.h,
                            child: Image.asset('assets/dailyquestionavatar1.png'),
                          ),
                        ),
                        const SizedBox(width: 2),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            width: 26.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Image.asset('assets/PlusButtonLayout2B.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //SizedBox(height: 0.0001.sh),
              Padding(
                padding: EdgeInsets.fromLTRB(0.06.sw , 0 , 0.06.sw, 0),
                child: SizedBox(
                    width: 1.sw,
                    height: 0.38.sh,
                    child: const layoutThird()),
              ),
              SizedBox(height: 0.0015.sh),
              Padding(
                padding: EdgeInsets.only(left: 0.03.sw),
                child: Text(
                  AppLocalizations.of(context)!.pending,
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 0.01.sh),
              Padding(
                padding: EdgeInsets.only(left: 0.03.sw),
                child:Container(
                  height: 0.26.sh,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: numberOfChildren,
                    itemBuilder: (context, index) {
                      return const PendingAnswer();
                    },
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
