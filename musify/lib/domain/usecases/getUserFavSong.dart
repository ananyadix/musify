import 'package:dartz/dartz.dart';
import 'package:musify/core/useCase/useCase.dart';
import 'package:musify/serviceLocator.dart';
import 'package:musify/domain/repository/songs/song.dart';

class Getuserfavsong implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await s1<SongRepo>().getUserFavSong();
  }
}