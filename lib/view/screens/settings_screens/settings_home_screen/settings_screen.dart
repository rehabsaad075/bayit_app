import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/models/users_model.dart';
import 'package:bati_app/view/componetes/custom_widgets/elevatetButton_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/listTile_item.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view/screens/auth_screens/login_screen.dart';
import 'package:bati_app/view/screens/auth_screens/register_screen.dart';
import 'package:bati_app/view/screens/settings_screens/account_settings_screen/account_settings_screen.dart';
import 'package:bati_app/view/screens/settings_screens/change_address_screen/change_address_screen.dart';
import 'package:bati_app/view/screens/settings_screens/choose_lang_screen/choose_lang_screen.dart';
import 'package:bati_app/view/screens/settings_screens/help_screen/help_center_screen.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/data/local_data/shared_preferences.dart';
import 'package:bati_app/view_model/utils/functions/alertDialog_function.dart';
import 'package:bati_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:bati_app/view_model/utils/icons/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  final UsersModel ?usersModel;

  const SettingsScreen({super.key, this.usersModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 28, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                        textValue: LocaleKeys.welcome.tr(),
                        fontSize: 25,
                        fontWeight: FontWeight.w500
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButtonCustom(
                            onPressed: () {
                              navigationPushFunction(context: context,
                                screen: const LoginScreen(),
                              );
                            },
                            child: TextCustom(
                              textValue: LocaleKeys.login.tr(),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: ElevatedButtonCustom(
                            onPressed: () {
                              navigationPushFunction(context: context,
                                screen: const RegisterScreen(),
                              );
                            },

                            child: TextCustom(
                              textValue: LocaleKeys.signUp.tr(),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35,),
                    ListTileItem(
                      tittleText: LocaleKeys.changeAddress.tr(),
                      leadingIcon: AppIcons.location,
                      onTap: () {
                        navigationPushFunction(context: context,
                          screen: const ChangeAddressScreen(),
                        );
                      },
                    ),
                    const SizedBox(height: 15,),
                    ListTileItem(
                      tittleText: LocaleKeys.accountSettings.tr(),
                      leadingIcon: AppIcons.person,
                      onTap: () {
                        navigationPushFunction(context: context,
                          screen: const AccountSettingsScreen(),
                        );
                      },
                    ),
                    const SizedBox(height: 15,),
                    ListTileItem(
                      tittleText: LocaleKeys.language.tr(),
                      leadingIcon: AppIcons.language,
                      onTap: () {
                        navigationPushFunction(context: context,
                          screen: const ChooseLanguageScreen(),
                        );
                      },
                    ),
                    const SizedBox(height: 15,),
                    ListTileItem(
                      tittleText: LocaleKeys.helpCenter.tr(),
                      leadingIcon: AppIcons.help,
                      onTap: () {
                        navigationPushFunction(context: context,
                          screen: const HelpCenterScreen(),
                        );
                      },
                    ),
                    const SizedBox(height: 25,),
                    SizedBox(
                      width: 170,
                      child: ElevatedButtonCustom(
                        onPressed: () {
                          alertDialogFunction(
                              context: context,
                              title: LocaleKeys.confirmLogout.tr(),
                              subTitle: LocaleKeys.logoutMessage.tr(),
                              textValueButton: LocaleKeys.logout.tr(),
                              onPressed: () {
                                LocalData.clear();
                                FirebaseAuth.instance.signOut();
                                navigationPushFunction(
                                    context: context,
                                    screen: const LoginScreen()
                                );
                                showToast(
                                    msg: LocaleKeys.logoutShowToast.tr());
                              }
                          );
                        },
                        child: TextCustom(
                          textValue: LocaleKeys.logout.tr(),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
