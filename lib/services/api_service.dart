import 'dart:convert';
import 'dart:developer';

import 'package:api_kullanimi/users_model.dart';
import 'package:http/http.dart' as http;

import 'api_constants.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
  Future<UserModel> fetchUser(int id) async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/${id.toString()}'),
    );

    if (response.statusCode == 200) {

      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }


  Future<UserModel> updateUser(
    int id,
    String name,
    String username,
    String email,
    Address address,
    String phone,
    String website,
    Company company,
  ) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'username': username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user.');
    }
  }

  Future<UserModel> deleteUser(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/users/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {

      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete user.');
    }
  }
}
