part of '../bloc/profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class UpdateInitial extends ProfileState {}

final class UpdateLoading extends ProfileState {}

final class UpdateSuccess extends ProfileState {
  final UpdateProfileTruLotModel updateProfileTruLotModel;

  UpdateSuccess({required this.updateProfileTruLotModel});
}

final class UpdateFailure extends ProfileState {
  final UpdateProfileTruLotModel updateProfileTruLotModel;

  UpdateFailure({required this.updateProfileTruLotModel});
}

final class LogoutLoading extends ProfileState {}

final class LogoutSuccess extends ProfileState {
  final LogOutTruLotModel logOutTruLotModel;

  LogoutSuccess({required this.logOutTruLotModel});
}

final class LogoutFailure extends ProfileState {
  final LogOutTruLotModel logOutTruLotModel;

  LogoutFailure({required this.logOutTruLotModel});
}

final class ProfileImageSelected extends ProfileState {
  final XFile xFile;
  final File file;

  ProfileImageSelected(this.xFile, this.file);
}

final class ProfileImageSelecting extends ProfileState{}
