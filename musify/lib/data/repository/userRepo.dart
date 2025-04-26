import 'package:dartz/dartz.dart';
import 'package:musify/data/sources/auth/auth_firebase.dart';
import 'package:musify/domain/repository/user.dart';

import '../../serviceLocator.dart';

class UserRepoImple implements AuthRepo{
  @override
  Future<Either> getUser() async{
    return await s1<AuthFirebaseServices>().getUser();
  }

}