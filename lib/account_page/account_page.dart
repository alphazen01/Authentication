import 'package:authentication/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/widgets/account_widget/account_widget.dart';
import '../utils/widgets/big_text/big_text.dart';
import '../utils/widgets/icons/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:BigText(
        title: "Profile",
        fontSize: 24,
        )
      ),
      body:
       Consumer<UserController>(
        builder: (context, userController, child) {
          return Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                //profile icon
                // AppIcon(
                // icon: Icons.person,
                // backgroundColor: AppColor.mainColor,
                // iconColor: Colors.white,
                // iconSize: Dimensions.height15*5,
                // size: Dimensions.height15*10,
                // ),
                SizedBox(height:30,),
             
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //name
                  AccountWidget(
                  appIcon: AppIcon(
                  icon: Icons.person,
                  backgroundColor: Colors.tealAccent,
                  iconColor: Colors.white,
                  iconSize: 24,
                  size: 50,
                  ), 
                  bigText: BigText(
                  title: "name"
                  )
                  ),
                  SizedBox(height:20,),
                
                  //phone
                  AccountWidget(
                  appIcon: AppIcon(
                  icon: Icons.phone,
                  backgroundColor: Colors.yellowAccent,
                  iconColor: Colors.white,
                  iconSize: 25,
                  size: 50,
                  ), 
                  bigText: BigText(
                  title:"phone"
                  )
                  ),
                  SizedBox(height:20,),
                
                  //email
                  AccountWidget(
                  appIcon: AppIcon(
                  icon: Icons.email,
                  backgroundColor: Colors.yellowAccent,
                  iconColor: Colors.white,
                  iconSize: 25,
                  size:50,
                  ), 
                  bigText: BigText(
                  title: "email"
                  )
                  ),
                  SizedBox(height:20,),
                 
                  SizedBox(height: 20,),
                  //message
                  AccountWidget(
                  appIcon: AppIcon(
                  icon: Icons.message,
                  backgroundColor: Colors.redAccent,
                  iconColor: Colors.white,
                  iconSize: 25,
                  size:50,
                  ), 
                  bigText: BigText(
                  title: "message"
                  )
                  ),
                  SizedBox(height: 20,),
                
                  //logout
                  GestureDetector(
                    onTap: ()async{
                     SharedPreferences prefs = await SharedPreferences.getInstance();
                     prefs.remove("email"); 
                      
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
                  ),
                ),
                
              ],
            ),
          );
        },

       )
    );
  }
}
  
  