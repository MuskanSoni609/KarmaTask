import 'package:shared_preferences/shared_preferences.dart';
class Preferences {
  Future createCache(String name , String email , String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("name", name);
    preferences.setString("email", email);
    preferences.setString("password", password);
  }


   Future readCache( String password ) async {
    
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var cache = preferences.getString("password");
    return cache;
  }

 
   Future removeCache(String name , String email , String password)async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("password");
    preferences.remove("email");
    preferences.remove("name");
  }
}