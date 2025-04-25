import 'dart:io';

import 'package:dio/src/multipart_file.dart';
import 'package:flutter_task/network/model/user_details_model.dart';
import 'package:flutter_task/network/reposetory/dio_reposetory.dart';
import 'package:get/get.dart' hide MultipartFile;

import '../../../network/reposetory/http_reposetory.dart';

class UpdateProfileController extends GetxController {
  Rx<UserDetailsModel> response = UserDetailsModel().obs;
  DioReposetory reposetory = DioReposetory();
  HttpReposetory httpReposetory = HttpReposetory();
  RxBool isHttp = false.obs;

  void updateUserProfile(Map<String,dynamic> data, MultipartFile multipartFile) async {
    response.value = await reposetory.updateProfile(data,multipartFile);
  }

  void updateUserProfileHttp(Map<String,String> data, File multipartFile) async {
    response.value = await httpReposetory.updateProfile(data,multipartFile);
  }

  void changePackage(bool value){
    isHttp.value = value;
  }
}
