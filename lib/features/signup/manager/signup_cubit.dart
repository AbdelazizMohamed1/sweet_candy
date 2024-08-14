

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_candy/core/api/api_const.dart';
import 'package:sweet_candy/core/models/user_model.dart';
import 'package:sweet_candy/features/signup/manager/signup_states.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;

import '../../../core/helper/dio_helper.dart';


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

  String? imageName;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imageName = path.basename(pickedFile.path);
      print('++++++++++++++++++++++++++++++++ ${image!.path} ++++++++++++++++++++++++++++++++++');
      emit(ProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(ProfileImagePickedErrorState());
    }

  }


  void register({
    required String name,
    required String shopName,
    required String address,
    required String phone,
    required String password,
    required String confirmationPassword,
    required File? image,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      'shop_name': shopName,
      'address': address,
      'mobile_number': phone,
      'password': password,
      'confirm_password': confirmationPassword,
      if (image != null)
        'profile_picture': await MultipartFile.fromFile(
          image.path,
          filename: 'profile_picture.jpg',
        ),
    });

    try {
      emit(RegisterLoadingState());


      Response response = await DioHelper.postData(
        path: ApiConst.register,
        data: formData,
      );

      print(response.statusCode);
      print(response.data['message']);
      emit(RegisterSuccessState());
    } catch (error) {
      print(error.toString());
      emit(RegisterErrorState());
    }
  }

}
