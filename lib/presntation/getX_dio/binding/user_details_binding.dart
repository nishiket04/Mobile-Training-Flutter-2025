import 'package:flutter_task/presntation/getX_dio/contoller/user_details_controller.dart';
import 'package:get/get.dart';

class UserDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserDetailsController>(() => UserDetailsController(),fenix: true);
  }
}