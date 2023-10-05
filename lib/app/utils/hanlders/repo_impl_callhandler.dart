import 'package:dartz/dartz.dart';

import '../../error/exceptions.dart';
import '../../error/failures.dart';
import '../../network/network_info.dart';

class RepoImplCallHandler<T> {
  final NetworkInfo networkInfo;
  RepoImplCallHandler(this.networkInfo);

  Future<Either<Failure, T>> call(Future<T> Function() datasourceCall) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await datasourceCall());
      } on DataParsingException catch(e) {
        return Left(DataParsingFailure(e.toString()));
      } on ServerException catch (e) {
        return Left(ServerFailure(e.toString()));
      } on AuthException catch (e) {
        return Left(AuthFailure(e.cause,e.user));
      } catch (e) {
        return Left(AmbiguousFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure("phone not connected"));
    }
  }
}
