import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_candy/core/cache/cache_helper.dart';

import '../../../shared/components/components.dart';
import 'localization_states.dart';


class LocalizationCubit extends Cubit<LocalizationStates> {
  LocalizationCubit() : super(LocalizationInitialState());

  static LocalizationCubit get(context) => BlocProvider.of(context);


  void changeLanguageToArabic() {
    Components.isArabic = true;
    CacheHelper.saveData(key: 'isArabic', value: true);
    emit(LocalizationChangeLanguageArabicState());
  }

  void changeLanguageToEnglish() {
    Components.isArabic = false;
    CacheHelper.saveData(key: 'isArabic', value: false);
    emit(LocalizationChangeLanguageEnglishState());
  }
}