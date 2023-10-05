import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/models/faqs_model.dart';
import '../repo/profile_repo.dart';

class FAQSUseCase implements UseCase<FAQSModel , NoParams>{
  final ProfileRepo profileRepo;
  FAQSUseCase({required this.profileRepo});
  @override
  Future<Either<Failure, FAQSModel>> call(NoParams params)async {
    return await profileRepo.getFaqs();

  }
}