import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/domain/usecases/getSongCase.dart';
import 'package:musify/presentation/bloc/playlistState.dart';
import '../../serviceLocator.dart';

class Playlistcubit extends Cubit<PlaylistState> {
  Playlistcubit() : super(PlaylistLoading());

  Future<void> getSongs() async {
    final returnedSong = await s1<GetSongUseCase>().call();

    returnedSong.fold(
          (l) => emit(PlaylistLoadFailed()),
          (data) => emit(PlaylistLoaded(songs: data)),
    );
  }
}
