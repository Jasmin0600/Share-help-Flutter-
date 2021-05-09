import 'package:flutter/material.dart';

class Help extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: Text(
          'Grow up kid! be self dependent\n',
          style: TextStyle(
            fontSize: 27.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
