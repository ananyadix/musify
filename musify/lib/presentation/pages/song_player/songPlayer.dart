import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/common/helper/isDarkMode.dart';
import 'package:musify/common/widgets/appBar.dart';
import 'package:musify/domain/entities/songs.dart';
import 'package:musify/presentation/bloc/songPlayerCubit.dart';
import 'package:musify/presentation/bloc/songPlayerState.dart';

import '../../../common/widgets/favouriteButton.dart';
import '../../../core/configs/theme/app_color.dart';

class Songplayer extends StatelessWidget {
  final SongEntity songEntity;
  const Songplayer({super.key,required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: Text("Now Playing",
        style: TextStyle(fontSize: 18
        ),),
        action: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded)),
      ),
      body: BlocProvider(
        create: (_)=>SongPlayerCubit()..loadSong(songEntity.song_url),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Column(
            children: [
              _songCover(context),
              const SizedBox(height: 20,),
              _songDetail(context),
              const SizedBox(height: 15,),
              _songPlayer(context)
            ],
          ),
        ),
      ),
    );
  }
  Widget _songCover(BuildContext context){
    return Container(
      height:MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(image: NetworkImage(songEntity.cover_photo),
        fit: BoxFit.cover),
      ),
    );
}
Widget _songDetail(BuildContext context) {
  return Row(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            songEntity.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 5),
          Text(
            songEntity.artist,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ],
      ),
      Spacer(), // This will create space between the Column and the IconButton
      Favouritebutton(songEntity: songEntity)
    ],
  );
}

    Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(builder: (context, state) {
      if (state is SongPlayerLoading) {
        return CircularProgressIndicator();
      }

      if (state is SongPlayerLoaded) {
        final cubit = context.read<SongPlayerCubit>();
        final currentPosition = cubit.songPosition.inSeconds.toDouble();
        final maxDuration = cubit.songDuration.inSeconds.toDouble();

        return Column(
          children: [
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.grey,
                thumbColor: AppColors.primary
              ),
              child: Slider(
                value: currentPosition.clamp(0.0, maxDuration),
                min: 0.0,
                max: maxDuration > 0 ? maxDuration : 1.0, // Avoid max being zero
                onChanged: (value) {
                  cubit.audioPlayer.seek(Duration(seconds: value.toInt()));
                },
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(FormatDuration(context.read<SongPlayerCubit>().songPosition)),
                  Text(FormatDuration(context.read<SongPlayerCubit>().songDuration)),
              ],
            ),
            GestureDetector(
              onTap: (){
                context.read<SongPlayerCubit>().playOrPause();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary
                ),
                child: Icon(context.read<SongPlayerCubit>().audioPlayer.playing?Icons.pause:Icons.play_arrow_rounded,color: Colors.white,),
              ),
            )
          ],
        );
      }

      return Container();
    });
  }
  String FormatDuration(Duration duration){
    final minutes=duration.inMinutes.remainder(60);
    final sec=duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2,'0')}:${sec.toString().padLeft(2,'0')}';
  }
}
