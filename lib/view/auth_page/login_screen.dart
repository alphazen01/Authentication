import 'package:authentication/models/login_model.dart';
import 'package:authentication/view/auth_page/signup_screen.dart';
import 'package:authentication/view/home/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../controller/controller.dart';
import '../../utils/widgets/big_text/big_text.dart';
import '../../utils/widgets/text_field/custom_textfield.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();



    return Scaffold(
      appBar: AppBar(
        title: Text("Log in Screen"),
      ),
      body: Consumer<Controller>(
        builder: (context, pro, child) {
          return pro.isLoading?Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
             ),
          ): SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  //image section
                      
                  // Container(
                  //   height: 20,
                  //   child: Center(
                  //     child: CircleAvatar(
                  //       backgroundColor: Colors.white,
                  //       radius: 80,
                  //       backgroundImage: AssetImage(
                  //         "assets/images/food_logo.jpg"
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20,),
                 Column(
                  children: [
                     CustomTextField(
                      controller: emailController,
                      name: "Email",
                    ),
                     CustomTextField(
                      controller: passwordController,
                      name: "Password",
                    ),
                     CustomTextField(
                      controller: phoneController,
                      name: "Phone",
                    ),
                  SizedBox(height: 20,),
                  //signup button
                  InkWell(
                    onTap: (){
                      if (emailController.text.isEmpty) {
                     Fluttertoast.showToast(msg: "Enter your email");
                    } else if (passwordController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter your password");
                    } else if (phoneController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter your phone");
                    }
                    else {
                      LoginModel loginModel = LoginModel(
                      phone: phoneController.text, 
                      email: emailController.text, 
                      password: passwordController.text
                      );
                      pro.cLog(loginModel).then((status) {
                        if (status.isSuccess) {
                         Fluttertoast.showToast(msg: "All went well",);
                        print("Success Login");
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                        
                      } else {
                        Fluttertoast.showToast(msg: "Something Wrong",);
                        print("object");
                      }
                      });
                    }
                    },
                    child: Container(
                      width:double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: BigText(
                        title:"Log in",
                        fontSize: 30,
                        color: Colors.white, 
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:10,),
                  //tagline
                  RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen())),
                    text: "Don't have an account?",
                    style: TextStyle(
                      color:Colors.grey[500],
                      fontSize: 20
                    )
                  ),
                  ),
                  SizedBox(height: 10,),
                      
                  //sign up option
                   RichText(
                  text: TextSpan(
                    
                    text: "Sign up using one of the following methods",
                    style: TextStyle(
                      color:Colors.grey[500],
                      fontSize: 16
                    )
                  ),
                  ),
                      
                  // Wrap(
                  //   children: List.generate(3, (index) => Padding(
                  //     padding: EdgeInsets.all(8),
                  //     child: CircleAvatar(
                  //       radius: 30,
                  //       backgroundImage: AssetImage(
                  //        signUpImages[index]
                  //       ),
                  //     ),
                  //   )
                  //   ),
                  // ),
                      
                  ],
                 ),
                ],
              ),
            ),
           );
        },
       
      ),
    );
  }
}