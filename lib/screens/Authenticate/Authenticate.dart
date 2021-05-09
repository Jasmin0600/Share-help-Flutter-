import 'package:flutter/material.dart';
import 'package:share_help/screens/Authenticate/Register.dart';
import 'package:share_help/screens/Authenticate/sign_in.dart';
import 'package:share_help/screens/Authenticate/Register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn=true;
  void toggleView(){
    setState(()=>showSignIn=!showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }

  }
}
