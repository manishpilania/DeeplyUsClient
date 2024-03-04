import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/response/api_service.dart';

class temo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email Post Example',
      home: EmailPostScreen(),
    );
  }
}

class EmailPostScreen extends StatefulWidget {
  @override
  _EmailPostScreenState createState() => _EmailPostScreenState();
}

class _EmailPostScreenState extends State<EmailPostScreen> {


  Future<void> _postData() async {
    List<String> userIds = [
      'utkarsh4pandey@gmail.com',
      'utkarsh6pandey@gmail.com',
    ];

    String apiUrl = 'https://2b08-122-161-50-227.ngrok-free.app/partnership/add-partnership'; // Replace with your API URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers:{
          'Content-Type': 'application/json'
        },
        body: jsonEncode(userIds)
      );

      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      } else {
        print('Failed to post emails. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error posting emails: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Email IDs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            fetchDailyQuestion();
          },
          child: const Text('Make - partnership'),
        )
      ),
    );
  }
}
