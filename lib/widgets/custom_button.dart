import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
    // return ElevatedButton(
    //   onPressed: onPressed, 
    //   style: ButtonStyle(
    //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    //     backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
    //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(25.0),
    //     ),)
    //   ),
    //   child: Text(text, style: TextStyle(fontSize: 16)),);
  }
}