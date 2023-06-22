import 'dart:convert';

import 'package:authentication/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/response_model.dart';
import '../utils/constants/app_constants.dart';

class UserController extends ChangeNotifier{

bool _isLoading = false;

bool get isLoading => _isLoading;
Future<ResponseModel> getUser(UserModel userModel )async{
_isLoading = true;
notifyListeners();

var response = await http.post(
  Uri.parse(AppConstant.BASE_URL+AppConstant.REGISTRATION_URI),
  body: jsonEncode(userModel),
  headers: <String,String>{
    'Content-Type': 'application/json; charset=UTF-8',
  }
);
 print({"response.statusCode:${response.statusCode}"});
 late ResponseModel responseModel;
 if (response.statusCode==200) {
  responseModel = ResponseModel(true, response.body);
    jsonDecode(response.body);
    print(response.statusCode);
 } else {

    responseModel = ResponseModel(false,response.body);
 }
 _isLoading = false;
notifyListeners();
 return responseModel;
}







}