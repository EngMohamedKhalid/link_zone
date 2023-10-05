
import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../repo/profile_repo.dart';

class ComplaintsUseCase implements UseCase<String ,ComplaintsUseCaseParams> {
  final ProfileRepo profileRepo;

  ComplaintsUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, String>> call(ComplaintsUseCaseParams params)async {
    return await profileRepo.sendComplaint(params.toMap());
  }

}

class ComplaintsUseCaseParams{
final String name;
final String phone;
final String email;
final String message;

  ComplaintsUseCaseParams({required this.name, required this.phone,required this.email,required this.message});

  Map<String,dynamic > toMap(){
    final map = {
      "name": name,
      "phone": phone,
      "email": email,
      "message": message
    };

    return map;
  }
}