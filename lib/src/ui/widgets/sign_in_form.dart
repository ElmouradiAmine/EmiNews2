import 'package:flutter/material.dart';
import 'package:emi_news/src/blocs/login_bloc.dart';
import 'package:emi_news/src/blocs/login_bloc_provider.dart';
import 'package:emi_news/src/ui/home_page.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  LoginBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = LoginBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height:80.0,),
        emiLogo(),
        SizedBox(height: 50.0,),
        emailField(),
        SizedBox(height: 10,),
        passwordField(),
        SizedBox(height: 30.0,),
        submitButton()
      ],
    );
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: _bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: "password",
                errorText: snapshot.error),
          );
        });
  }

  Widget emailField() {
    return StreamBuilder(
        stream: _bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: _bloc.changeEmail,
            decoration: InputDecoration(
                hintText: "email", errorText: snapshot.error),
          );
        });
  }


  Widget submitButton() {
    return StreamBuilder<bool>(
        stream: _bloc.signInStatus,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button();
          } else {
            return Container(child: Center(child: CircularProgressIndicator(),),);
          }
        });
  }

  Widget button() {
    return RaisedButton(
        child: Text("Submit"),
        textColor: Colors.white,
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () {
          if (_bloc.validateFields()) {
            authenticateUser();
          } else {
            showErrorMessage();
          }
        });
  }

  void authenticateUser() {
    _bloc.showProgressBar(true);
    _bloc.submit().then((value) {
      if (value == 0) {
        //New User
        _bloc.registerUser().then((value) {
          print("first time");
        });
      } else {
        //Already registered
        print("already registered");

      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(_bloc.emailAddress)));
    });
  }

  Widget emiLogo(){
    return Container(
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/EMILogo.png"))
      ),
    );
  }

  void showErrorMessage() {
    final snackbar = SnackBar(
        content: Text("error"),
        duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackbar);
  }



}
