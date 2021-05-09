import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseServer{

//collection reference
final CollectionReference profile= Firestore.instance.collection('profile');

Future updateUserData(){
}
}