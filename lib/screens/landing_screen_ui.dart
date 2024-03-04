import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deeply_us_project/configs/routes/routes_names.dart';
import 'package:deeply_us_project/main.dart';
import 'package:deeply_us_project/functionalities/screen_util_logic.dart';

class LandingScreenUi extends StatefulWidget {
  const LandingScreenUi({Key? key}) : super(key: key);

  @override
  State<LandingScreenUi> createState() => _LandingScreenUiState();
}

class _LandingScreenUiState extends State<LandingScreenUi> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(34.5.w, 3.h, 15.34.w, 52.h),
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
                padding: EdgeInsets.fromLTRB(0, 0.1.sh, 0, 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Connect deeply',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF00B0A0),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'with your loved one!',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF00B0A0),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 0.06.sh),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          height: 0.30.sh,
                          width: 0.82.sw,
                          child: Image.asset(
                            'assets/deeplyUsLoginImage.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 0.06.sh),
                      SizedBox(
                       // height: 44.h,
                        width: 0.6.sw,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const SignInScreenUi()),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00B0A0),
                            padding: EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.03.sh),
                      SizedBox(
                        width: 0.6.sw,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RoutesName.signUp);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFFFFF),
                            padding: EdgeInsets.all(16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: const Color(0xFF00B0A0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 0.03.sh),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1.h,
                            width: 0.1.sw,
                            color: const Color(0xFF979797),
                          ),
                          SizedBox(width: 0.02.sw),
                          Text(
                            'or',
                            style: const TextStyle(color: Color(0xFF979797), fontSize: 12),
                          ),
                          SizedBox(width: 0.02.sw),
                          Container(
                            height: 1.h,
                            width: 0.1.sw,
                            color: const Color(0xFF979797),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02.sh),
                      Center(
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Image.asset(
                              'assets/googleLogo.png',
                              height: 40.h,
                              width: 40.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 180.h,
              width: 180.w,
              child: Image.asset('assets/ringImageSignIn.png'),
            ),
            Positioned(
              top: 0.53.sh,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 90.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/emailmobileicon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.23.sh,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 500.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/leftringkandingscreen.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 300.h,
                width: 150.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/rightringlandingscreen.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 200.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/rightringlandingscreen.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
