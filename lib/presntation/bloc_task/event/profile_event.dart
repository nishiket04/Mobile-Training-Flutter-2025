part of '../bloc/profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class UpdateProfile extends ProfileEvent {
  final MultipartFile multipartFile;

  UpdateProfile({required this.multipartFile});
}

final class LogoutUser extends ProfileEvent {}
final class ProfileImage extends ProfileEvent{
  final XFile xFile;
  final File file;

  ProfileImage({required this.xFile, required this.file});
}