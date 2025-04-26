import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/domain/entities/songs.dart';
import 'package:musify/presentation/bloc/songCubit.dart';
import 'package:musify/presentation/bloc/songState.dart';
import 'package:musify/presentation/pages/song_player/songPlayer.dart';

class Songssidescroll extends StatelessWidget {
  const Songssidescroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BlocBuilder<SongCubit, SongState>(
        builder: (context, state) {
          if (state is SongLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SongLoaded) {
            return _songs(state.songs);
          } else if (state is SongLoadFailed) {
            return Center(child: Text("Failed to load songs"));
          }
          return Center(child: Text("Unexpected state"));
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Songplayer(songEntity: songs[index],)));
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    songs[index].cover_photo,
                    height: 150, // Fixed height
                    width: 160,  // Match the card width
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  songs[index].title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  songs[index].artist,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 14),
    );
  }
}