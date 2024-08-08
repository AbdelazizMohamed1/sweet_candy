import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_candy/features/signup/manager/signup_states.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;


class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  bool isRePassword = true;

  void showPassword(){
    isPassword = !isPassword;
    emit(ToggleBetweenPasswordState());
  }

  void showRePassword(){
    isRePassword = !isRePassword;
    emit(ToggleBetweenPasswordState());
  }
  File? image;

  String? _imageName;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      _imageName = path.basename(pickedFile.path);
      print('++++++++++++++++++++++++++++++++ ${image!.uri} ++++++++++++++++++++++++++++++++++');
      emit(ProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(ProfileImagePickedErrorState());
    }

  }

}
