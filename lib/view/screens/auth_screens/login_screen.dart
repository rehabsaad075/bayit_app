import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/screens/home_page_screen/home_page_screen.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../componetes/custom_widdgets/elevatetButton_custom.dart';
import '../../componetes/custom_widdgets/textFormField_custom.dart';
import '../../componetes/custom_widdgets/text_custom.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthStates>(
        builder: (context, state) {
          AuthCubit authCubit=AuthCubit.get(context);
          return Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 80,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: authCubit.formKeyLoginAuth,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                          'assets/images/login_image.png',
                      ),
                    ),
                    const SizedBox(height: 30,),
                     TextCustom(
                      textValue: LocaleKeys.login.tr(),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 25,),
                     TextCustom(
                      textValue: LocaleKeys.welcomeMessage.tr(),
                      fontSize: 18,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 10,),
                     TextCustom(
                      textValue: LocaleKeys.loginMessage.tr(),
                      fontSize: 18,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 25,),
                    TextFormFieldCustom(
                      labelText: LocaleKeys.email.tr(),
                      controller: authCubit.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.emailValidate.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextFormFieldCustom(
                      labelText: LocaleKeys.password.tr(),
                      suffixIcon: authCubit.suffixIcon,
                      controller: authCubit.passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: authCubit.oldPassword,
                      maxLength: 8,
                      onTapIcon: (){
                        authCubit.changeSuffixIconOldPass();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.passwordValidate.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButtonCustom(
                        onPressed: () {
                          if (authCubit.formKeyLoginAuth.currentState!.validate()) {
                            authCubit.login().then((value) {
                              navigationPushFunction(context: context,
                                screen: const HomePageScreen(),
                              );
                            });
                          }
                        },
                        child: Visibility(
                          visible: state is LoginLoadingState,
                          replacement: TextCustom(
                            textValue: LocaleKeys.login.tr(),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          child: const CircularProgressIndicator(
                            color: AppColors.appColor,
                          ),
                        )
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                         TextCustom(
                          textValue: LocaleKeys.noAccount.tr(),
                          fontSize: 18,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        TextButton(
                            onPressed: () {
                              navigationPushFunction(context: context,
                                screen: const RegisterScreen(),
                              );
                            },
                            child: TextCustom(
                              textValue: LocaleKeys.signUp.tr(),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
