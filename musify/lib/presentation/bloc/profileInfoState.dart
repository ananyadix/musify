import 'package:musify/domain/entities/user.dart';

abstract class ProfileInfoState{

}

class ProfileInfoLoading extends ProfileInfoState{

}

class ProfileInfoLoaded extends ProfileInfoState{
  final UserEntity userEntity;
  ProfileInfoLoaded({required this.userEntity});
}

class ProfileInfoFailed extends ProfileInfoState{

}