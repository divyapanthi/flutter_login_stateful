import 'dart:convert';
import 'dart:io';
import 'package:login_stateful/src/models/signup_response_model.dart';
import 'package:http/http.dart';

class _AuthApi{
  /// todo define a method that takes email, password and gender
  /// posts that data to our backend server and returns the result back
  /// to the caller

  Future<SignupResponseModel?> signup(String email, String password, String gender) async {
    final requestBody = {
      "email": email,
      "password": password,
      "gender": gender,
    };

  final url = Uri.parse("https://api.fresco-meat.com/api/albums/signup");
    
    try{
      final response = await post(
      url,
      body: jsonEncode(requestBody),
      headers: {"Content-Type": "application/json"}
      );

      final body = response.body;
      final code = response.statusCode;
      if(code!= HttpStatus.created){
        return null;
      }
      final parsedMap = jsonDecode(body);
      print("The sign up response $parsedMap");
      final SignupResponseModel responseModel = SignupResponseModel.fromJson(parsedMap);
      return responseModel;
      
    }catch(e){
      print("Exception $e");
      return null;
    }

  }

}

final authApi = _AuthApi();