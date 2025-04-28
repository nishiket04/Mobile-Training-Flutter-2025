import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task/presntation/event_bus/controller/event_bus_controller.dart';
import 'package:flutter_task/presntation/event_bus/event_init.dart';
import 'package:flutter_task/presntation/event_bus/user_details.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/regx.dart';
import '../../getX_dio/widget/CustomFormField.dart';

class EventBusTaskState extends GetView<EventBusController> {
  @override
  Widget build(BuildContext context) {
    Get.find<EventInit>().eventBus.on<UserDetails>().listen((event) {
      controller.imgR.value = event.img!;
      controller.name.value = event.name;
      controller.email.value = event.email;
    });
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            children: [
              GestureDetector(
                onTap: () async {
                  final data = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  controller.img.value = data;
                  controller.imgFile.value = File(data!.path);
                },
                child: Obx(
                  () => CircleAvatar(
                    backgroundImage:
                        controller.img.value != null
                            ? FileImage(File(controller.img.value!.path))
                            : NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4YreOWfDX3kK-QLAbAL4ufCPc84ol2MA8Xg&s",
                                )
                                as ImageProvider,
                    radius: 60,
                  ),
                ),
              ),
              CustomFormField(
                controller: controller.nameController,
                prefixIcon: Icons.person,
                emptyErrorTxt: "Please Enter Name",
                hintTxt: "Enter Name",
                textInputType: TextInputType.name,
                validatorErrorTxt: "Please Enter Valid Name",
                validateFunction: RegX.isNameValid,
              ),
              CustomFormField(
                controller: controller.emailController,
                prefixIcon: Icons.email,
                emptyErrorTxt: "Please Enter Email",
                hintTxt: "Enter mail",
                textInputType: TextInputType.name,
                validatorErrorTxt: "Please Enter Valid email",
                validateFunction: RegX.isEmailValid,
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    Get.find<EventInit>().eventBus.fire(
                      UserDetails(
                        controller.nameController.text,
                        controller.emailController.text,
                        controller.imgFile.value,
                      ),
                    );
                  }
                },
                child: Text("Fire Data"),
              ),
              Text("Recived Data"),
              CircleAvatar(
                backgroundImage:
                    controller.imgR != null
                        ? FileImage(File(controller.imgR.value!.path))
                        : NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4YreOWfDX3kK-QLAbAL4ufCPc84ol2MA8Xg&s",
                            )
                            as ImageProvider,
                radius: 60,
              ),
              Text("Name: ${controller.name.value}"),
              Text("Email: ${controller.email.value}"),
            ],
          ),
        ),
      ),
    );
  }
}
