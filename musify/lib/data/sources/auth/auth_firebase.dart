import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musify/data/models/userModel.dart';
import 'package:musify/domain/entities/user.dart';

abstract class AuthFirebaseServices{
  Future<Either> getUser();
}

class AuthFirebaseServicesImpl implements AuthFirebaseServices{
  @override
  Future<Either> getUser() async {
    try{
      FirebaseAuth firebaseAuth=FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
      var user=await firebaseFirestore.collection('User').doc(firebaseAuth.currentUser?.uid).get();
      UserModel userModel=UserModel.fromJson(user.data()!);
      UserEntity userEntity=userModel.toEntity();
      return right(userEntity);
    }
    catch(e){
      return left("An error has occured");
    }
  }

}