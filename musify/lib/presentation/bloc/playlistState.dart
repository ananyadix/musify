import 'package:musify/domain/entities/songs.dart';

abstract class PlaylistState{
}

class PlaylistLoading extends PlaylistState{}

class PlaylistLoaded extends PlaylistState{
  final List<SongEntity> songs;
  PlaylistLoaded({required this.songs});
}

class PlaylistLoadFailed extends PlaylistState{}