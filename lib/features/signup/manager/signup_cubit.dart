import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  void showPassword() {
    isPassword = !isPassword;
    emit(ToggleBetweenPasswordState());
  }

  void showRePassword() {
    isRePassword = !isRePassword;
    emit(ToggleBetweenPasswordState());
  }

  XFile? image;
  //pick and upload image from gallery
  Future<String?> pickAndUploadImage(String userId) async {
    emit(UploadImageLoadingState());
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File imageFile = File(image!.path);

      try {
        Reference storageReference =
            storage.ref().child('user_images/$userId/profile_image.jpg');

        UploadTask uploadTask = storageReference.putFile(imageFile);
        await uploadTask.whenComplete(() => null);

        String? downloadURL;
        downloadURL = await storageReference.getDownloadURL();
        emit(UploadImageSuccessState());
        return downloadURL;
      } catch (e) {
        print('Error uploading image: $e');
        emit(UploadImageErrorState());
        return null;
      }
    }

    return null;
  }

  //sign up
  UserCredential? userCredential;
  User? user;
  Future<void> signup({
    required String imageUrl,
    required String userName,
    required String shopName,
    required String shopAddress,
    required String phone,
    required String email,
    required String password,

  }) async {
    emit(RegisterLoadingState());
    userCredential = await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      user = value.user!;
      saveUserData(
        userName:  userName,
        uid: user!.uid,
        imageUrl: imageUrl,
        shopName: shopName,
        shopAddress: shopAddress,
        phone: phone,
        email: email,
        isVerified: false,
      );
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }

  //save user data
  Future<void> saveUserData({
    required String uid,
    required String imageUrl,
    required String userName,
    required String shopName,
    required String shopAddress,
    required String phone,
    required String email,
    required bool isVerified,
  }) async {
    emit(SaveUserLoadingState());
    CollectionReference users = fireStore.collection('users');

    await users.doc(uid).set({
      'uid': uid,
      'imageUrl': imageUrl,
      'userName': userName,
      'shopName': shopName,
      'shopAddress': shopAddress,
      'phone': phone,
      'email': email,
      'isVerified': isVerified,
      'createdAt': FieldValue.serverTimestamp(),
    }).then(
      (value) {
        print('User data saved successfully!');
        emit(SaveUserSuccessState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(SaveUserErrorState());
    });
  }
}
