import 'package:flutter_task/network/model/user_details_model.dart';
import 'package:flutter_task/network/reposetory/dio_reposetory.dart';
import 'package:get/get.dart';

import '../../../network/reposetory/http_reposetory.dart';

class UserDetailsController extends GetxController {
  Rx<UserDetailsModel> response = UserDetailsModel().obs;
  DioReposetory reposetory = DioReposetory();
  HttpReposetory httpReposetory = HttpReposetory();
  RxBool isHttp = false.obs;

  void getUserDetails() async {
    response.value = await reposetory.userProfile();
  }

  void getUserDetailsHttp() async {
    response.value = await httpReposetory.userProfile();
  }

  void changePackage(bool value){
    isHttp.value = value;
  }
}
