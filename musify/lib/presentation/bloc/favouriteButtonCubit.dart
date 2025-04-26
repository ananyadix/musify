import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/domain/usecases/addOrRemoveFavSong.dart';
import 'package:musify/presentation/bloc/favouriteButtonState.dart';
import 'package:musify/serviceLocator.dart';

import '../../domain/repository/songs/song.dart';

class FavouriteButtonCubit extends Cubit<FavouriteButtonState> {
  FavouriteButtonCubit() : super(FavouriteButtonInitial());

  void init(String songId) async {
    emit(FavouriteButtonInitial());
    final isFav = await s1<SongRepo>().isFavouriteSong(songId);
    emit(FavouriteButtonUpdate(isFav: isFav));
  }

  void toggleFavourite(String songId) async {
    final res = await s1<AddorremovefavsongUseCase>().call(params: songId);
    res.fold((l) {}, (isFav) {
      emit(FavouriteButtonUpdate(isFav: isFav));
    });
  }
}
