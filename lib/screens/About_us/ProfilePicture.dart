import 'package:flutter/material.dart';
import 'package:share_help/screens/About_us/Bhavya.dart';
import 'package:share_help/screens/About_us/Hussain.dart';
import 'package:share_help/screens/About_us/Jasmin.dart';
import 'package:share_help/screens/About_us/Mahir.dart';
import 'package:share_help/screens/About_us/Namra.dart';

class PicturePage extends StatelessWidget{

  Widget _ContactList(String name,String image) {

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        leading:CircleAvatar(
          radius: 30.0,
          child: ClipOval(
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.asset("assets/hr.jpg"),
            ),
          ),
        ),
        title:Text(name),
      ) ,
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
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
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title:_ContactList("Bhavya", "images/sample.JPG"),
              onTap:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Bhavya()));
              },
            ),
            Divider(height: 20.0),
            ListTile(
              title: _ContactList("Hussain", "images/sample.JPG"),
              onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Hussain()));
              },
            ),
            Divider(height: 20.0),
            ListTile(
              title: _ContactList("Jasmin", "images/sample.JPG"),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Jasmin()));
              },
            ),
            Divider(height: 20.0),
            ListTile(
              title: _ContactList("Mahir", "images/sample.JPG"),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Mahir()));
              },
            ),
            Divider(height: 20.0),
            ListTile(
              title: _ContactList("Namra", "images/sample.JPG"),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Namra()));
              },
            ),
            Divider(height: 10.0),
            ListTile(
              title: Text("Feel free to contact",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

}