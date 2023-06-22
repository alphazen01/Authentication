import 'package:authentication/view/auth_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/widgets/account_widget/account_widget.dart';
import '../../utils/widgets/big_text/big_text.dart';
import '../../utils/widgets/icons/app_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Home Page"),
          elevation: 0,
          backgroundColor: Color(0xffC4C4C4),
          leading: IconButton(
              onPressed: () {
              
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: Column(
          children: [
             GestureDetector(
                    onTap: ()async{
                     SharedPreferences prefs = await SharedPreferences.getInstance();
                     prefs.remove("email");
                     print("object") ;
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LogInScreen()));
                      
                    },
                    child: AccountWidget(
                    appIcon: AppIcon(
                    icon: Icons.logout,
                    backgroundColor: Colors.redAccent,
                    iconColor: Colors.white,
                    iconSize: 25,
                    size: 50,
                    ), 
                    bigText: BigText(
                    title: "LogOut"
                    )
                    ),
                  ),
          ],
        ),
    );
  }
}