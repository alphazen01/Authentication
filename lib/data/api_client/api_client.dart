// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:authentication/data/dio_singleton/dio_singleton.dart';
// import 'package:authentication/models/login_model.dart';
// import 'package:authentication/models/sign_up_model.dart';
// import 'package:authentication/utils/constants/app_constants.dart';
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

// class ApiClient{
// static Future<SignUpModel>userRegistration({
//   required String name,
//   required String email,
//   required String password,
//   required String phone,
// })async{
//   FormData payLoad = FormData.fromMap({
//     "f_name":name,
//     "email":email,
//     "password":password,
//     "phone":phone,
//   });
//   var response = await postHttp(path: AppConstant.registration,data: payLoad);
//   return SignUpModel.fromJson(response.data);
// }

// static Future<LoginModel> userLogin({
//   required String email,
//   required String password,
//   required String phone,
// })async{
//   FormData payLoad = FormData.fromMap({
//     "email":email,
//     "password":password,
//     "phone":phone,
//   });
//   var response = await postWithoutBase(path: AppConstant.login,data: payLoad);
//   return LoginModel.fromJson(response.data);
// }


// }