import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../componetes/my_services_items/my_service_done_item.dart';

class DoneServicesScreen extends StatelessWidget {
  const DoneServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AppCubit.get(context)..getDoneService(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          return Scaffold(
            body: Visibility(
              visible: appCubit.doneServiceList.isNotEmpty,
              replacement:   Center(
                child: TextCustom(
                  textValue: LocaleKeys.noDonMessage.tr(),
                  fontSize: 18,
                ),
              ),
              child: Visibility(
                visible: state is GetDoneServiceLoadingState,
                replacement: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 32),
                    itemBuilder: (context, index) {
                      return MyServiceDoneItem(servicesModel:appCubit.doneServiceList[index],);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20,);
                    },
                    itemCount: appCubit.doneServiceList.length
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
