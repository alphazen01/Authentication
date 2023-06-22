import 'package:authentication/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{

final SharedPreferences sharedPreferences;

AuthRepo({

  required this.sharedPreferences
});

bool userLoggedIn(){
  return sharedPreferences.containsKey(AppConstant.TOKEN);
}

Future<void> saveUserNumberAndPassword(String number, String password)async{
  try {
    await sharedPreferences.setString(AppConstant.PHONE, number);
    await sharedPreferences.setString(AppConstant.PASSWORD, password);
  } catch (e) {
    
  }
}





}