import 'package:deeply_us_project/data/response/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deeply_us_project/models/sign_in_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SignInScreenUi extends StatefulWidget {
  const SignInScreenUi({super.key});

  @override
  State<SignInScreenUi> createState() => _SignInUiScreenState();
}

class _SignInUiScreenState extends State<SignInScreenUi> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Initialize screen_util
    double screenWidth = MediaQuery.of(context).size.height;
    double screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
         children: [
           Positioned(
             top: 0,
             left: 0,
             child: SizedBox(
               height: 1.sh,
               width: 1.sw,
               child: Image.asset('assets/ringImageSignIn.png'),
             ),
           ),
           Container(
             width: screenWidth,
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
               padding: EdgeInsets.fromLTRB(0, screenHeight*0.2, 0, 0),
               child: Column(
                 children: [
                   SizedBox(
                     height: 0.25.sh,
                     width: 0.6.sw,
                     child: Image.asset(
                       'assets/deeplyUsLoginImage.png',
                     ),
                   ),
                   SizedBox(height: 0.02.sh,),
                   Container(
                     width: screenWidth,
                     color: Colors.transparent,
                     child: Container(
                         decoration: const BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(40.0),
                               topRight: Radius.circular(40.0),
                             )
                         ),
                         child: Padding(
                           padding: EdgeInsets.fromLTRB(screenWidth*0.04, 0.02.sh, screenWidth*0.04, 0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text( AppLocalizations.of(context)!.signInn, style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                               SizedBox(height:0.01.sh,),
                               Text('${AppLocalizations.of(context)!.clickHere}*' , style: GoogleFonts.poppins(fontSize: 14.sp , color: const Color(0xFF807A7A), fontWeight: FontWeight.w500),),
                               SizedBox(height:0.01.sh,),
                               SizedBox(
                                 height: 0.06.sh,
                                 child: TextField(
                                   controller: _emailController,
                                   decoration: InputDecoration(
                                     hintText: 'email@email.com',
                                     hintStyle: GoogleFonts.poppins(
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14.sp
                                     ),
                                     border: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10.0),
                                     ),
                                     contentPadding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10),
                                   ),
                                 ),
                               ),
                               SizedBox(height:0.01.sh,),
                               Text('${AppLocalizations.of(context)!.password}*' , style: GoogleFonts.poppins(fontSize: 14.sp , color: const Color(0xFF807A7A), fontWeight: FontWeight.w500),),
                               SizedBox(height:0.01.sh,),
                               SizedBox(
                                 height: 0.06.sh,
                                 child: TextField(
                                   controller: _passwordController,
                                   obscureText: true,
                                   decoration: InputDecoration(
                                     hintText: AppLocalizations.of(context)!.enterPassword,
                                     hintStyle: GoogleFonts.poppins(
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14.sp
                                     ),
                                     border: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10.0),
                                     ),
                                     contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                     suffixIcon:const  Icon(Icons.lock_outlined),
                                   ),
                                 ),
                               ),

                               SizedBox(height:0.025.sh,),
                               SizedBox(
                                 width: screenWidth * 0.6,
                                 child: Row(
                                   children: [
                                     Expanded(
                                       child: SizedBox(
                                         height: 44,
                                         child: ElevatedButton(
                                           onPressed: () => _saveData(_emailController, _passwordController),
                                           style: ElevatedButton.styleFrom(
                                             backgroundColor: const Color(0xFF00B0A0),
                                             padding: const EdgeInsets.all(16.0),
                                             visualDensity: VisualDensity.compact,
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(10.0),
                                             ),
                                           ),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Text(
                                                 AppLocalizations.of(context)!.signIn,
                                                 textAlign: TextAlign.center,
                                                 style: GoogleFonts.poppins(fontSize: 16.0 , fontWeight: FontWeight.w600),
                                               ),
                                               SizedBox( width: screenWidth*0.01,),
                                               Container(
                                                 width: 30, // Diameter of the circle (twice the radius)
                                                 height: 30, // Diameter of the circle (twice the radius)
                                                 decoration: const BoxDecoration(
                                                   shape: BoxShape.circle,
                                                   color: Color(0xFF007267),
                                                 ),
                                                 child: const Center(
                                                   child: Icon(
                                                     Icons.arrow_forward,
                                                     color: Colors.white,
                                                     size: 20, // Size of the arrow icon (radius)
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
                               SizedBox(height:0.02.sh,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Container(
                                     height: 1,
                                     width: screenWidth*0.1,
                                     color: const Color(0xFF979797),
                                   ),
                                   SizedBox(width: screenWidth*0.02,),
                                   Text(
                                     AppLocalizations.of(context)!.or,
                                     style: const TextStyle(color: Color(0xFF979797), fontSize: 12),
                                   ),
                                   SizedBox(width: screenWidth*0.02,),
                                   Container(
                                     height: 1,
                                     width: screenWidth*0.1,
                                     color: const Color(0xFF979797),
                                   ),
                                 ],
                               ),
                               SizedBox(height:0.02.sh,),
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
                               SizedBox(height:0.01.sh,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children:[
                                   Text('${AppLocalizations.of(context)!.dontHaveAnAccount}?', style: GoogleFonts.poppins(fontSize: 16 , color: const Color(0xFF807A7A), fontWeight: FontWeight.w600),),
                                   SizedBox(width: screenWidth*0.01,),
                                   Text(AppLocalizations.of(context)!.signUpp, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF00B0A0) ),)
                                 ],
                               ),
                               Align(
                                 alignment: Alignment.bottomCenter,
                                 child: Image.asset('assets/bellImageIcon.png',
                                   height: 65,
                                   width: 65,
                                 ),
                               )
                             ],
                           ),
                         )
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ],
        ),
      )
    );
  }
  Future<void> _saveData(TextEditingController email, TextEditingController password) async {
    await saveSignInData(email, password); // Call the function from api_service.dart
  }
}
