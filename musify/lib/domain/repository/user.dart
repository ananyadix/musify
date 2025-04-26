import 'package:dartz/dartz.dart';

abstract class AuthRepo{
  Future<Either> getUser();
}