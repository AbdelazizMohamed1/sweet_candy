import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_candy/features/on_boarding/manager/on_boarding_cubit.dart';
import 'package:sweet_candy/features/on_boarding/on_boarding_screen.dart';
import 'package:sweet_candy/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc_observier.dart';
import 'core/helper/dio_helper.dart';
import 'features/signup/manager/signup_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()..getOnBoardingData()),
        BlocProvider(create: (context) => SignupCubit(),)
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnBoardingScreen(),
    );
  }
}