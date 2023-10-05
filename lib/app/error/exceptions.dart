import '../../features/auth_feature/data/model/user_model.dart';

class ServerException implements Exception {
  String cause;
  ServerException(this.cause);

  @override
  String toString() {
    return cause;
  }
}

class CacheException implements Exception {}

class DataParsingException implements Exception {
  String cause;
  DataParsingException(this.cause);

  @override
  String toString() {
    return cause;
  }
}

class ErrorDataException implements Exception {
  String cause;
  ErrorDataException(this.cause);

  @override
  String toString() {
    return cause;
  }
}

class AuthException implements Exception {
  String cause;
  UserModel?  user;
  AuthException(this.cause,{this.user});

  @override
  String toString() {
    return  "$cause $user";
  }
}
