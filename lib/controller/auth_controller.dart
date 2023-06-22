// import 'package:authentication/data/api_client/api_client.dart';
// import 'package:authentication/data/dio_singleton/dio_singleton.dart';
// import 'package:authentication/models/login_model.dart';

// import 'package:authentication/utils/functions/navigations.dart';
// import 'package:authentication/view/home/home.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../utils/constants/enums.dart';

// class AuthController extends ChangeNotifier{

// DataState signUpDataState = DataState.initial;
// DataState loginDataState = DataState.initial;


// LoginModel loginInfo = LoginModel();


// registationButton({
//   required String name,
//   required String email,
//   required String password,
//   required String phone,
// })async{
//   signUpDataState = DataState.loading;
//   notifyListeners();
//   try {
//     signUpInfo = await ApiClient.userRegistration(
//     name: name, 
//     email: email, 
//     password: password, 
//     phone: phone
//     );
//     DioSingleton.instance.update(signUpInfo.token!);
//     signUpDataState = DataState.loaded;
//     print("signup successfully");
//   } catch (e) {
//     print(e);
//     signUpDataState = DataState.error;
//     print(e);
//     Fluttertoast.showToast(msg: "Something is Wrong");
//   }
//   notifyListeners();
// }

// loginButton({
//   required String email,
//   required String password,
//   required String phone,
// })async{
// loginDataState = DataState.loading;
// notifyListeners();
// try {
//   loginInfo = await ApiClient .userLogin(
//   email: email, 
//   password: password,
//   phone: phone
  
//   );
//   DioSingleton.instance.update(loginInfo.token!);
//   loginDataState = DataState.loaded;
//   print("LogIn successfully");
// } catch (e) {
//   print('error');
//   loginDataState = DataState.error;
//   print(e);
//   Fluttertoast.showToast(msg: "Something is Wrong");
// }
// }

// getUserInfo({
//   required String email,
//   required String password,
// })async{
//   try {
    
//   } catch (e) {
    
//   }
// }


// }