import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/feature/authentication/view/widgets/bottom_link_widget.dart';
import 'package:todo/feature/authentication/view/widgets/button_widget.dart';
import 'package:todo/feature/authentication/view/widgets/text_field_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image(image: AssetImage("assets/images/mimo.png"),height: 200,width: 300,)),
              TextFieldWidget(
                hintText: "Email",
              ),
              SizedBox(height: 20,),
              TextFieldWidget(
                hintText: "Password",
              ),
              SizedBox(height: 12,),
              GestureDetector(
                onTap: () {
                  
                },
                child: Text("Forgot Password?",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w900),)),
              SizedBox(height: 25,),
             CommonButtonWidget(),
             SizedBox(height: 30,),
              BottomLinkWidget(
                text: "Don't have an account? ",
                Linktext: "Register",
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}



