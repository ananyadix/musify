import 'package:dartz/dartz.dart';
import 'package:musify/core/useCase/useCase.dart';
import 'package:musify/domain/repository/user.dart';

import '../../serviceLocator.dart';

class GetUserUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await s1<AuthRepo>().getUser();
  }

}