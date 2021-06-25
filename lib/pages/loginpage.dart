import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:karmas/api/apiservice.dart';
import 'package:karmas/model/loginmodel.dart';
import 'package:karmas/pages/homepage.dart';
import 'package:karmas/route.dart';
import 'package:karmas/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final skey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final Preferences preferences = Preferences();

  bool hidePassword = true;
  bool isApiCall = false;

  LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skey,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150),
                    ),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20),
                    ]),
                child: Center(
                  child: Column(children: <Widget>[
                    Text(
                    "KARMA",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "LogIn",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ],)
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 700,
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            margin: EdgeInsets.fromLTRB(0, 60, 0, 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 65,
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: new TextFormField(
                      controller: name,
                      keyboardType: TextInputType.text,
                      onSaved: (input) => requestModel.name = input,
                      validator: (input) =>
                          input.isEmpty ? "Name should be valid " : null,
                      decoration: new InputDecoration(
                        hintText: "Name",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 65,
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: new TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (input) => requestModel.email = input,
                      validator: (input) => !input.contains("@")
                          ? "Email should be valid "
                          : null,
                      decoration: new InputDecoration(
                        hintText: "Email Address",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.black,
                        )),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 65,
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: new TextFormField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      onSaved: (input) => requestModel.password = input,
                      validator: (input) => input.length < 8
                          ? "password should be more than 8 characters "
                          : null,
                      obscureText: hidePassword,
                      decoration: new InputDecoration(
                          hintText: "password",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            color: Colors.black.withOpacity(0.2),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment(1, 0),
                    margin: EdgeInsets.fromLTRB(0, 0, 5, 80),
                    padding: EdgeInsets.only(top: 15, left: 20),
                    child: InkWell(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        if (validateForm()) {
                          ApiService apiservice = new ApiService();
                          apiservice.login(requestModel).then((value) => {
                                preferences
                                    .createCache(
                                        name.text, email.text, password.text)
                                    .whenComplete(() {
                                  if (name.text.isNotEmpty &&
                                      email.text.isNotEmpty &&
                                      password.text.isNotEmpty) {
                                    Navigator.of(context)
                                        .pushNamed(HomePageRoute);
                                  }
                                })
                              });
                          print(requestModel.toJson());
                        }
                      },
                      child: Text(
                        "LogIn",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.lightGreenAccent))),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Not a member yet? ",
                      ),
                      InkWell(
                      child: Text(
                        "Click Here",
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  bool validateForm() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
