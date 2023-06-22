

import 'package:authentication/account_page/account_page.dart';
import 'package:authentication/controller/user_controller.dart';
import 'package:authentication/view/auth_page/login_screen.dart';
import 'package:authentication/view/home/home.dart';
import 'package:authentication/view/auth_page/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/controller.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
 var email = prefs.getString('email');
  runApp( MyApp(email: email,));
}
   Future init()async{
  WidgetsFlutterBinding.ensureInitialized();
 

}

class MyApp extends StatelessWidget {
  final String? email;
  const MyApp({Key? key,this.email}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider<Controller>(
      create: (BuildContext context){
        return Controller(
          
        );
      }
         ),
         ChangeNotifierProvider<UserController>(
      create: (BuildContext context){
        return UserController(
          
        );
      }
         ),
     
      ],
      child:MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: email==null?LogInScreen():HomePage()
    )
      );
      
     
  }
  
}


