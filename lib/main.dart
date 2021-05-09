import 'package:flutter/material.dart';
import 'package:share_help/Services/Auth.dart';
import 'screens//Wrapper.dart';
import 'package:provider/provider.dart';
import 'models/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return StreamProvider<User>.value(
     value: AuthService().user,
     child: MaterialApp(
       title: 'Share and help',
       home: Wrapper(),
     ),
   );
  }
}
