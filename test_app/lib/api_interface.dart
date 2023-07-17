import 'dart:convert';

import 'package:test_app/user_model.dart';
import 'package:http/http.dart' as http;

class ApiInterface{
  ApiInterface._();

  static ApiInterface? _instance;

  static get instance{
    return _instance ??= ApiInterface._();
  }

  Future<List<UserModel?>?> getUserData()async{
    http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    // var usersData = response.body;
    
    if(response.statusCode == 200){
      List<dynamic> data =jsonDecode(response.body) as List<dynamic>;
      List<UserModel> userData= [];

      data.forEach((element) { userData.add(UserModel.fromJson(element!));});
      print(userData.length);

      // UserModel  usersData = UserModel.fromJson(jsonDecode(response.body));
      // print(usersData);
      return userData;
    }
    return null;
  }
}