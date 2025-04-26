import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/common/helper/isDarkMode.dart';
import 'package:musify/common/widgets/appBar.dart';
import 'package:musify/core/configs/theme/app_color.dart';
import 'package:musify/presentation/bloc/getFavState.dart';
import 'package:musify/presentation/bloc/getFvaCubit.dart';
import 'package:musify/presentation/bloc/profileInfoCubit.dart';
import 'package:musify/presentation/bloc/profileInfoState.dart';
import 'package:musify/presentation/pages/song_player/songPlayer.dart';

import '../../../common/widgets/favouriteButton.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: Text("Profile"),
        back: context.isDarkMode?AppColors.darkGrey:Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfo(context),
          SizedBox(height: 30,),
          _favouriteSongs()
        ],
      ),
    );
  }
  Widget _profileInfo(BuildContext context){
    return BlocProvider(
      create: (context)=>ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height/3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.isDarkMode? AppColors.darkGrey: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45))
        ),
          child:BlocBuilder<ProfileInfoCubit,ProfileInfoState>(builder: (context,state){
            if(state is ProfileInfoLoading){
              return Container(alignment: Alignment.center
              ,child: const CircularProgressIndicator());
            }
            if(state is ProfileInfoLoaded){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuDyMe5CIk86B4cEY1L_gpvJZa7j3vWcJp8w&s"))
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(state.userEntity.email!),
                  SizedBox(height: 10,),
                  Text(state.userEntity.fullName!,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                ],
              );
            }
            if(state is ProfileInfoFailed){
              return Text("Error");
            }
            return Container();
          })
      ),
    );
  }
  Widget _favouriteSongs(){
    return BlocProvider(
      create: (context)=>GetFavCubit()..getFavSong(),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("FAVOURITE SONGS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            BlocBuilder<GetFavCubit,GetFavState>(builder: (context,state){
              if(state is GetFavLoading){
                return Container(alignment: Alignment.center,child: const CircularProgressIndicator());
              }
              if(state is GatFavLoaded){
                return ListView.separated(shrinkWrap: true,
                    itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Songplayer(songEntity: state.favSong[index])
                      )
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(image: NetworkImage(state.favSong[index].cover_photo))
                                ),
                              ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.favSong[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  state.favSong[index].artist,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                state.favSong[index].duration.toString().replaceAll('.', ':')
                            ),
                            SizedBox(width: 20,),
                          ],
                        )
                      ],
                    ),
                  );
                }, separatorBuilder: (context,index)=>SizedBox(height: 20,), itemCount: state.favSong.length);
              }
              if(state is GetFavFailed){
                return Text("Please Try Again");
              }
              return Container();
            })
          ],
        ),
      ),
    );
}
}
