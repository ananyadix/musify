import 'package:musify/domain/entities/songs.dart';

class SongModel{
  String ? title;
  String ? artist;
  num ? duration;
  String ? cover_photo;
  String ? song_url;
  bool ? isFav;
  String ? songId;
  SongModel({required this.title,required this.artist,required this.duration, required this.cover_photo,required this.song_url,required this.isFav,required this.songId});
  SongModel.fromJson(Map<String,dynamic> data){
    title=data['title'];
    artist=data['artist'];
    duration=data['duration'];
    cover_photo=data['cover_photo'];
    song_url=data['song_url'];
    isFav=data['isFav'];
    songId=data['songId'];
  }
}

extension SongModelX on SongModel{
  SongEntity toEntity(){
    return SongEntity(title: title!, artist: artist!, duration: duration!,cover_photo: cover_photo!,song_url: song_url!, isFav: isFav!, songId: songId!);
  }
}