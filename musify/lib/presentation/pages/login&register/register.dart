import 'package:flutter/material.dart';
import 'package:musify/common/widgets/appBar.dart';
import 'package:musify/common/widgets/app_button.dart';

import 'login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar(),
        bottomNavigationBar: _loginText(context),
        body:Padding(padding: EdgeInsets.symmetric(vertical: 50,horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _registerText(),
                SizedBox(height: 50,),
                _fullNameField(context),
                SizedBox(height: 20,),
                _emailField(context),
                SizedBox(height: 20,),
                _passwordField(context),
                SizedBox(height: 40,),
                AppButton(onPressed: (){}, title: "Create Account")
              ],
            ))
    );
  }
  Widget _registerText(){
    return Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.center,);
  }
  Widget _fullNameField(BuildContext context){
    return TextField(
      decoration: InputDecoration(hintText: 'Full Name').applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _emailField(BuildContext context){
    return TextField(
      decoration: InputDecoration(hintText: 'Enter Email').applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _passwordField(BuildContext context){
    return TextField(
      decoration: InputDecoration(hintText: 'Password').applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _loginText(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Do you  have an account?",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),),
          TextButton(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const Login(),
            ),
          );}, child: Text("Login",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),),)
        ],
      ),
    );
  }
}
