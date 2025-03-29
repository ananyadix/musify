import 'package:flutter/material.dart';
import 'package:musify/common/widgets/app_button.dart';
import 'package:musify/presentation/pages/intro/chooseMode.dart';
import 'package:musify/core/configs/theme/app_color.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 100,horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/appbg.jpg"),fit: BoxFit.fill)
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/mage_music-fill.png"),
                ),
                Spacer(),
                Text('Tune in, Feel Alive!',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primary,fontSize: 20),),
                SizedBox(height: 21,),
                Text('Musify – Your Ultimate Music Companion, Where Every Beat Feels Like Home, Every Tune Tells a Story, and Every Melody Becomes a Memory!',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 13),textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                AppButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Choosemode()));}, title: "Get Started")
              ],
            ),
          ),

        ],
      ),
    );
  }
}
