import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emi_news/src/resources/user_provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _confirmPassword;
  TextEditingController _name;
  bool hidePass = true;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    _confirmPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Inscription"),
      ),
      key: _key,
      body: Stack(
        children: <Widget>[
          Visibility(
            visible: user.status == Status.Authenticating,
            child: Center(child: CircularProgressIndicator()),
          ),
          Visibility(
            visible: user.status == Status.Authenticating,
            child: Container(
              height: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          Form(
            key: _formKey,
            child: ListView(

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    height: 90,
                    width: 90,
                    child: Image.asset("assets/EMILogo.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: "Full name",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "The name field cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email),
                        hintText: "Email",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(value))
                          return 'Please make sure your email address is valid';
                        else
                          return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: TextFormField(
                    controller: _password,
                    obscureText: hidePass,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                hidePass = !hidePass;
                              });
                            }),
                        hintText: "Password",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "The password field cannot be empty";
                      } else if (value.length < 6) {
                        return "the password has to be at least 6 characters long";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: TextFormField(
                    controller: _confirmPassword,
                    obscureText: hidePass,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: "Confirm Password",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value != _password.text) {
                        return "The passwords don't match";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFF1F04A0),
                      elevation: 0.0,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (!await user.signUp(
                                _name.text, _email.text, _password.text))
                              _key.currentState.showSnackBar(
                                  SnackBar(content: Text("Sign up failed")));
                            else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        child: Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "I already have an account!",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ))),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
