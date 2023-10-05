import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../auth_feature/data/model/user_model.dart';
import '../../data/models/faqs_model.dart';

abstract class ProfileRepo{
  Future<Either<Failure, String>>sendComplaint(Map<String,dynamic> map);
  Future<Either<Failure, FAQSModel>>getFaqs();

}