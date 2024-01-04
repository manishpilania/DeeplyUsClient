import 'package:flutter/material.dart';

class neumorphismDesign extends StatefulWidget {
  const neumorphismDesign({super.key});

  @override
  State<neumorphismDesign> createState() => _neumorphismDesignState();
}

class _neumorphismDesignState extends State<neumorphismDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Container(
         height: 200,
         width: 200,
         decoration: BoxDecoration(
           color: Colors.white.withOpacity(0.3),
           borderRadius: BorderRadius.circular(30),
           boxShadow: const [BoxShadow(
             blurRadius: 15,
               color: Color(0xFFA7A9AF)
           )],
         ),
        
       ),
      ),
    );
  }
}
