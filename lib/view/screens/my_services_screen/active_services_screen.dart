import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view/screens/edit_service_screen/edit_service_screen.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/functions/alertDialog_function.dart';
import 'package:bati_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componetes/my_services_items/my_services_active_item.dart';

class ActiveServicesScreen extends StatelessWidget {
  const ActiveServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:AppCubit.get(context)..getActiveServices(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          return Scaffold(
            body: Visibility(
              visible: appCubit.activeServicesList.isNotEmpty,
              replacement:   Center(
                child: TextCustom(
                  textValue: LocaleKeys.noActiveMessage.tr(),
                  fontSize: 18,
                ),
              ),
              child: Visibility(
                visible: state is GetActiveServicesLoadingState,
                replacement: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 32),
                    itemBuilder: (context, index) {
                      return MyServiceActiveItem(
                        serviceRequestModel: appCubit.activeServicesList[index],
                        editOnPressed: () {
                          appCubit.changeActiveServiceIndex(index);
                          navigationPushFunction(
                              context: context,
                              screen: const EditServiceScreen()
                          );
                        },
                        deleteOnPressed: () {
                          appCubit.changeActiveServiceIndex(index);
                          alertDialogFunction(
                              context: context,
                              title: LocaleKeys.confirmDelete.tr(),
                              subTitle:LocaleKeys.deleteMessage.tr(),
                              textValueButton: LocaleKeys.delete.tr(),
                              onPressed: () {
                                appCubit.deleteRequestService().then((value) {
                                  showToast(msg: LocaleKeys.deleteMessageSuccess.tr(),
                                      color: AppColors.errorColor);
                                  Navigator.pop(context);
                                });

                              }
                          );
                        },
                        doneOnPressed: (){
                          appCubit.changeActiveServiceIndex(index);
                          appCubit.addDoneServices();
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20,);
                    },
                    itemCount: appCubit.activeServicesList.length
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appColor,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
