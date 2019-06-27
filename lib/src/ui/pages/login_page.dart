import 'package:flutter/material.dart';
import 'package:emi_news/src/ui/widgets/sign_in_form.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,

        ),
        alignment: Alignment(0, 0),
        child: SignInForm(),
      ),
    );
  }



}
