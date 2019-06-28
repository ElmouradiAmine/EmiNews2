import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String _name;
  final String _email;
  final String _imgUrl;

  UserModel.fromJson(DocumentSnapshot document) :
        _name = document["name"],
        _email = document["email"],
        _imgUrl = document["imgUrl"];

  String get name => _name;
  String get email => _email;
  String get imgUrl => _imgUrl;


}