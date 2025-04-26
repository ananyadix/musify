import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify/domain/usecases/getUser.dart';
import 'package:musify/presentation/bloc/profileInfoState.dart';

import '../../serviceLocator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState>{
  ProfileInfoCubit() :super(ProfileInfoLoading());
  Future<void> getUser() async {
    var user = await s1<GetUserUseCase>().call();
    user.fold(
          (l) => emit(ProfileInfoFailed()),
          (userEntity) => emit(ProfileInfoLoaded(userEntity: userEntity)),
    );
  }
}