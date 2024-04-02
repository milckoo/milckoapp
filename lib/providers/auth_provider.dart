import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:milckoapk/Screens/otp_screen.dart';
import 'package:milckoapk/models/user_model.dart';
import 'package:milckoapk/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{

// for sign in
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn; 

// for otp verification
  bool _isLoading = false;
  bool get isLoading => _isLoading;

// user details
  String? _uid;
  String get uid => _uid!;

  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  AuthProvider(){
    checkSignIn();
  }
  void checkSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();

    _isSignedIn = s.getBool("is_signed_in") ?? false;
    notifyListeners();
  }
  // SIGN IN FUNCTION 
  void signInWithPhone(BuildContext context,String phoneNumber) async {
    print('ENTRED SIGN IN  WITH PHONE METHOD');
    try {
      print('ENTRED TRY BLOCL');
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);// only when the OTP is completed
        }, 
        verificationFailed: (error){
          print('VERIFICATION FAILED');
          throw Exception(error.message);// in case of any error
        }, 
        codeSent: (verificationId, forceResendingToken) {
          print('EXECUTED CODE SENT');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OtpScreen(verificationId: verificationId,)),
          );
        }, 
        codeAutoRetrievalTimeout: (verificationId) {},
        );
    } on FirebaseAuthException catch(e){
      showSnackbar(context, e.message.toString());
    }
  }
  // OTP VERIFICATION
  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userotp,
    required Function OnSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try{
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
        verificationId: verificationId,smsCode: userotp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;

      if(user != null){
        // carry logic
        _uid = user.uid;

        OnSuccess();
      }
      _isLoading = false;
      notifyListeners();
    }  on FirebaseAuthException catch (e){
      showSnackbar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  // DATA BASE OPERATION
  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot = await _firebaseFirestore.collection("users").doc(uid).get();
    if(snapshot.exists){
      print('USER EXISTS');
      return true;
    }
    else{
      print('NEW USER');
      return false;
    }
  }
  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required Function OnSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try{
      userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
      //userModel.location = _firebaseAuth.currentUser!.location!;
      userModel.uid = _firebaseAuth.currentUser!.uid;
      _userModel = userModel;

      //uploading to data base
      await _firebaseFirestore
      .collection("users")
      .doc(_uid)
      .set(userModel.toMap())
      .then((value) => {
        OnSuccess(),
        _isLoading = false,
        notifyListeners(),
      });
    } on FirebaseAuthException catch(e){
      showSnackbar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }
}
