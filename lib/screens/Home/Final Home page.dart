import 'package:flutter/material.dart';
import 'package:share_help/Services/Auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_help/screens/About_us/ProfilePicture.dart';


class MyHomePage2 extends StatefulWidget {
  final String title;

  MyHomePage2({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearch = Text("Share and Help");

  void _launchEmail(String emailId)async {
    var url = "mailto:$emailId?subject=Reporting an Issue";
    if (await canLaunch(url)){
      await launch(url);
    }
    else {
      throw 'Could not Send Email';
    }
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: cusSearch,
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
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearch = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search here',
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearch = Text("Share and Help");
                }
              });
            },
            icon: cusIcon,
          ),
          IconButton(
            onPressed: ()async {
             await _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
        elevation: 0.0,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Material(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image(
                        image: AssetImage('assets/hr.jpg'),
                      ),
                    ),
                    Container(
                        child:Text('Hello'),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Material(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image(
                        image: AssetImage('images/download.jpg'),
                      ),
                    ),
                    Container(
                      child: Text('Hello'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Hritikh Roshan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/hr.jpg'),
                  fit: BoxFit.cover,
                ),
                gradient:LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.grey,Colors.deepPurpleAccent]
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap:(){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Setting'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Help'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About us'),
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>PicturePage())
                );
              },
            ),
            ListTile(
              title: Text('Contact us'),
              onTap: (){
                _launchEmail('activeuser74@gmail.com');
              },
            ),
            ListTile(
              title: Text('Log out',),
              onTap: ()async{
                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        },
        splashColor: Colors.white,
        label: Text('Post'),
        icon: Icon(Icons.plus_one),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class ImageAsset1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage1 = AssetImage('assets/hr.jpg');
    Image image = Image(
      image: assetImage1,
      width: 50.0,
      height: 50.0,
    );
    return Container(
      child: image,
    );
  }
}

/*class ImageAsset2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage2 = AssetImage('images/download(1).jpg');
    Image image = Image(image: assetImage2);
    return Container(child: image,);
  }

}*/
