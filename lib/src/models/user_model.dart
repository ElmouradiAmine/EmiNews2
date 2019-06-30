import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String _name;
  final String _email;
  final String _imgUrl;
  final bool _isAdmin;

  UserModel.fromJson(DocumentSnapshot document)
      : _name = document["name"],
        _email = document["email"],
        _imgUrl = document["imgUrl"],
        _isAdmin = document["isAdmin"];

  String get name => _name;
  String get email => _email;
  String get imgUrl => _imgUrl;
  bool get isAdmin => _isAdmin;

}
