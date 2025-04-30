import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/network/model/update_trulot.dart';
import 'package:flutter_task/utils/shared_pref_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../network/model/logout_trulot.dart';
import '../../../network/reposetory/dio_reposetory.dart';

part '../event/profile_event.dart';
part '../state/update_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DioReposetory repository = DioReposetory();

  ProfileBloc() : super(UpdateInitial()) {
    on<UpdateProfile>(_onUpdateProfile);
    on<LogoutUser>(_onLogoutUser);
    on<ProfileImage>(_onImageSelected);
  }

  Future<void> _onUpdateProfile(
      UpdateProfile event,
      Emitter<ProfileState> emit,
      ) async {
    emit(UpdateLoading());

    try {
      final response = await repository.updateImageTruLot(event.multipartFile);
      emit(UpdateSuccess(updateProfileTruLotModel: response));
    } catch (e) {
      final response = e is DioException && e.response?.data != null
          ? UpdateProfileTruLotModel.fromJson(e.response?.data)
          : UpdateProfileTruLotModel();

      emit(UpdateFailure(updateProfileTruLotModel: response));
    }
  }

  Future<void> _onLogoutUser(
      LogoutUser event,
      Emitter<ProfileState> emit,
      ) async {
    emit(LogoutLoading());

    try {
      final response = await repository.logOutTruLot();
      await SharedPrefHelper.setString("authToken", "");
      emit(LogoutSuccess(logOutTruLotModel: response));
    } catch (e) {
      final response = e is DioException && e.response?.data != null
          ? LogOutTruLotModel.fromJson(e.response?.data)
          : LogOutTruLotModel();

      emit(LogoutFailure(logOutTruLotModel: response));
    }
  }

  Future<void> _onImageSelected(
      ProfileImage event,
      Emitter<ProfileState> emit,
      ) async {
    emit(ProfileImageSelecting());
    emit(ProfileImageSelected(event.xFile, event.file));
  }
}
