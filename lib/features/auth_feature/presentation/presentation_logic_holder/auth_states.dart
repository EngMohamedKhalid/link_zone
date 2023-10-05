
part of 'auth_cubit.dart';
abstract class AuthStates extends Equatable {
  const AuthStates();
}

class AuthInitial extends AuthStates {
  @override
  List<Object> get props => [];
}
class AuthVisiblePasswordState extends AuthStates {
  final bool isVisible;
  const AuthVisiblePasswordState(this.isVisible);
  @override
  List<Object?> get props => [isVisible];
}
class AuthVisibleNewPasswordState extends AuthStates {
  @override
  List<Object?> get props => [];
}
class AuthVisibleOldPasswordState extends AuthStates {
  @override
  List<Object?> get props => [];
}
class LoadingState extends AuthStates {
  @override
  List<Object?> get props => [];
}
class ForgetPasswordLoadingState extends AuthStates {
  @override
  List<Object?> get props => [];
}
class VerifyLoadingState extends AuthStates {
  @override
  List<Object?> get props => [];
}
class ResetPasswordLoadingState extends AuthStates {
  @override
  List<Object?> get props => [];
}