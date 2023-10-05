
import '../../features/auth_feature/data/model/user_model.dart';

abstract class Failure {
  String? cause;
  Failure([this.cause]);

}

// General failures
class ServerFailure extends Failure {
  String? cause;
  ServerFailure(this.cause) : super(cause);
}

class AmbiguousFailure extends Failure {
  String? cause;
  AmbiguousFailure(this.cause) : super(cause);
}

class ConnectionFailure extends Failure {
  String? cause;
  ConnectionFailure(this.cause) : super(cause);
}

class DataParsingFailure extends Failure {
  String? cause;
  DataParsingFailure(this.cause) : super(cause);
}

class AuthFailure extends Failure {
  @override
  String? cause;
  UserModel?  user;
  AuthFailure(this.cause,this.user) : super(cause);
}
