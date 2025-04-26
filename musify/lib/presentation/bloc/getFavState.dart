import 'package:musify/domain/entities/songs.dart';

abstract class GetFavState{

}
class GetFavLoading extends GetFavState{

}

class GatFavLoaded extends GetFavState{
  final List<SongEntity> favSong;
  GatFavLoaded({required this.favSong});
}

class GetFavFailed extends GetFavState{

}