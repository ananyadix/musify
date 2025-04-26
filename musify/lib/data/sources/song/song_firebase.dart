import "package:cloud_firestore/cloud_firestore.dart";
import "package:dartz/dartz.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:musify/data/models/songModel.dart";
import "package:musify/domain/entities/songs.dart";
import "package:musify/domain/usecases/isFav.dart";

import "../../../serviceLocator.dart";

abstract class SongFirebaseService {
  Future<Either<String, List<SongEntity>>> getSongs();
  Future<Either<String, List<SongEntity>>> getPlaylist();
  Future<Either<String, bool>> addOrRemoveFavouriteSong(String songId);
  Future<bool> isFavouriteSong(String songId);
  Future<Either> getUserFavSong();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either<String, List<SongEntity>>> getSongs() async {
    try {
      print("🛜 Fetching songs from Firestore...");
      List<SongEntity> songs = [];

      var data = await FirebaseFirestore.instance.collection('songs')
          .limit(3)
          .get();
      print("📄 Documents fetched: ${data.docs.length}");

      for (var element in data.docs) {
        print("➡️ Raw document data: ${element.data()}");

        var songModel = SongModel.fromJson(element.data());
        bool isFav = await s1<IsfavUseCase>().call(
            params: element.reference.id);
        songModel.isFav = isFav;
        songModel.songId = element.reference.id;
        print("🎵 Parsed song: ${songModel.title}, ${songModel.artist}");
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e, stacktrace) {
      print("🔥 Error fetching songs: $e");
      print("🧵 Stacktrace: $stacktrace");
      return Left("An error occurred while fetching songs");
    }
  }

  @override
  Future<Either<String, List<SongEntity>>> getPlaylist() async {
    try {
      print("🛜 Fetching playlist from Firestore...");
      List<SongEntity> songs = [];

      var data = await FirebaseFirestore.instance.collection('songs').get();
      print("📄 Documents fetched: ${data.docs.length}");

      for (var element in data.docs) {
        print("➡️ Raw document data: ${element.data()}");

        var songModel = SongModel.fromJson(element.data());
        bool isFav = await s1<IsfavUseCase>().call(
            params: element.reference.id);
        songModel.isFav = isFav;
        songModel.songId = element.reference.id;

        print("🎵 Parsed song: ${songModel.title}, ${songModel.artist}");
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e, stacktrace) {
      print("🔥 Error fetching playlist: $e");
      print("🧵 Stacktrace: $stacktrace");
      return Left("An error occurred while fetching the playlist");
    }
  }

  @override
  Future<Either<String, bool>> addOrRemoveFavouriteSong(String songId) async {
    try {
      final firebaseFirestore = FirebaseFirestore.instance;
      final firebaseAuth = FirebaseAuth.instance;
      final user = firebaseAuth.currentUser;

      if (user == null) {
        return Left("User not logged in");
      }

      final uId = user.uid;
      final favCollection = firebaseFirestore
          .collection('User')
          .doc(uId)
          .collection('Favourite');

      final favouriteSong = await favCollection
          .where('songId', isEqualTo: songId)
          .get();

      bool isFav;

      if (favouriteSong.docs.isNotEmpty) {
        await favouriteSong.docs.first.reference.delete();
        isFav = false;
      } else {
        await favCollection.add({
          'songId': songId,
          'addedDate': Timestamp.now(),
        });
        isFav = true;
      }

      return Right(isFav);
    } catch (e) {
      print("❌ Error in addOrRemoveFavouriteSong: $e");
      return Left("An error has occurred");
    }
  }

  @override
  Future<bool> isFavouriteSong(String songId) async {
    try {
      final firebaseFirestore = FirebaseFirestore.instance;
      final firebaseAuth = FirebaseAuth.instance;
      final user = firebaseAuth.currentUser;

      if (user == null) {
        return false;
      }

      final uId = user.uid;
      final favCollection = firebaseFirestore
          .collection('User')
          .doc(uId)
          .collection('Favourite');

      final favouriteSong = await favCollection
          .where('songId', isEqualTo: songId)
          .get();


      if (favouriteSong.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("❌ Error in addOrRemoveFavouriteSong: $e");
      return false;
    }
  }

  @override
  Future<Either> getUserFavSong() async{
    try {
      final firebaseFirestore = FirebaseFirestore.instance;
      final firebaseAuth = FirebaseAuth.instance;
      final user = firebaseAuth.currentUser;
      List<SongEntity> favSongs=[];
      String uId=user!.uid;
      QuerySnapshot favSnap=await firebaseFirestore.collection('User').doc(uId).collection('Favourite').get();
      for(var element in favSnap.docs){
        String songId=element['songId'];
        var song=await firebaseFirestore.collection('songs').doc(songId).get();
        SongModel songModel=SongModel.fromJson(song.data()!);
        songModel.isFav=true;
        songModel.songId=songId;
        favSongs.add(songModel.toEntity());
      }
      return Right(favSongs);
    }
      catch (e) {
        return Left("An error occured");
    }
  }
}


