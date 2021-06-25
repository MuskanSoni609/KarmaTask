import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:karmas/model/loginmodel.dart'; 

class ApiService {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async{
    String url = "https://reqres.in/api/login";

    final response = await http.post(url, body: loginRequestModel.toJson());
    if(response.statusCode == 200 || response.statusCode == 400){
      return LoginResponseModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Failed to load data");
    }
  }

}