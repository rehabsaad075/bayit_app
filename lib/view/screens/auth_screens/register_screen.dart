import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../componetes/custom_widdgets/elevatetButton_custom.dart';
import '../../componetes/custom_widdgets/textFormField_custom.dart';
import '../../componetes/custom_widdgets/text_custom.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              top: 100,
              bottom: 10
            ),
            child: SingleChildScrollView(
              child: Form(
                key: authCubit.formKeyRegisterAuth,
                child: Column(
                  children: [
                     TextCustom(
                      textValue: LocaleKeys.signUp.tr(),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 25,),
                     TextCustom(
                      textValue: LocaleKeys.registerMessage.tr(),
                      fontSize: 16,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 25,),
                    TextFormFieldCustom(
                      labelText: LocaleKeys.name.tr(),
                      controller: authCubit.nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.nameValidate.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15,),
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
                      labelText: LocaleKeys.phoneNumber.tr(),
                      maxLength: 11,
                      controller: authCubit.phoneController,
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.phoneValidate.tr();
                        }
                        else if(value.length!=11){
                          return LocaleKeys.phoneLengthValid.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextFormFieldCustom(
                      labelText: LocaleKeys.password.tr(),
                      maxLength: 8,
                      suffixIcon: authCubit.suffixIcon,
                      controller: authCubit.passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: authCubit.oldPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onTapIcon: (){
                        authCubit.changeSuffixIconOldPass();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.passwordValidate.tr();
                        }
                        else if(value.length!=8){
                          return LocaleKeys.passwordLengthValid.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButtonCustom(
                        onPressed: () {
                          if (authCubit.formKeyRegisterAuth.currentState!.validate()) {
                            authCubit.register().then((value) {
                              navigationPushFunction(context: context,
                                screen: const LoginScreen(),
                              );
                            });
                          }
                        },
                        child: Visibility(
                          visible: state is RegisterLoadingState,
                          replacement:  TextCustom(
                            textValue: LocaleKeys.signUp.tr(),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          child:  const CircularProgressIndicator(
                            color: AppColors.appColor,
                          ),
                        )
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                         TextCustom(
                          textValue: LocaleKeys.haveAccount.tr(),
                          fontSize: 16,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        TextButton(
                            onPressed: () {
                              navigationPushFunction(context: context,
                                  screen: const LoginScreen(),
                              );
                            },
                            child:  TextCustom(
                              textValue: LocaleKeys.login.tr(),
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