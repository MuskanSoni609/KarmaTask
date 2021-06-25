import 'package:flutter/material.dart';

import 'package:karmas/pages/loginpage.dart';
import 'package:karmas/pages/profile.dart';
import 'package:karmas/shared_preferences.dart';

import '../route.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  final Preferences preferences = Preferences();
  
   
  final search = TextEditingController();
  final skey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skey,
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Column(
          

          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                width: double.infinity,
                height: 150,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                    
                    
                    color: Colors.orange,
                    ),
               child:Row(
                  children: <Widget>[
                    Text(
                    "Karma Drive",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    
                  ),
                  SizedBox(width:150.0),
                  Container(
                    width: 40,
                    height: 40,
                    
                    color: Colors.white.withOpacity(0.2),
                    child: IconButton(onPressed:(){
                    Navigator.of(context).pushNamed(ProfilePageRoute);
                  }, icon: Icon(Icons.person),
                      color: Colors.white.withOpacity(1),
                      )
                      
                  ),
                
                  ],
                
              ),
              ),
              ]),
            
             Container(
                width: double.infinity,
                height: 1000,
                padding: EdgeInsets.fromLTRB(30, 40, 30,0),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
           
            child:
            Column(
              children: <Widget>[
                Container(
                  width: 260,
                  height: 170,
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange),
                  child: Stack(children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:  Image(
                    image: AssetImage('assets/download.jpg'),
                    width: double.infinity,
                    height: double.infinity,
                    
                    
                  ),
                    )
                    
                   
                  ],) 
                  
                ),
                Container(
                  width: 260,
                  height: 145,
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange),
                  child: Stack(children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:  Image(
                    image: AssetImage('assets/download1.jpg'),
                    width: double.infinity,
                    height: double.infinity,
                    
                    
                  ),
                    )
                    
                   
                  ],) 
                  
                ),
                
                Container(
                  width: 260,
                  height: 170,
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange),
                  child: Stack(children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:  Image(
                    image: AssetImage('assets/download.jpg'),
                    width: double.infinity,
                    height: double.infinity,
                    
                    
                  ),
                    )
                    
                   
                  ],) 
                  
                ),
                Container(
                  width: 260,
                  height: 145,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange),
                  child: Stack(children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:  Image(
                    image: AssetImage('assets/download1.jpg'),
                    width: double.infinity,
                    height: double.infinity,
                    
                    
                  ),
                    )
                    
                   
                  ],) 
                  
                ),
                TextButton(
              
              onPressed: () async {
                preferences.removeCache("name","email","password").whenComplete(() {
                  Navigator.of(context).pushNamed(LoginPageRoute);
                });
               
              },
              child: Text(
                "LogOut",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent)),
            ),
              ],
            )
             ),
            
          ],
        ),
      ),
      
    );
  }
  
}
