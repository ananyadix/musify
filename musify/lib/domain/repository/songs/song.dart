import "package:dartz/dartz.dart";

import "../../entities/songs.dart";

abstract class SongRepo{
  Future<Either<String, List<SongEntity>>> getSongs();
  Future<Either<String, List<SongEntity>>> getPlaylist();
  Future<Either<String, bool>> addOrRemoveFavouriteSong(String songId);
  Future<bool> isFavouriteSong(String songId);
  Future<Either> getUserFavSong();
}