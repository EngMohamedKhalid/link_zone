import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../data/models/home_model.dart';

abstract  class HomeRepo{
  Future<Either<Failure, HomeModel>>getHomeData();
}