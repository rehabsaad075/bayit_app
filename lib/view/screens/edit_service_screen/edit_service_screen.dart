import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/elevatetButton_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/textFormField_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:bati_app/view_model/utils/icons/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditServiceScreen extends StatelessWidget {
  const EditServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
    value:  AppCubit.get(context)..getActiveServiceFromFireStore(),
     child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.appColor,
          size: 27,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  TextCustom(
          textValue: LocaleKeys.editRequest.tr(),
        ),
      ),
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit cubit=AppCubit.get(context);
          return Form(
            key: cubit.editFormKey,
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                children:  [
                  Row(
                    children: [
                       TextCustom(
                        textValue: LocaleKeys.serviceName.tr(),
                        fontSize: 20,
                      ),
                      TextCustom(
                        textValue: cubit.serviceName??'',
                        fontSize: 20,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                   TextCustom(
                    textValue: LocaleKeys.selectedServices.tr(),
                    fontSize: 20,
                  ),
                  const SizedBox(height: 10,),
                  TextFormFieldCustom(
                    readOnly: true,
                    controller: cubit.editSelectedServicesController,
                  ),
                  const SizedBox(height: 20,),
                  TextFormFieldCustom(
                    hintText: LocaleKeys.otherServices.tr(),
                    controller: cubit.otherServicesController,
                  ),
                  const SizedBox(height: 20,),
                  TextFormFieldCustom(
                    labelText: LocaleKeys.serviceDate.tr(),
                    suffixIcon: AppIcons.date,
                    keyboardType: TextInputType.none,
                    controller: cubit.editServiceDateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.serviceDateValid.tr();
                      }
                      return null;
                    },
                    onTap: () async {
                       DateTime? datePicker= await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 7)),
                      );
                      if (datePicker != null){
                        cubit.editServiceDateController.text=
                        "${datePicker.year}-${datePicker.month}-${datePicker.day}";
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormFieldCustom(
                    labelText: LocaleKeys.serviceTime.tr(),
                    suffixIcon: AppIcons.time,
                    keyboardType: TextInputType.none,
                    controller: cubit.editServiceTimeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.serviceTimeValid.tr();
                      }
                      return null;
                    },
                    onTap: ()async{
                      TimeOfDay ?pickedTime=await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now()
                      );
                      if (pickedTime != null){
                       cubit.editServiceTimeController.text=pickedTime.format(context).toString();
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormFieldCustom(
                    labelText: LocaleKeys.phoneNumber.tr(),
                    suffixIcon: AppIcons.phone,
                    maxLength: 11,
                    keyboardType: TextInputType.phone,
                    controller: cubit.editPhoneNumberController,
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
                  const SizedBox(height: 10,),
                   TextCustom(
                    textValue: LocaleKeys.specifyAddress.tr(),
                    fontSize: 20,
                    //color: AppColors.blackColor,
                  ),
                  const SizedBox(height: 15,),
                  TextFormFieldCustom(
                    labelText: LocaleKeys.cityName.tr(),
                    controller: cubit.editCityNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return LocaleKeys.cityNameValid.tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldCustom(
                          labelText: LocaleKeys.area.tr(),
                          controller: cubit.editAreaController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.areaValid.tr();
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextFormFieldCustom(
                          labelText: LocaleKeys.street.tr(),
                          controller: cubit.editStreetController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return LocaleKeys.streetValid.tr();
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButtonCustom(
                    onPressed: (){
                      if(cubit.editFormKey.currentState!.validate()){
                        cubit.editRequestService().then((value) {
                          showToast(msg: LocaleKeys.editShowToast.tr());
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Visibility(
                      visible: state is EditRequestServiceLoadingState,
                      replacement:  TextCustom(
                        textValue: LocaleKeys.editRequest.tr(),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      child: const CircularProgressIndicator(
                        color: AppColors.appColor,
                      ),
                    ),
                  )
                ]
            ),
          );
        },
      ),
    ),
);
  }
}
