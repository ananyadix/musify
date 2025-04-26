import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/common/helper/isDarkMode.dart';
import 'package:musify/common/widgets/favouriteButton.dart';
import 'package:musify/core/configs/theme/app_color.dart';
import 'package:musify/domain/entities/songs.dart';
import 'package:musify/presentation/bloc/playlistCubit.dart';
import 'package:musify/presentation/bloc/playlistState.dart';
import 'package:musify/presentation/pages/song_player/songPlayer.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Playlistcubit,PlaylistState>(builder: (context,state){
      if(state is PlaylistLoading){
        return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      }
      else if(state is PlaylistLoaded){
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Playlist",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("See More",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color:AppColors.grey))
                ],
              ),
              SizedBox(height: 20,),
              _songs(state.songs)
            ],
          ),
        );
      }
      return Container();
    });
  }
  Widget _songs(List<SongEntity> songs){
      return ListView.separated(shrinkWrap: true,
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Songplayer(songEntity: songs[index],)));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode?AppColors.darkGrey:AppColors.grey
                    ),
                    child: Icon(Icons.play_arrow_rounded,color: AppColors.lightBackground,),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songs[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        songs[index].artist,
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
                    songs[index].duration.toString().replaceAll('.', ':')
                  ),
                  SizedBox(width: 20,),
                  Favouritebutton(songEntity: songs[index])
                ],
              )
            ],
          ),
        );
      }, separatorBuilder: (context,index)=>const SizedBox(height: 10,), itemCount: songs.length);
  }
}
