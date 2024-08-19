import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sweet_candy/features/home/body/home_body/home_body_screen.dart';
import 'package:sweet_candy/features/home/body/order_body/order_body_screen.dart';
import 'package:sweet_candy/features/home/body/profile_body/profile_body_screen.dart';
import 'package:sweet_candy/features/home/body/search_body/search_body_screen.dart';
import 'package:sweet_candy/features/home/manager/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int bodyIndex = 0;
  List<Widget> body = [
    const HomeBodyScreen(),
    const OrderBodyScreen(),
    const SearchBodyScreen(),
    const ProfileBodyScreen()
  ];

  void toggleBetweenBody(int index){
    bodyIndex = index ;
    emit(HomeChangeBodyState());
  }


}
