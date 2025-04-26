import 'package:get_it/get_it.dart';
import 'package:musify/data/repository/songRepoImple.dart';
import 'package:musify/data/repository/userRepo.dart';
import 'package:musify/data/sources/auth/auth_firebase.dart';
import 'package:musify/data/sources/song/song_firebase.dart';
import 'package:musify/domain/repository/songs/song.dart';
import 'package:musify/domain/repository/user.dart';
import 'package:musify/domain/usecases/addOrRemoveFavSong.dart';
import 'package:musify/domain/usecases/getPlaylist.dart';
import 'package:musify/domain/usecases/getSongCase.dart';
import 'package:musify/domain/usecases/getUser.dart';
import 'package:musify/domain/usecases/getUserFavSong.dart';
import 'package:musify/domain/usecases/isFav.dart';

final s1=GetIt.instance;
Future<void> initializedDependencies() async{
  s1.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl()
  );
  s1.registerSingleton<SongRepo>(
      SongRepoImple()
  );
  s1.registerSingleton<GetSongUseCase>(
      GetSongUseCase()
  );
  s1.registerSingleton<GetPlaylistUseCase>(
    GetPlaylistUseCase()
  );
  s1.registerSingleton<IsfavUseCase>(
    IsfavUseCase()
  );
  s1.registerSingleton<AddorremovefavsongUseCase>(
    AddorremovefavsongUseCase()
  );
  s1.registerSingleton<GetUserUseCase>(
    GetUserUseCase()
  );
  s1.registerSingleton<AuthRepo>(
    UserRepoImple()
  );
  s1.registerSingleton<AuthFirebaseServices>(
    AuthFirebaseServicesImpl()
  );
  s1.registerSingleton<Getuserfavsong>(
      Getuserfavsong()
  );
}