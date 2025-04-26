import 'package:dartz/dartz.dart';
import 'package:musify/core/useCase/useCase.dart';
import 'package:musify/serviceLocator.dart';
import 'package:musify/domain/repository/songs/song.dart';

class AddorremovefavsongUseCase implements UseCase<Either,String>{
  @override
  Future<Either> call({String? params}) async{
    return await s1<SongRepo>().addOrRemoveFavouriteSong(params!);
  }
}