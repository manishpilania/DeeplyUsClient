import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GoogleSignInLogic extends StatefulWidget {
  const GoogleSignInLogic({Key? key}) : super(key: key);

  @override
  State<GoogleSignInLogic> createState() => _GoogleSignInLogicState();
}


class _GoogleSignInLogicState extends State<GoogleSignInLogic> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if(kDebugMode) {
        print(googleUser);
      }

      if (googleUser == null)
      {
        if(kDebugMode) {
          print('User cancelled sign in');
        }

        return; // User canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      if(kDebugMode) {
        print(googleAuth);
      }

      // Obtain the auth details
      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;

      if(kDebugMode) {
        print(accessToken);
      }

      if(kDebugMode) {
        print(idToken);
      }

      // Send these tokens to your server for validation and session token generation
      if(accessToken!= null && idToken!=null) {
        await sendTokensToServer(accessToken, idToken);
      }

      // Handle successful sign-in, e.g., navigate to the main app screen
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (error) {
      // Handle sign-in errors appropriately
      if(kDebugMode) {
        print('Sign-in failed: $error');
      }
    }
  }

  Future<void> sendTokensToServer(String accessToken, String idToken) async {
    const serverEndpoint =
        'https://e790-122-161-50-210.ngrok-free.app/auth/google'; // Replace with your server's API endpoint

    try {
      final response = await http.post(
        Uri.parse(serverEndpoint),
        body: {
          'credential': idToken,
        },
      );

      if (response.statusCode == 200) {
        // Successfully sent tokens to the server
        // You can handle the server's response here
        if(kDebugMode) {
          print('Tokens sent successfully');
        }
      } else {
        // Handle server errors
        if(kDebugMode) {
          print('Server error: ${response.statusCode}');
        }
      }
    } catch (error) {
      // Handle network errors
      if(kDebugMode) {
        print('Network error: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handleSignIn,
          child: const Text('Sign In with Google'),
        ),
      ),
    );
  }
}
