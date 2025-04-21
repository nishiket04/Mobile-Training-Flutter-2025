import 'package:flutter/material.dart';

import 'feedback_form.dart';

class ResponsiveForm extends StatefulWidget {
  const ResponsiveForm({super.key});

  @override
  State<ResponsiveForm> createState() => _ResponsiveFormState();
}

class _ResponsiveFormState extends State<ResponsiveForm> {
  final key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isLargeScreen = screenWidth >= 900 || screenHeight >= 900;
    return Scaffold(body: _buildMobileForm(isLargeScreen));
  }

  Widget _buildNameFiled() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: "Enter User Name",
        filled: true,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Fill this Filed";
        }
        if (!isNameValid(value!)) {
          return "Enter valid name";
        }
        return null;
      },
    );
  }

  Widget _buildNumberFiled() {
    return TextFormField(
      controller: _numberController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.call),
        hintText: "Enter Phone Number",
        filled: true,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Fill this Filed";
        }
        if (!isNumberValid(value!)) {
          return "Enter valid name";
        }
        return null;
      },
    );
  }

  Widget _buildEmailFiled() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: "Enter Email Id",
        filled: true,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Fill this Filed";
        }
        if (!isEmailValid(value!)) {
          return "Enter valid name";
        }
        return null;
      },
    );
  }

  Widget _buildFeedbackFiled() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Write your feedBack",
        filled: true,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.feed_sharp),
      ),
    );
  }

  Widget _buildMobileForm(bool isLargeScreen) {
    return Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 15,
          children: [
            _buildNameFiled(),
            _buildNumberFiled(),
            _buildEmailFiled(),
            isLargeScreen
                ? SizedBox(height: 0, width: 0)
                : _buildFeedbackFiled(),
            ElevatedButton(
              onPressed: () {
                if (isLargeScreen && key.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackForm()),
                  );
                  return;
                }
                if (key.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: isLargeScreen ? Text("Next") : Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  bool isNameValid(String name) {
    return RegExp(r"^[A-Za-z]+(?: [A-Za-z]+)*$").hasMatch(name);
  }

  bool isNumberValid(String number) {
    return RegExp(r'^[0-9]+$').hasMatch(number);
  }
}
