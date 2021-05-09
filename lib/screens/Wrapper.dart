import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_help/screens/Authenticate/Authenticate.dart';
import 'package:share_help/screens/Home/Final%20Home%20page.dart';
import 'package:share_help/models/User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user=Provider.of<User>(context);

    //return either Authenticate or MyHomePage2
    if(user==null){
      return Authenticate();
    }else{
      return MyHomePage2();
    }
  }
}
