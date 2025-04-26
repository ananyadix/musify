import 'package:dartz/dartz.dart';
import 'package:musify/data/sources/song/song_firebase.dart';
import 'package:musify/domain/repository/songs/song.dart';
import 'package:musify/serviceLocator.dart';

import '../../domain/entities/songs.dart';

class SongRepoImple extends SongRepo{
  @override
  Future<Either<String, List<SongEntity>>> getSongs() async{
    return await s1<SongFirebaseService>().getSongs();
  }

  @override
  Future<Either<String, List<SongEntity>>> getPlaylist() async{
    return await s1<SongFirebaseService>().getPlaylist();
  }

  @override
  Future<Either<String, bool>> addOrRemoveFavouriteSong(String songId) async{
    return await s1<SongFirebaseService>().addOrRemoveFavouriteSong(songId);
  }

  @override
  Future<bool> isFavouriteSong(String songId) async{
    return await s1<SongFirebaseService>().isFavouriteSong(songId);
  }

  @override
  Future<Either> getUserFavSong() async{
    return await s1<SongFirebaseService>().getUserFavSong();
  }
}