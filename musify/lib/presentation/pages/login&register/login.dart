import 'package:flutter/material.dart';
import 'package:musify/common/widgets/appBar.dart';
import 'package:musify/common/widgets/app_button.dart';
import 'package:musify/presentation/pages/login&register/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      bottomNavigationBar: _registerText(context),
      body:Padding(padding: EdgeInsets.symmetric(vertical: 50,horizontal: 30),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _loginText(),
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
  Widget _loginText(){
    return Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.center,);
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
  Widget _registerText(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Do'nt an account?",style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14
          ),),
          TextButton(onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const Register(),
            ),
          );}, child: Text("Register",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),),)
        ],
      ),
    );
  }
}
