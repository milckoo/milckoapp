import 'package:flutter/material.dart';
import 'package:milckoapk/Screens/home_screen.dart';
import 'package:milckoapk/Screens/registration_screen.dart';
import 'package:milckoapk/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome-screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Center(child: const Text('Phone Image')),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          const Text("Let's get started",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 10,
          ),
          const Text('Never a better time than now to Start',style: TextStyle(color: Colors.grey),),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                        onPressed: (){
                          print('Navigated from Welcome screen');
                          ap.isSignedIn == true? 
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context)=> const HomeScreen())):

                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context)=> const RegistrationScreen()));
                        }, 
                        style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          ),),
                        ),
                        child: const Text('Get Started', style: TextStyle(fontSize: 16)),),
                            ),
          )
        ],),
    );
  }
}