import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deeply_us_project/models/signinmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class signinscreenui extends StatefulWidget {
  const signinscreenui({super.key});

  @override
  State<signinscreenui> createState() => _signinuiscreenState();
}

class _signinuiscreenState extends State<signinscreenui> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _saveData() async {
    // Create a User object using the entered data
    SignInUser signinuser = SignInUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    // Convert the User object to JSON
    Map<String, dynamic> userData = signinuser.toJson();
    print(userData);

    const String SignInapiUrl = 'https://b387-122-161-48-42.ngrok-free.app/auth/signin/internal';

    try {
      final response = await http.post(
        Uri.parse(SignInapiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        // Successfully signed up
        print('User signIn successful!');
      } else {
        // Handle the error
        print('Failed to signin. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error during signIn: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.height;
    double screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
         children: [
           Positioned(
             top: 0,
             left: 0,
             child: Container(
               height: 150,
               width: 150,
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
                   Container(
                     height: screenHeight*0.5,
                     width: screenWidth*0.5,
                     child: Image.asset(
                       'assets/deeplyUsLoginImage.png',
                     ),
                   ),
                   SizedBox(height: screenHeight*0.05,),
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
                           padding: EdgeInsets.fromLTRB(screenWidth*0.04, screenHeight*0.06, screenWidth*0.04, 0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Sign In' , style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),),
                               SizedBox(height:screenHeight*0.06,),
                               Text('Email id*' , style: GoogleFonts.poppins(fontSize: 14 , color: const Color(0xFF807A7A), fontWeight: FontWeight.w500),),
                               SizedBox(height:screenHeight*0.03,),
                               SizedBox(
                                 height: screenHeight*0.1,
                                 child: TextField(
                                   controller: _emailController,
                                   decoration: InputDecoration(
                                     hintText: 'email@email.com',
                                     hintStyle: GoogleFonts.poppins(
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14
                                     ),
                                     border: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10.0),
                                     ),
                                     contentPadding: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 10),
                                   ),
                                 ),
                               ),
                               SizedBox(height:screenHeight*0.06,),
                               Text('Password*' , style: GoogleFonts.poppins(fontSize: 14 , color: const Color(0xFF807A7A), fontWeight: FontWeight.w500),),
                               SizedBox(height:screenHeight*0.03,),
                               SizedBox(
                                 height: screenHeight*0.1,
                                 child: TextField(
                                   controller: _passwordController,
                                   obscureText: true,
                                   decoration: InputDecoration(
                                     hintText: 'Enter Password',
                                     hintStyle: GoogleFonts.poppins(
                                         fontWeight: FontWeight.w400,
                                         fontSize: 14
                                     ),
                                     border: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10.0),
                                     ),
                                     contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                     suffixIcon:const  Icon(Icons.lock_outlined),
                                   ),
                                 ),
                               ),

                               SizedBox(height:screenHeight*0.06,),
                               SizedBox(
                                 width: screenWidth * 0.6,
                                 child: Row(
                                   children: [
                                     Expanded(
                                       child: SizedBox(
                                         height: 44,
                                         child: ElevatedButton(
                                           onPressed: _saveData,
                                           style: ElevatedButton.styleFrom(
                                             primary: const Color(0xFF00B0A0),
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
                                                 'SIGN IN',
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
                               SizedBox(height:screenHeight*0.06,),
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
                               SizedBox(height:screenHeight*0.06,),
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
                               SizedBox(height:screenHeight*0.03,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children:[
                                   Text('Don\'t have an account?' , style: GoogleFonts.poppins(fontSize: 16 , color: const Color(0xFF807A7A), fontWeight: FontWeight.w600),),
                                   SizedBox(width: screenWidth*0.01,),
                                   Text('Sign up' , style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF00B0A0) ),)
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
}
