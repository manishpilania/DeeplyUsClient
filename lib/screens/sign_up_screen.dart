import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deeply_us_project/models/sign_up_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SignUpUiScreen extends StatefulWidget {
  const SignUpUiScreen({super.key});

  @override
  State<SignUpUiScreen> createState() => _SignUpUiScreenState();
}

class _SignUpUiScreenState extends State<SignUpUiScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController = TextEditingController();

  Future<void> _saveData() async {
    // Extracting text from controllers
    String userName = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String verifyPassword = _verifyPasswordController.text;
    // Basic password verification
    if (password != verifyPassword) {
      if(kDebugMode) {
        print('Password and Verify Password do not match.');
      }
      return;
    }
    // Create a SignupUser object using the entered data
    SignupUser signupUser = SignupUser(
      userName: userName,
      email: email,
      password: password,
    );
    // Convert the SignupUser object to JSON
    Map<String, dynamic> userData = signupUser.toJson();

    if(kDebugMode) {
      print(userData);
    }

    // API endpoint to send the user data
    const String apiUrl = 'https://2b08-122-161-50-227.ngrok-free.app/auth/signup/internal';

    // Send the data to the API
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        // Successfully signed up
        if(kDebugMode) {
          print('User signup successful!');
        }

      } else {
        // Handle the error
        if(kDebugMode) {
          print('Failed to signup. Status code: ${response.statusCode}');
        }

        if(kDebugMode) {
          print('Response body: ${response.body}');
        }

      }
    } catch (error) {

      if(kDebugMode) {
        print('Error during signup: $error');
      }
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
                padding: const EdgeInsets.fromLTRB(0, 63, 0, 0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 193,
                      width: 248,
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
                                Text(AppLocalizations.of(context)!.signUp, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),),
                                SizedBox(height:screenHeight*0.04,),
                                Text('${AppLocalizations.of(context)!.userName}*', style: GoogleFonts.poppins(fontSize: 14 , color: const Color(0xFF807A7A), fontWeight: FontWeight.w500),),
                                SizedBox(height:screenHeight*0.03,),
                                SizedBox(
                                  height: 38,
                                  child: TextField(
                                    controller: _usernameController,
                                    decoration: InputDecoration(
                                      hintText: AppLocalizations.of(context)!.userName,
                                      hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      contentPadding:const  EdgeInsets.symmetric(vertical: 10.0),
                                      prefixIcon:const  Icon(Icons.account_circle_outlined),
                                    ),
                                  ),
                                ),
                                SizedBox(height:screenHeight*0.04,),
                                Text('${AppLocalizations.of(context)!.emailId}*' , style: GoogleFonts.poppins(fontSize: 14 , color: const Color(0xFF807A7A), fontWeight: FontWeight.w500),),
                                SizedBox(height:screenHeight*0.03,),
                                SizedBox(
                                  height: 38,
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
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                                      prefixIcon:const  Icon(Icons.email_outlined),
                                    ),
                                  ),
                                ),
                                SizedBox(height:screenHeight*0.04,),
                                Text('${AppLocalizations.of(context)!.password}*' , style: GoogleFonts.poppins(fontSize: 14 , color: const Color(0xFF807A7A), fontWeight: FontWeight.w500),),
                                SizedBox(height:screenHeight*0.03,),
                                SizedBox(
                                  height: 38,
                                  child: TextField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      hintText: '${AppLocalizations.of(context)!.enterPassword}*' ,
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                                      prefixIcon:const  Icon(Icons.lock_outlined),
                                    ),
                                  ),
                                ),
                                SizedBox(height:screenHeight*0.04,),
                                Text('${AppLocalizations.of(context)!.verifyPassword}*' , style: GoogleFonts.poppins(fontSize: 14 , color: const Color(0xFF807A7A), fontWeight: FontWeight.w500),),
                                SizedBox(height:screenHeight*0.03,),
                                SizedBox(
                                  height: 38,
                                  child: TextField(
                                    controller: _verifyPasswordController,
                                    decoration: InputDecoration(
                                      hintText: '${AppLocalizations.of(context)!.confirmPassword}*',
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                                      prefixIcon:const  Icon(Icons.lock_outlined),
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
                                                  AppLocalizations.of(context)!.signUp ,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(fontSize: 16.0),
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
                                SizedBox(height:screenHeight*0.04,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                    Text('${AppLocalizations.of(context)!.alreadyHaveAnAccount}?' , style: GoogleFonts.poppins(fontSize: 16 , color: const Color(0xFF807A7A), fontWeight: FontWeight.w600),),
                                    SizedBox(width: screenWidth*0.01,),
                                    Text(AppLocalizations.of(context)!.login, style: GoogleFonts.poppins(fontSize: 16, color: const Color(0xFF00B0A0), fontWeight: FontWeight.w600),)
                                  ],
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
            SizedBox(
              height: 160,
              width: 160,
              child: Image.asset('assets/ringImageSignIn.png'),
            ),
          ],
        ),
      )
    );
  }

}
