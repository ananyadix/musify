class SongEntity{
  final String  title;
  final String  artist;
  final num  duration;
  final String cover_photo;
  final String song_url;
  final bool isFav;
  final String songId;
  SongEntity({required this.title,required this.artist,required this.duration,required this.cover_photo,required this.song_url,required this.isFav,required this.songId});
}