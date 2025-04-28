import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/presntation/getX_dio/contoller/update_profile_controller.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:image_picker/image_picker.dart';

import '../../../utils/regx.dart';
import '../widget/CustomFormField.dart';

class UpdateProfileScreen extends GetView<UpdateProfileController> {
  UpdateProfileScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  Rx<XFile?> img = XFile("").obs;
  Rx<File?> imgFile = File("").obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text("Http:"),
          Obx(
            () => Switch(
              value: controller.isHttp.value,
              onChanged: (value) {
                controller.changePackage(value);
              },
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  final data = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  img.value = data;
                  imgFile.value = File(data!.path);
                },
                child: Obx(
                  () => CircleAvatar(
                    backgroundImage: img.value != null
                        ? FileImage(File(img.value!.path))
                        : NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4YreOWfDX3kK-QLAbAL4ufCPc84ol2MA8Xg&s") as ImageProvider,
                    radius: 60,
                  ),
                ),
              ),
              CustomFormField(
                controller: _nameController,
                prefixIcon: Icons.person,
                emptyErrorTxt: "Please Enter Name",
                hintTxt: "Enter Name",
                textInputType: TextInputType.name,
                validatorErrorTxt: "Please Enter Valid Name",
                validateFunction: RegX.isNameValid,
              ),
              CustomFormField(
                controller: _emailController,
                prefixIcon: Icons.email,
                emptyErrorTxt: "Email is required",
                hintTxt: "Enter Email",
                textInputType: TextInputType.emailAddress,
                validatorErrorTxt: "Enter a valid email address",
                validateFunction: RegX.isEmailValid,
              ),
              CustomFormField(
                controller: _numberController,
                prefixIcon: Icons.call,
                emptyErrorTxt: "Please Enter Number",
                hintTxt: "Enter Mobile Number",
                textInputType: TextInputType.text,
                validatorErrorTxt: "Mobile Number be at least 10 digit long",
                validateFunction: RegX.isNumberValid,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (controller.isHttp.value) {
                      controller.updateUserProfileHttp(
                        {
                          "sUserName": _nameController.text,
                          "sEmail": _emailController.text,
                          "nPhoneNumber": _numberController.text,
                        },imgFile.value!
                      );
                    }
                    else {
                      controller.updateUserProfile(
                        {
                          "sUserName": _nameController.text,
                          "sEmail": _emailController.text,
                          "nPhoneNumber": _numberController.text,
                        },
                        await MultipartFile.fromFile(
                          img.value!.path,
                          filename: img.value?.path
                              .split('/')
                              .last,
                          contentType: DioMediaType('image', 'jpg'),
                        ),
                      );
                    }
                  }
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
