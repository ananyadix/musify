import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/domain/entities/songs.dart';
import 'package:musify/presentation/bloc/favouriteButtonCubit.dart';
import 'package:musify/presentation/bloc/favouriteButtonState.dart';

import '../../core/configs/theme/app_color.dart';

class Favouritebutton extends StatelessWidget {
  final SongEntity songEntity;
  final Function ? function;
  const Favouritebutton({required this.songEntity,this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteButtonCubit()..init(songEntity.songId),
      child: BlocBuilder<FavouriteButtonCubit, FavouriteButtonState>(
        builder: (context, state) {
          bool isFav = songEntity.isFav;
          if (state is FavouriteButtonUpdate) {
            isFav = state.isFav;
          }

          return IconButton(
            onPressed: () {
            context.read<FavouriteButtonCubit>().toggleFavourite(songEntity.songId);
            },
            icon: Icon(
              Icons.favorite,
              color: isFav ? Colors.red : AppColors.darkGrey,
            ),
          );
        },
      ),
    );
  }
}
