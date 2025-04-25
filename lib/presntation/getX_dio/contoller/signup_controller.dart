import 'package:flutter_task/network/model/signup_model.dart';
import 'package:flutter_task/network/reposetory/dio_reposetory.dart';
import 'package:flutter_task/network/reposetory/http_reposetory.dart';
import 'package:flutter_task/utils/dio.dart';
import 'package:flutter_task/utils/shared_pref_helper.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  Rx<SignupModel> response = SignupModel().obs;
  DioReposetory reposetory = DioReposetory();
  HttpReposetory httpReposetory = HttpReposetory();
  RxBool isHttp = false.obs;

  void signUpUser(Map<String, dynamic> data) async {
    await reposetory.signUp(data).then((value) {
      response.value = value;
    });
    print("In controller k ${reposetory.hashCode}");
    if (response.value.data!.sToken!.isNotEmpty) {
      await SharedPrefHelper.setString(
        "authToken",
        response.value.data?.sToken.toString()??"",
      );
      await Get.find<DioUtils>().addToken();
      Get.toNamed("/userDetails");
    }
  }

  void signUpUserHttp(Map<String, dynamic> data) async {
    await httpReposetory.signUp(data).then((value) {
      response.value = value;
    });
    print("In controller k ${reposetory.hashCode}");
    if (response.value.data!.sToken!.isNotEmpty) {
      await SharedPrefHelper.setString(
        "authToken",
        response.value.data?.sToken.toString()??"",
      );
      await Get.find<DioUtils>().addToken();
      Get.toNamed("/userDetails");
    }
  }

  void changePackage(bool value){
    isHttp.value = value;
  }
}
