import 'package:flutter_task/presntation/getX_dio/contoller/update_profile_controller.dart';
import 'package:flutter_task/presntation/getX_dio/contoller/user_details_controller.dart';
import 'package:get/get.dart';

class UpdateProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(() => UpdateProfileController(),fenix: true);
  }
}