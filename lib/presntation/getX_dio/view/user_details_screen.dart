import 'package:flutter/material.dart';
import 'package:flutter_task/network/model/user_details_model.dart';
import 'package:flutter_task/presntation/getX_dio/contoller/user_details_controller.dart';
import 'package:get/get.dart';

// "data": {
// "_id": "6805f9bb0c897c17fc362874",
// "sFullName": "Lalan Desai",
// "sEmail": "test@outlook.com",
// "eLoginMethod": "EMAIL",
// "nPhoneNumber": 1234567890,
// "sProfileImage": "https://yudiz-blockchain.s3.ap-south-1.amazonaws.com/profile/6805f9bb0c897c17fc362874"
// }
class UserDetailsScreen extends GetView<UserDetailsController> {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.isHttp.value) {
      controller.getUserDetailsHttp();
    } else {
      controller.getUserDetails();
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text("Hive:"),
          Obx(
            () => Switch(
              value: controller.isHttp.value,
              onChanged: (value) {
                controller.changePackage(value);
                if (controller.isHttp.value) {
                  controller.response.value = UserDetailsModel();
                  controller.getUserDetailsHttp();
                } else {
                  controller.response.value = UserDetailsModel();
                  controller.getUserDetails();
                }
              },
            ),
          ),
        ],
      ),
      body: Column(
        spacing: 10,
        children: [
          Obx(
            () => CircleAvatar(
              backgroundImage: NetworkImage(
                controller.response.value.data?.sProfileImage ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4YreOWfDX3kK-QLAbAL4ufCPc84ol2MA8Xg&s",
              ),
              radius: 60,
            ),
          ),
          Obx(
            () =>
                Text(controller.response.value.data?.sFullName ?? "User Name"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Number:"),
              Obx(
                () => Text(
                  controller.response.value.data?.nPhoneNumber.toString() ??
                      "--",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Email:"),
              Obx(() => Text(controller.response.value.data?.sEmail ?? "--")),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/updateProfile");
            },
            child: Text("Update Profile"),
          ),
        ],
      ),
    );
  }
}
