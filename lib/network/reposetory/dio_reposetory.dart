import 'package:dio/src/multipart_file.dart';
import 'package:flutter_task/network/model/login_trulot.dart';
import 'package:flutter_task/network/model/logout_trulot.dart';
import 'package:flutter_task/network/model/signup_model.dart';
import 'package:flutter_task/network/model/update_trulot.dart';
import 'package:flutter_task/utils/dio.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';

import '../model/user_details_model.dart';

class DioReposetory{
  late DioUtils _dioUtils;
  DioReposetory(){
    _dioUtils = Get.find<DioUtils>();
  }
  
  Future<SignupModel> signUp(Map<String,dynamic> data) async {
    var json = await _dioUtils.post("/auth/user/signup",data);
    return SignupModel.fromJson(json);
  }

  Future<UserDetailsModel> userProfile() async {
    await _dioUtils.addToken();
    var json = await _dioUtils.get("/user/view/profile/details");
    return UserDetailsModel.fromJson(json);
  }

  Future<UserDetailsModel> updateProfile(Map<String,dynamic> data, MultipartFile multipartFile) async {
    await _dioUtils.addToken();
    var json = await _dioUtils.patch("/user/profile/update",data,multipartFile);
    return UserDetailsModel.fromJson(json);
  }

  Future<LogInTruLotModel> logInTruLot(Map<String,dynamic> data) async {
    var json = await _dioUtils.post("/login",data);
    return LogInTruLotModel.fromJson(json);
  }

  Future<LogOutTruLotModel> logOutTruLot() async {
    await _dioUtils.addToken();
    var json = await _dioUtils.post("/logout");
    return LogOutTruLotModel.fromJson(json);
  }

  Future<UpdateProfileTruLotModel> updateImageTruLot(MultipartFile multipartFile) async {
    await _dioUtils.addToken();
    var json = await _dioUtils.postImage("/update/avatar",multipartFile);
    return UpdateProfileTruLotModel.fromJson(json);
  }

}