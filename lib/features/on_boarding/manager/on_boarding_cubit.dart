import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_candy/core/api/api_const.dart';
import 'package:sweet_candy/core/helper/dio_helper.dart';
import 'package:sweet_candy/core/models/on_boarding_model.dart';
import 'package:sweet_candy/features/on_boarding/manager/on_boarding_states.dart';


class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  OnBoardingModel? onBoardingModel;

  List<OnBoardingModel> onBoardingData = [];
  // void getOnBoardingData(){
  //   DioHelper.getData(path: ApiConst.splash).then((value) {
  //    if(value.statusCode == 200){
  //      onBoardingData = (value.data as List).map((json) => OnBoardingModel.fromJson(json)).toList();
  //     emit(OnBoardingGetSuccessState());
  //    }
  //   }).catchError((error) {
  //     print("Error: ${error.toString()}");
  //     emit(OnBoardingGetErrorState());
  //   });
  // }
}
