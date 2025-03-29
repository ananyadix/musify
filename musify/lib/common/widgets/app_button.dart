import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  const AppButton({required this.onPressed,required this.title,this.height,super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(title,style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height ?? 80)),);
  }
}
