import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/domain/usecases/getSongCase.dart';
import 'package:musify/presentation/bloc/songState.dart';
import '../../serviceLocator.dart';

class SongCubit extends Cubit<SongState> {
  SongCubit() : super(SongLoading());

  Future<void> getSongs() async {
    final returnedSong = await s1<GetSongUseCase>().call();

    returnedSong.fold(
          (l) => emit(SongLoadFailed()),
          (data) => emit(SongLoaded(songs: data)),
    );
  }
}

