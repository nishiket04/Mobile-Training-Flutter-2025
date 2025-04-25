import 'dart:convert';
import 'dart:io';

import 'package:flutter_task/network/model/signup_model.dart';
import 'package:flutter_task/utils/http.dart';
import 'package:get/get.dart' hide MultipartFile;

import '../model/user_details_model.dart';

class HttpReposetory{
  late HttpUtils _httpUtils;
  HttpReposetory(){
    _httpUtils = Get.find<HttpUtils>();
  }

  Future<SignupModel> signUp(Map<String,dynamic> data) async {
    var json = await _httpUtils.post("/auth/user/signup",data);
    return SignupModel.fromJson(jsonDecode(json));
  }

  Future<UserDetailsModel> userProfile() async {
    await _httpUtils.addToken();
    var json = await _httpUtils.get("/user/view/profile/details");
    return UserDetailsModel.fromJson(jsonDecode(json));
  }

  Future<UserDetailsModel> updateProfile(Map<String,String> data, File multipartFile) async {
    await _httpUtils.addToken();
    var json = await _httpUtils.patch("/user/profile/update",data,multipartFile);
    return UserDetailsModel.fromJson(jsonDecode(json));
  }
}