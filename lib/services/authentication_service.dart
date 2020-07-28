import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthenticationService {
  static Future<Map<String, dynamic>> authenticate(
      String email, String password) async {
    print("Authenticate User $email");
    String parameters =
        jsonEncode(<String, String>{"email": email, "password": password});

    final http.Response response = await http.post(
        "https://api.sevendaysweb.com/api/resources/profile/authenticate/",
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: parameters);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed do login ${response.reasonPhrase}, $parameters");
    }
  }
}
