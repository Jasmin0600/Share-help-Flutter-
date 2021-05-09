import 'package:flutter/material.dart';
import 'package:share_help/Services/Auth.dart';
import 'package:share_help/shared/constants.dart';
import 'package:share_help/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with  SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  void  initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync:this,
        duration: new Duration (milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.bounceOut
    );
    _iconAnimationController.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading =false;

  //text field states
  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
//      appBar: AppBar(
//        backgroundColor: Colors.brown[400],
//        elevation: 0.0,
//        title: Text('Sign in to Share & help'),
//      ),
      body: Container(
        //padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Stack(
          fit:StackFit.expand,
          children: <Widget>[
            Image(
              image:  new AssetImage("assets/imglogin.jpg"),
              fit: BoxFit.cover,
              color:Colors.black87,
              colorBlendMode: BlendMode.hardLight,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                 size: _iconAnimation.value*100,
               ),
//                Image(
//                  image: AssetImage('assets/imglogin.jpg'),
//                  width: _iconAnimation.value*100,
//                  height: _iconAnimation.value*100,
//                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                        child: TextFormField(
                          decoration:textInputDecoration.copyWith(hintText: 'Email',
                          prefixIcon:Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.0),
                            child: Icon(
                              Icons.mail,
                            ),
                          )),
                          validator: (val)=>val.isEmpty ? 'Enter and email':null,
                          onChanged: (val){
                            setState(()=>email=val);
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                        child: TextFormField(
                          decoration:textInputDecoration.copyWith(hintText: 'Password',
                              prefixIcon:Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.0),
                                child: Icon(
                                  Icons.fingerprint,
                                ),
                              )),
                          validator: (val)=>val.length<6 ? 'Enter the password 6+ chars long':null,
                          obscureText: true,
                          onChanged: (val){
                            setState(()=>password=val);
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        color: Colors.pink,
                        splashColor: Colors.white,
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: ()async{
                          if(_formKey.currentState.validate()){
                            setState(()=>loading=true);
                            dynamic result=await _auth.signInWithEmailAndPassword(email, password);
                            if(result==null){
                              setState(() {
                                error='could not sign in with those credentials';
                                loading=false;
                              });
                            }
                          }
                        },
                      ),
                      Text(
                        error,
                        style: TextStyle(
                            color: Colors.red,fontSize: 14.0
                        ),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        color: Colors.brown[300],
                        child: Text(
                          'New User? Sign up',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: ()async{
                          widget.toggleView();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
