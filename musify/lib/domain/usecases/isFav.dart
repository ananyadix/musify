import 'package:musify/core/useCase/useCase.dart';
import 'package:musify/serviceLocator.dart';
import 'package:musify/domain/repository/songs/song.dart';

class IsfavUseCase implements UseCase<bool,String>{
  @override
  Future<bool> call({String? params}) async{
    return await s1<SongRepo>().isFavouriteSong(params!);
  }
}