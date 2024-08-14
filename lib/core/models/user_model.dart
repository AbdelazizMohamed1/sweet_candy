import 'dart:io';

class UserModel {
  String? status;
  String? message;
  UserData? userdata;


  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userdata = json['user_data'] != null ? UserData?.fromJson(json['user_data']) : null;
  }

}

class UserData {
  String? name;
  File? profilePicture;
  String? shopName;
  String? address;
  String? mobileNumber;
  String? token;
  String? password;
  String? confirmPassword;



  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePicture = json['profile_picture'];
    shopName = json['shop_name'];
    address = json['address'];
    mobileNumber = json['mobile_number'];
    token = json['token'];

  }


}

