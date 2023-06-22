
import 'package:authentication/controller/auth_controller.dart';
import 'package:authentication/view/auth_page/login_screen.dart';
import 'package:authentication/view/home/home.dart';
import 'package:authentication/view/auth_page/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


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
     
      ],
      child: CustomApp(),
      );
      
     
  }
  
}
class CustomApp extends StatelessWidget {
  const CustomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: LogInScreen()
    );
  }
}

