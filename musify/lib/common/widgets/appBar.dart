import 'package:flutter/material.dart';
import 'package:musify/common/helper/isDarkMode.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{
  final Widget? title;
  const Appbar({this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title:title??const Text('') ,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color:context.isDarkMode? Colors.white.withOpacity(0.03):Colors.black.withOpacity(0.03),
          shape: BoxShape.circle
        ),
        child: Icon(Icons.arrow_back_ios_new,size: 15,color: context.isDarkMode?Colors.white:Colors.black,),
      )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
