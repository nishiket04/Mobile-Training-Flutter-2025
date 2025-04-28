import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../event_init.dart';
import '../user_details.dart';

class EventBusController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  Rx<XFile?> img = XFile("").obs;
  Rx<File?> imgFile = File("").obs;
  Rx<File> imgR = File("").obs;
  RxString name = "".obs;
  RxString email = "".obs;
}