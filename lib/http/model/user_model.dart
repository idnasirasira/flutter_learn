import 'dart:convert';

import 'package:http/http.dart' as http;

class User{
  int id;
  String firstName;
  String lastName;
  String email;
  String created;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.created
  });

  factory User.createUser(Map<String, dynamic> object){
    return User(
        id: object['id'],
        firstName: object['first_name'],
        lastName: object['last_name'],
        email: object['email'],
        created: object['createdAt']
    );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "https://reqres.in/api/users/" + id;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)["data"];

    return User.createUser(userData);
  }
}