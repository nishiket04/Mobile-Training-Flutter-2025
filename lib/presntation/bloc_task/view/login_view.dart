import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/presntation/bloc_task/bloc/login_bloc.dart';
import '../../../utils/regx.dart';
import '../../getX_dio/widget/CustomFormField.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Login"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                CustomFormField(
                  controller: _numberController,
                  prefixIcon: Icons.call,
                  emptyErrorTxt: "Number is required",
                  hintTxt: "Enter Mobile Number",
                  textInputType: TextInputType.number,
                  validatorErrorTxt: "Mobile Number length should be 10 digits",
                  validateFunction: RegX.isNumberValid,
                ),
                CustomFormField(
                  controller: _pinController,
                  prefixIcon: Icons.pin,
                  emptyErrorTxt: "Pin is required",
                  hintTxt: "Enter Pin",
                  textInputType: TextInputType.number,
                  validatorErrorTxt: "Pin length should be 4 digits",
                  validateFunction: RegX.isPinNumberValid,
                ),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      final model = state.logInTruLotModel;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(model.meta?.message ?? "Login Successful")),
                      );
                      Navigator.popAndPushNamed(context, "/userdetailView");
                    } else if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.logInTruLotModel.meta?.message ?? "Login failed")),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(
                            LoginUser(
                              data: {
                                "contact_number": _numberController.text,
                                "pin": _pinController.text,
                              },
                            ),
                          );
                        }
                      },
                      child: state is LoginLoading
                          ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                          : const Text("Submit"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
