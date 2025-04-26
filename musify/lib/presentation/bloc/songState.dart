import 'package:musify/domain/entities/songs.dart';

abstract class SongState{

}

class SongLoading extends SongState{}

class SongLoaded extends SongState{
  final List<SongEntity> songs;
  SongLoaded({required this.songs});
}

class SongLoadFailed extends SongState{}