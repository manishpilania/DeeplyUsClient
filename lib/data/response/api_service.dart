import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:deeply_us_project/models/sign_in_model.dart';
import '../../models/sign_up_model.dart';

String ids = '1';

Future<void> saveSignInData(TextEditingController email, TextEditingController password) async {
  // Create a SignInUser object using the entered data
  SignInUser signInUser = SignInUser(
    email: email.toString(),
    password: password.toString(),
  );
  // Convert the SignInUser object to JSON
  Map<String, dynamic> userData = signInUser.toJson();

  if (kDebugMode) {
    print(userData);
  }

  const String signInApiUrl = 'https://b387-122-161-48-42.ngrok-free.app/auth/signin/internal';

  try {
    final response = await http.post(
      Uri.parse(signInApiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      // Successfully signed up
      if (kDebugMode) {
        print('User signIn successful!');
      }
    } else {
      // Handle the error
      if (kDebugMode) {
        print('Failed to signin. Status code: ${response.statusCode}');
      }
      if (kDebugMode) {
        print('Response body: ${response.body}');
      }
    }
  } catch (error) {
    if (kDebugMode) {
      print('Error during signIn: $error');
    }
  }
}

Future<void> saveSignUpData(TextEditingController userName, TextEditingController password, TextEditingController email, TextEditingController verifyPassword) async {
  // Extracting text from controllers

  // Basic password verification
  if (password != verifyPassword) {
    if(kDebugMode) {
      print('Password and Verify Password do not match.');
    }
    return;
  }
  // Create a SignupUser object using the entered data
  SignupUser signupUser = SignupUser(
    userName: userName.toString(),
    email: email.toString(),
    password: password.toString(),
  );
  // Convert the SignupUser object to JSON
  Map<String, dynamic> userData = signupUser.toJson();

  if(kDebugMode) {
    print(userData);
  }

  // API endpoint to send the user data
  const String apiUrl = 'https://b387-122-161-48-42.ngrok-free.app/auth/signup/internal';

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

Future<void> fetchActivityStatus() async {
  const String apiUrl = ''; // Replace with your API URL

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final id = jsonResponse['id'];
      final stages = jsonResponse['Stages'];

      // Now you can use the id and stages however you need
      if(kDebugMode)
        {
          print('ID: $id');
        }
      if(kDebugMode)
        {
          print('Stages: $stages');
        }
    } else {
      if(kDebugMode)
        {
          print('Failed to fetch data. Status code: ${response.statusCode}');
        }
    }
  } catch (error) {
    if(kDebugMode)
      {
        print('Error fetching data: $error');
      }
  }
}

Future<void> partnershipID() async {
  // Define the API URL
  String apiUrl = 'https://deeplyuspreprod.azurewebsites.net/partnership/daily-question';

  try {
    // Make a POST request to the API URL with the string "xyz" as the body
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode('00000000-0000-0000-0000-000000000000'),
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Parse the JSON response body
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      // Extract id and userStages from the data
      String id = responseBody['data']['id'];
      Map<String, String> userStages = Map<String, String>.from(responseBody['data']['userStages']);

      // Store id and userStages in the system
      // Replace this with your logic to store the id and userStages
      print('ID: $id');
      ids = id;
      print('User Stages: $userStages');
    } else {
      // Request failed, print error message
      if(kDebugMode)
      {
        print('Failed to post data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }
  } catch (error) {
    // Catch any errors that occur during the request
    if(kDebugMode) {
      print('Error posting data: $error');
    }
  }
}

Future<void> fetchDailyQuestion() async {
  try {
    // Make a POST request to post data to the API URL
    final response = await http.post(
      Uri.parse('https://deeplyuspreprod.azurewebsites.net/question/get'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode('1'
      ),
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Post request successful, print response body
      print('Data posted successfully');
      print('Response body: ${response.body}');
    } else {
      // Post request failed, print error message
      print('Failed to post data. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (error) {
    // Catch any errors that occur during the request
    print('Error posting data: $error');
  }
}




