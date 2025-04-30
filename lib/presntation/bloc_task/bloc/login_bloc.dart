import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/network/model/login_trulot.dart';
import 'package:meta/meta.dart';
import '../../../network/reposetory/dio_reposetory.dart';

part '../event/login_event.dart';
part '../state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DioReposetory repository = DioReposetory();

  LoginBloc() : super(LoginInitial()) {
    on<LoginUser>(_onLoginUser);
  }

  Future<void> _onLoginUser(
      LoginUser event,
      Emitter<LoginState> emit,
      ) async {
    emit(LoginLoading());

    try {
      final response = await repository.logInTruLot(event.data);
      emit(LoginSuccess(logInTruLotModel: response));
    } catch (e) {
      final response = e is DioException && e.response?.data != null
          ? LogInTruLotModel.fromJson(e.response?.data)
          : LogInTruLotModel();

      emit(LoginFailure(logInTruLotModel: response));
    }
  }
}
