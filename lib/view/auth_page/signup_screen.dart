import 'package:authentication/controller/controller.dart';
import 'package:authentication/utils/widgets/text_field/custom_textfield.dart';
import 'package:authentication/view/auth_page/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

import '../../models/sign_up_body.dart';
import '../../utils/widgets/big_text/big_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();



    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Screen"),
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
                      controller: nameController,
                      name: "UserName",
                    ),
                    
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
                      if (nameController.text.isEmpty) {
                   Fluttertoast.showToast(msg: "Enter your name");
                    } else if (emailController.text.isEmpty) {
                     Fluttertoast.showToast(msg: "Enter your email");
                    } else if (passwordController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter your password");
                    } else if (phoneController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter your phone");
                    }
                    else {
                      SignUpBody signUpBody = SignUpBody(
                      name: nameController.text, 
                      phone: phoneController.text, 
                      email: emailController.text, 
                      password: passwordController.text
                      );
                      pro.cReg(signUpBody).then((status) {
                        if (status.isSuccess) {
                         Fluttertoast.showToast(msg: "All went well",);
                        print("Success registration");
                         Navigator.push(context, MaterialPageRoute(builder: (_)=>LogInScreen()));
                        
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
                        title:"Sign Up",
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
                     recognizer: TapGestureRecognizer()..onTap=()=>Navigator.pop(context),
                    text: "Have an account already?",
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