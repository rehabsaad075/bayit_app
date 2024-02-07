import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/elevatetButton_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/textFormField_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view/screens/auth_screens/login_screen.dart';
import 'package:bati_app/view/screens/settings_screens/account_settings_screen/change_password_screen.dart';
import 'package:bati_app/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/functions/alertDialog_function.dart';
import 'package:bati_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AuthCubit.get(context)..getUserData(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.appColor,
            size: 25,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TextCustom(
            textValue: LocaleKeys.accountSettings.tr(),
          ),
        ),
        body: BlocBuilder<AuthCubit, AuthStates>(
          builder: (context, state) {
            var cubit=AuthCubit.get(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      TextFormFieldCustom(
                      labelText: LocaleKeys.name.tr(),
                       controller: cubit.changeNameController,
                    ),
                    const SizedBox(height: 15,),
                      TextFormFieldCustom(
                      labelText: LocaleKeys.email.tr(),
                      controller: cubit.changeEmailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15,),
                      TextFormFieldCustom(
                      labelText: LocaleKeys.phoneNumber.tr(),
                      controller: cubit.changePhoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              navigationPushFunction(context: context,
                                screen: const ChangePasswordScreen(),
                              );
                            },
                            child: TextCustom(
                              textValue: LocaleKeys.changePassword.tr(),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    ElevatedButtonCustom(
                      onPressed: () {
                        cubit.updateUserData().then((value) {
                          showToast(msg: LocaleKeys.editProfileMessage.tr());
                        });
                      },
                      child: Visibility(
                        visible: state is UpdateUserDataLoadingState,
                        replacement: TextCustom(
                          textValue: LocaleKeys.saveChanges.tr(),
                          fontSize: 20,
                        ) ,
                        child: const CircularProgressIndicator(
                          color: AppColors.appColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    SizedBox(
                      width: 200,
                      child: ElevatedButtonCustom(
                        onPressed: (){
                          alertDialogFunction(
                              context: context,
                              title: LocaleKeys.confirmDeleteAccount.tr(),
                              subTitle: LocaleKeys.deleteAccountMessage.tr(),
                              textValueButton: LocaleKeys.deleteAccount.tr(),
                              onPressed: () {
                                cubit.deleteUserAccount().then((value) {
                                  navigationPushFunction(
                                      context: context,
                                      screen: const LoginScreen()
                                  );
                                  showToast(
                                      msg: LocaleKeys.deleteAccountShowToast.tr(),
                                      color: AppColors.errorColor
                                  );
                                });
                              }
                          );
                        },
                        child: TextCustom(
                          textValue: LocaleKeys.deleteAccount.tr(),
                          fontSize: 20,
                        ) ,),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
