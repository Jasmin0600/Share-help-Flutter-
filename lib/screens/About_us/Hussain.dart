import 'package:flutter/material.dart';

class Hussain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Hussain Saherwala'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    Colors.red,
                    Colors.white,
                  ])
          ),
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
        ],
        elevation: 0.0,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 1000.0,
              child: Image(
               image: AssetImage('assets/hr.jpg'),
              ),
            ),
            Text(
              'Hussain Saherwala',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'UI Developer',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\nMobile No.:8488940969',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              'Email Id: 18dcs101@charusat.edu.in',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
    );
  }

}