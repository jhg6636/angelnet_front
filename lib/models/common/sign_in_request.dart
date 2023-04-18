import 'dart:convert';

import 'package:http/http.dart';

class SignInRequest {

  final String stringId;
  final String password;
  final String name;
  final String phone;
  final String email;
  final String? recommender;

  SignInRequest(this.stringId, this.password, this.name, this.phone, this.email, this.recommender)

  Future<SignInRequest> signIn() async {
    var response = await post('localhost:8080/sign-in' as Uri);
    var responseBody = utf8.decode(response.bodyBytes);
    List<dynamic> jsonBody = jsonDecode(responseBody);

    return SignInRequest(
        jsonBody[0]['stringId'],
        jsonBody[0]['password'],
        jsonBody[0]['name'],
        jsonBody[0]['phone'],
        jsonBody[0]['email'],
        jsonBody[0]['recommender']
    );
  }

}