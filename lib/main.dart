import 'dart:io';

import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'view/screens/splash_screen/splash_screen.dart';
import 'view_model/cubits/bloc_observer/bloc_observer.dart';
import 'view_model/data/local_data/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await LocalData.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale(Platform.localeName.split('_').first.toLowerCase()),
      child: const BaytiApp(),
  ));
}

class BaytiApp extends StatelessWidget {
  const BaytiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>AppCubit()),
        BlocProvider(create:(context)=>AuthCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const SplashScreen(),
      ),
    );
  }
}

//تطبيق بيتى يتيح لك طلب خدمات الصيانة مثل فنى مكيفات او كهربائى او سباك ،فاتطبيق بيتى هو الطريقة الافضل لاتمام جميع اعمالك المنزلية
//'The Beyti application allows you to request maintenance services such as an air conditioning technician, electrician, or plumber. The Beyti application is the best way to complete all your household chores.',