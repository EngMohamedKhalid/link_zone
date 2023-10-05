part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class AccountInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ContactUsLoading extends ProfileState {
  @override
  List<Object> get props => [];
}
class UpdateProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}
class UpdatePasswordLoading extends ProfileState {
  @override
  List<Object> get props => [];
}
class AccountVisiblePasswordState extends ProfileState {
  final bool isVisible;
  const AccountVisiblePasswordState(this.isVisible);
  @override
  List<Object?> get props => [isVisible];
}
