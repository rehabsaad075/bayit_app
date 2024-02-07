import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/elevatetButton_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/textFormField_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view/screens/home_page_screen/home_page_screen.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:bati_app/view_model/utils/icons/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.appColor,
          size: 27,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  TextCustom(
          textValue: LocaleKeys.sendRequest.tr(),
        ),
      ),
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit cubit=AppCubit.get(context);
          return Form(
            key: cubit.formKey,
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
                        textValue: AppCubit.get(context).serviceName??'',
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
                    controller: cubit.selectedServicesController,
                  ),
                  const SizedBox(height: 20,),
                  TextFormFieldCustom(
                    hintText: LocaleKeys.otherServices.tr(),
                    readOnly: true,
                    controller: cubit.otherServicesController,
                  ),
                  const SizedBox(height: 20,),
                   TextFormFieldCustom(
                    labelText: LocaleKeys.serviceDate.tr(),
                    suffixIcon: AppIcons.date,
                    keyboardType: TextInputType.none,
                    controller: cubit.serviceDateController,
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
                        cubit.serviceDateController.text=
                        "${datePicker.year}-${datePicker.month}-${datePicker.day}";
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                   TextFormFieldCustom(
                    labelText: LocaleKeys.serviceTime.tr(),
                    suffixIcon: AppIcons.time,
                    keyboardType: TextInputType.none,
                    controller: cubit.serviceTimeController,
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
                        cubit.serviceTimeController.text=pickedTime.format(context).toString();
                       }
                     },
                  ),
                  const SizedBox(height: 20,),
                   TextFormFieldCustom(
                    labelText: LocaleKeys.phoneNumber.tr(),
                    suffixIcon: AppIcons.phone,
                    maxLength: 11,
                    keyboardType: TextInputType.phone,
                     controller: cubit.phoneNumberController,
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
                    maxLength: 20,
                    controller: cubit.cityNameController,
                     validator: (value) {
                       if (value!.isEmpty) {
                         return LocaleKeys.cityNameValid.tr();
                       }
                       return null;
                     },
                  ),
                  const SizedBox(height: 10,),
                   Row(
                    children: [
                      Expanded(
                        child: TextFormFieldCustom(
                          labelText: LocaleKeys.area.tr(),
                          maxLength: 25,
                          controller: cubit.areaController,
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
                          maxLength: 20,
                          controller: cubit.streetController,
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
                  const SizedBox(height: 10,),
                  ElevatedButtonCustom(
                    onPressed: (){
                      if(cubit.formKey.currentState!.validate()){
                        cubit.addNewRequestService().then((value) {
                          navigationPushFunction(
                              context: context,
                              screen: const HomePageScreen()
                          );
                        });
                      }
                    },
                    child: Visibility(
                      visible: state is AddNewServiceLoadingState,
                      replacement: TextCustom(
                        textValue: LocaleKeys.sendRequest.tr(),
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
    );
  }
}
