import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/domain/entities/songs.dart';
import 'package:musify/domain/usecases/getUserFavSong.dart';
import 'package:musify/presentation/bloc/getFavState.dart';

import '../../serviceLocator.dart';

class GetFavCubit extends Cubit<GetFavState>{
  GetFavCubit(): super(GetFavLoading());
  List<SongEntity> favSong=[];
  Future<void> getFavSong() async{
    var result=await s1<Getuserfavsong>().call();
    result.fold((l){
      emit(GetFavFailed());
    }, (r){
      favSong=r;
      emit(GatFavLoaded(favSong: favSong));
    });
  }
  void removeSong(int index){
    favSong.removeAt(index);
    emit(GatFavLoaded(favSong: favSong));
  }
}