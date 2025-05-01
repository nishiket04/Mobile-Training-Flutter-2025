import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/presntation/bloc_task/bloc/profile_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserUpdateView extends StatefulWidget {
  const UserUpdateView({super.key});

  @override
  State<UserUpdateView> createState() => _UserUpdateView();
}

class _UserUpdateView extends State<UserUpdateView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update Profile"),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody(){
    return Center(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImagePicker(),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildImagePicker(){
    return BlocConsumer<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) => current is ProfileImageSelected,
      listener: (context, state) {
        // You can show a toast or something here
      },
      builder: (context, state) {
        ImageProvider avatarImage;

        if (state is ProfileImageSelected) {
          avatarImage = FileImage(state.file);
        } else {
          avatarImage = const NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4YreOWfDX3kK-QLAbAL4ufCPc84ol2MA8Xg&s",
          );
        }

        return GestureDetector(
          onTap: () async {
            final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
            if (pickedImage != null) {
              context.read<ProfileBloc>().add(ProfileImage(
                xFile: pickedImage,
                file: File(pickedImage.path),
              ));
            }
          },
          child: CircleAvatar(
            backgroundImage: avatarImage,
            radius: 60,
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(){
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildUpdateButton(),
        _buildLogoutButton(),
      ],
    );
  }

  Widget _buildUpdateButton(){
    return BlocConsumer<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final isLoading = state is UpdateLoading;

        return ElevatedButton(
          onPressed: isLoading || state is! ProfileImageSelected
              ? null
              : () async {
            final imageState = state as ProfileImageSelected;
            final file = await MultipartFile.fromFile(
              imageState.xFile.path,
              filename: imageState.xFile.path.split('/').last,
              contentType: DioMediaType('image', 'jpg'),
            );
            context.read<ProfileBloc>().add(UpdateProfile(multipartFile: file));
          },
          child: isLoading
              ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
              : const Text("Update"),
        );
      },
      listener: (context, state) {
        if (state is UpdateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.updateProfileTruLotModel.meta?.message ?? "Updated")),
          );
        }
      },
    );
  }

  Widget _buildLogoutButton(){
    return BlocConsumer<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final isLoading = state is LogoutLoading;
        return ElevatedButton(
          onPressed: isLoading
              ? null
              : () {
            context.read<ProfileBloc>().add(LogoutUser());
          },
          child: isLoading
              ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
              : const Text("Logout"),
        );
      },
      listener: (context, state) {
        if (state is LogoutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.logOutTruLotModel.meta?.message ?? "Logged Out")),
          );
          Navigator.popAndPushNamed(context, "/loginView");
        }
      },
    );
  }
}
