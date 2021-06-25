import 'package:flutter/material.dart';
import 'package:karmas/api/apiservice.dart';
import 'package:karmas/model/loginmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final skey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  String name ="" ;
  String email = "" ;
  
  
  
   @override
  void initState(){
    super.initState();

    _LoadData();
  }
  _LoadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString("email");
      name = preferences.getString("name");
    });
    print(email);
    print(name);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      key: skey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                width: 150,
                height: 100,
                padding: EdgeInsets.fromLTRB(30, 70, 30, 0),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                    
                    
                    color: Colors.orange,
                    ),
                child: Text(
                    "Profile",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    
                  ),
                
              ),
              Container(
                width: double.infinity,
                height: 600,
                padding: EdgeInsets.fromLTRB(30, 40, 30,0),
                margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20),
                    ]),
                 child: Form(
                  key: formKey,
                  child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Name"),
                    ),
                    Container(
                      
                      width: double.infinity,
                      height: 50,
                      padding: EdgeInsets.fromLTRB(25, 15, 20, 5),
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                    ),
                    child:  Text(
                      name
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email"),
                    ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.fromLTRB(25, 15, 20, 5),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    child: Text(
                      email
                    ),
                
            ),
          ],
        ),
      ),
            ),],),],),),
    );
  }
}
