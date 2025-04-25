import 'package:flutter_task/presntation/getX_dio/contoller/signup_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController(),fenix: true);
  }

}