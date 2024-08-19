

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_candy/core/api/api_const.dart';
import 'package:sweet_candy/core/models/user_model.dart';
import 'package:sweet_candy/features/login/manager/login_states.dart';


import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;

import '../../../core/helper/dio_helper.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;


  void showPassword(){
    isPassword = !isPassword;
    emit(ToggleBetweenPasswordState());
  }

  // void login({
  //   required String phone,
  //   required String password,
  // }) async {
  //   final formData = FormData.fromMap({
  //     'mobile_number': phone,
  //     'password': password,
  //   });
  //
  //   try {
  //     emit(LoginLoadingState());
  //     Response response = await DioHelper.postData(
  //       path: ApiConst.login,
  //       data: formData,
  //     );
  //     print(response.statusCode);
  //     print(response.data['message']);
  //     emit(LoginSuccessState());
  //   } catch (error) {
  //     print(error.toString());
  //     emit(LoginErrorState());
  //   }
  // }

}
