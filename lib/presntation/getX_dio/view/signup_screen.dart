import 'package:flutter/material.dart';
import 'package:flutter_task/presntation/getX_dio/contoller/signup_controller.dart';
import 'package:flutter_task/presntation/getX_dio/widget/CustomFormField.dart';
import 'package:flutter_task/utils/regx.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<SignupController> {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RxBool _passwordVisible = false.obs;
  RxBool _confirmPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text("Hive:"),
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
                controller: _passwordController,
                prefixIcon: Icons.password,
                emptyErrorTxt: "Please Enter Password",
                hintTxt: "Enter Password",
                textInputType: TextInputType.text,
                validatorErrorTxt:
                    "Password Must contain: \n -> at least one uppercase latter\n -> one lower case latter\n -> one digit and one special character\n -> password length must minimum of 8 character",
                validateFunction: RegX.isPasswordValid,
                obscureText: !_passwordVisible.value,
                suffixIcon: IconButton(
                  icon: Obx(
                    () => Icon(
                      _passwordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  onPressed: () {
                    _passwordVisible.value = !_passwordVisible.value;
                  },
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: !_confirmPasswordVisible.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                  hintText: "Confirm Password ",
                  suffixIcon: IconButton(
                    icon: Obx(
                      () => Icon(
                        _confirmPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    onPressed: () {
                      _confirmPasswordVisible.value =
                          !_confirmPasswordVisible.value;
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter password";
                  } else if (value != _passwordController.text) {
                    return "Confirm Password doesn't match with entered password";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (controller.isHttp.value) {
                      controller.signUpUserHttp({
                        "sFullName": _nameController.text,
                        "sEmail": _emailController.text,
                        "sPassword": _passwordController.text,
                        "sConfirmPassword": _passwordController.text,
                      });
                    } else {
                      controller.signUpUser({
                        "sFullName": _nameController.text,
                        "sEmail": _emailController.text,
                        "sPassword": _passwordController.text,
                        "sConfirmPassword": _passwordController.text,
                      });
                    }
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
