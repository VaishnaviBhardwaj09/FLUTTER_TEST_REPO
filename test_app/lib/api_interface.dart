import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/user.dart';

class ApiInterface {
  String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<User>> fetchUserData() async {
    final userResponse = await http.get(Uri.parse(baseUrl));
    if (userResponse.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(userResponse.body);
      List<User> userDataList =
          jsonData.map((data) => User.fromJson(data)).toList();
      return userDataList;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
