import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/models/services_model.dart';
import 'package:bati_app/models/services_logo_model.dart';
import 'package:bati_app/view/screens/home_screen/home_screen.dart';
import 'package:bati_app/view/screens/my_services_screen/my_services_screen.dart';
import 'package:bati_app/view/screens/services_screens/air_conditioning_screen/air_conditioning_screen.dart';
import 'package:bati_app/view/screens/services_screens/carpentry_screen/carpentry_screen.dart';
import 'package:bati_app/view/screens/services_screens/electrical_appliances_screen/electrical_appliances_screen.dart';
import 'package:bati_app/view/screens/services_screens/electricity_screen/electricity_screen.dart';
import 'package:bati_app/view/screens/services_screens/house_cleaning_screen/house_cleaning_screen.dart';
import 'package:bati_app/view/screens/services_screens/painting_screen/painting_screen.dart';
import 'package:bati_app/view/screens/services_screens/pest_control_screen/pest_control_screen.dart';
import 'package:bati_app/view/screens/services_screens/plumbing_screen/plumbing_screen.dart';
import 'package:bati_app/view/screens/services_screens/services_home_screen/services_screen.dart';
import 'package:bati_app/view/screens/services_screens/surve_camera_screen/surve_camera_screen.dart';
import 'package:bati_app/view/screens/services_screens/tv_and_receiver_screen/tv_and_receiver_screen.dart';
import 'package:bati_app/view/screens/settings_screens/settings_home_screen/settings_screen.dart';
import 'package:bati_app/view_model/data/firebase/firebaseKeys.dart';
import 'package:bati_app/view_model/data/local_data/shared_keys.dart';
import 'package:bati_app/view_model/data/local_data/shared_preferences.dart';
import 'package:bati_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/boarding_model.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
 static AppCubit get(context)=>BlocProvider.of(context);

 List<Widget>screens=const[
   HomeScreen(),
   ServicesScreen(),
   MyServicesScreen(),
   SettingsScreen()
 ];

 int buttonNavigationBarIndex=0;
void changeIndexButtonNavigationBar(int value){
  buttonNavigationBarIndex=value;
  emit(ChangeIndexButtonNavigationBarState());
}
 final GlobalKey<FormState>formKey=GlobalKey<FormState>();
 final GlobalKey<FormState>editFormKey=GlobalKey<FormState>();

  TextEditingController searchBarController=TextEditingController();
  TextEditingController serviceDateController=TextEditingController();
  TextEditingController serviceTimeController=TextEditingController();
  TextEditingController otherServicesController=TextEditingController();
  TextEditingController selectedServicesController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController cityNameController=TextEditingController();
  TextEditingController areaController=TextEditingController();
  TextEditingController streetController=TextEditingController();

  TextEditingController editServiceDateController=TextEditingController();
  TextEditingController editServiceTimeController=TextEditingController();
  TextEditingController editOtherServicesController=TextEditingController();
  TextEditingController editSelectedServicesController=TextEditingController();
  TextEditingController editPhoneNumberController=TextEditingController();
  TextEditingController editCityNameController=TextEditingController();
  TextEditingController editAreaController=TextEditingController();
  TextEditingController editStreetController=TextEditingController();



  var boardController=PageController();

  List<BoardingModel>boarding=[
    BoardingModel(
        image: 'assets/images/services_images/electricity image.jpg',
        tittle: LocaleKeys.electricityTittle.tr(),
        subTittle: LocaleKeys.electricitySubTittle.tr(),
        body: LocaleKeys.electricityBody.tr()
    ),
    BoardingModel(
        image: 'assets/images/services_images/plumbing image.jpg',
        tittle: LocaleKeys.plumbingTittle.tr(),
        subTittle: LocaleKeys.plumbingSubTittle.tr(),
        body: LocaleKeys.plumbingBody.tr()
    ),
    BoardingModel(
        image: 'assets/images/services_images/Carpentry image.jpg',
        tittle: LocaleKeys.carpentryTittle.tr(),
        subTittle: LocaleKeys.carpentrySubTittle.tr(),
        body: LocaleKeys.carpentryBody.tr()
    ),
    BoardingModel(
        image: 'assets/images/services_images/House paint image.jpg',
        tittle: LocaleKeys.housePaintTittle.tr(),
        subTittle: LocaleKeys.housePaintSubTittle.tr(),
        body: LocaleKeys.housePaintBody.tr()
    ),
    BoardingModel(
        image: 'assets/images/services_images/Air conditioning image.jpg',
        tittle: LocaleKeys.airConditioningTittle.tr(),
        subTittle: LocaleKeys.airConditioningSubTittle.tr(),
        body: LocaleKeys.airConditioningBody.tr()
    ),
    BoardingModel(
        image: 'assets/images/services_images/Maintenance of electrical appliances.jpg',
        tittle: LocaleKeys.electricalAppliancesTittle.tr(),
        subTittle: LocaleKeys.electricalAppliancesSubTittle.tr(),
        body: LocaleKeys.electricalAppliancesBody.tr()
    ),
    BoardingModel(
        image: 'assets/images/services_images/pest control image.png',
        tittle: LocaleKeys.pestControlTittle.tr(),
        subTittle: LocaleKeys.pestControlSubTittle.tr(),
        body: LocaleKeys.pestControlBody.tr()
    ),
    BoardingModel(
        image: 'assets/images/services_images/House cleaning.jpg',
        tittle: LocaleKeys.houseCleaningTittle.tr(),
        subTittle: LocaleKeys.houseCleaningSubTittle.tr(),
        body: LocaleKeys.houseCleaningBody.tr()
    ),
  ];

  List<ServicesLogoModel>servicesLogoList=[
    ServicesLogoModel(
        logo: 'assets/images/logos_images/electricity logo.png',
        serviceName: LocaleKeys.electricityTittle.tr(),
    ),
    ServicesLogoModel(
      logo: 'assets/images/logos_images/Plumbing logo.jpg',
      serviceName: LocaleKeys.plumbingTittle.tr(),
    ),
    ServicesLogoModel(
      logo: 'assets/images/logos_images/Carpentry logo.jpg',
      serviceName: LocaleKeys.carpentryTittle.tr(),
    ),
    ServicesLogoModel(
      logo: 'assets/images/logos_images/House paint logo.jpg',
      serviceName: LocaleKeys.paintingTittle.tr(),
    ),
    ServicesLogoModel(
      logo: 'assets/images/logos_images/Air conditioning logo.jpg',
      serviceName: LocaleKeys.airConditioningTittle.tr(),
    ),
    ServicesLogoModel(
      logo: 'assets/images/logos_images/Maintenance of electrical appliances logo.png',
      serviceName: LocaleKeys.electricalAppliancesTittle.tr(),
    ),
    ServicesLogoModel(
      logo: 'assets/images/logos_images/pest control logo.jpg',
      serviceName: LocaleKeys.pestControlTittle.tr(),
    ),
    ServicesLogoModel(
      logo: 'assets/images/logos_images/House cleaning logo.jpg',
      serviceName: LocaleKeys.houseCleaningTittle.tr(),
    ),
    ServicesLogoModel(
      logo: 'assets/images/logos_images/tv logo.jpg',
      serviceName: LocaleKeys.tVAndReceiverTittle.tr(),
    ),
    ServicesLogoModel(
      logo: 'assets/images/logos_images/Surveillance camera logo.jpg',
      serviceName: LocaleKeys.surveillanceCameraTittle.tr(),
    ),
  ];

  int currentServiceIndex=0;
  String ?serviceName;
  void changeServicesIndex(int index,context){
    currentServiceIndex=index;
    if(currentServiceIndex==0){
      serviceName=LocaleKeys.electricityTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const ElectricityScreen(),
      );
   }
    else if (currentServiceIndex==1){
      serviceName=LocaleKeys.plumbingTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const PlumbingScreen(),
      );
    }
    else if (currentServiceIndex==2) {
      serviceName=LocaleKeys.carpentryTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const CarpentryScreen(),
      );
    }
    else if (currentServiceIndex==3) {
      serviceName=LocaleKeys.paintingTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const PaintingScreen(),
      );
    }
    else if (currentServiceIndex==4) {
      serviceName=LocaleKeys.airConditioningTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const AirConditioningScreen(),
      );
    }
    else if (currentServiceIndex==5) {
      serviceName=LocaleKeys.electricalAppliancesTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const ElectricityAppliancesScreen(),
      );
    }
    else if (currentServiceIndex==6) {
      serviceName=LocaleKeys.pestControlTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const PestControlScreen(),
      );
    }
    else if (currentServiceIndex==7) {
      serviceName=LocaleKeys.houseCleaningTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const HouseCleaningScreen(),
      );
    }
    else if (currentServiceIndex==8) {
      serviceName=LocaleKeys.tVAndReceiverTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const TVAndReceiverScreen(),
      );
    }
    else {
      serviceName=LocaleKeys.surveillanceCameraTittle.tr();
      otherServicesController.clear();
      selectedServicesController.clear();
      navigationPushFunction(context: context,
        screen: const SurveillanceCameraScreen(),
      );
    }
    emit(ChangeServicesIndexState());
  }

  String ?language;
  void changeLanguage(String? value){
    language=value;
    emit(ChangeLanguageState());
  }

  void clearData(){
    otherServicesController.clear();
    serviceDateController.clear();
    serviceTimeController.clear();
    phoneNumberController.clear();
    cityNameController.clear();
    areaController.clear();
    streetController.clear();
    emit(ClearDateState());
  }

  Future<void>addNewRequestService()async {
    emit(AddNewServiceLoadingState());
    await FirebaseFirestore.instance.collection(FirebaseKeys.services)
        .add(
        {
          'service_name':serviceName,
          'selected_services':selectedServicesController.text,
          'other_services':otherServicesController.text,
          'service_date':serviceDateController.text,
          'service_time':serviceTimeController.text,
          'phone_number':phoneNumberController.text,
          'city_name':cityNameController.text,
          'area':areaController.text,
          'street':streetController.text,
          'userId':LocalData.get(key: SharedKeys.uid),
          'request_date':DateTime.now()
        }).then((value) {
          emit(AddNewServiceSuccessState());
          showToast(msg: LocaleKeys.addShowToast.tr());
          clearData();
    }).catchError((error){
      emit(AddNewServiceErrorState());
      throw error;
    });
  }
  List<ServicesModel>activeServicesList=[];
  Future<void>getActiveServices()async {
    emit(GetActiveServicesLoadingState());
    await FirebaseFirestore.instance.collection(FirebaseKeys.services)
        .orderBy('request_date',descending: true)
        .where('userId',isEqualTo: LocalData.get(key: SharedKeys.uid))
        .get()
    .then((value){
      activeServicesList=[];
      for(var i in value.docs){
        activeServicesList.add(ServicesModel.fromFireStore(i.data(),id:i.reference));
      }
      emit(GetActiveServicesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetActiveServicesErrorState());
    });
  }

  int currentActiveServiceIndex=0;
  void changeActiveServiceIndex(int activeServiceIndex){
    currentActiveServiceIndex=activeServiceIndex;
    emit(ChangeActiveServiceIndexState());
  }

  ServicesModel ?currentActiveService;
  Future<void>getActiveServiceFromFireStore()async{
    emit(GetActiveServiceFromFireStoreLoadingState());
    await activeServicesList[currentActiveServiceIndex].id?.get()
    .then((value) {
      currentActiveService=ServicesModel.fromFireStore(
          value.data()as Map<String,dynamic>, id: value.reference);
      setDataFromFireStoreToControllers();
      emit(GetActiveServiceFromFireStoreSuccessState());
    }).catchError((error){
      emit(GetActiveServiceFromFireStoreErrorState());
      throw error;

    });
  }

  void setDataFromFireStoreToControllers(){
    serviceName=currentActiveService?.serviceName??'';
    editSelectedServicesController.text=currentActiveService?.selectedServices??'';
    editOtherServicesController.text=currentActiveService?.otherServices??'';
    editServiceDateController.text=currentActiveService?.serviceDate??'';
    editServiceTimeController.text=currentActiveService?.serviceTime??'';
    editPhoneNumberController.text=currentActiveService?.phoneNumber??'';
    editCityNameController.text=currentActiveService?.cityName??'';
    editAreaController.text=currentActiveService?.area??'';
    editStreetController.text=currentActiveService?.street??'';
  }

  void setDataFromControllersToFireStore(){
    currentActiveService?.selectedServices=editSelectedServicesController.text;
    currentActiveService?.otherServices=editOtherServicesController.text;
    currentActiveService?.serviceDate=editServiceDateController.text ;
    currentActiveService?.serviceTime=editServiceTimeController.text;
    currentActiveService?.phoneNumber=editPhoneNumberController.text;
    currentActiveService?.cityName=editCityNameController.text;
    currentActiveService?.area=editAreaController.text;
    currentActiveService?.street=editStreetController.text;
  }

  Future<void>editRequestService()async {
    emit(EditRequestServiceLoadingState());
    setDataFromControllersToFireStore();
    await currentActiveService?.id?.update(currentActiveService?.toFireStore()??{})
    .then((value) {
      getActiveServices();
      emit(EditRequestServiceSuccessState());
    }).catchError((error){
      emit(EditRequestServiceErrorState());
      throw error;
    });
  }

  Future<void>deleteRequestService()async {
    emit(DeleteRequestServiceLoadingState());
    await activeServicesList[currentActiveServiceIndex].id?.delete()
        .then((value) {
      getActiveServices();
    }).catchError((error){
      emit(DeleteRequestServiceErrorState());
      throw error;
    });
  }

  Future<void>addDoneServices()async {
    emit(AddDoneServiceLoadingState());

    await FirebaseFirestore.instance.collection(FirebaseKeys.doneServices)
        .add(
        {
          'service_name':activeServicesList[currentActiveServiceIndex].serviceName,
          'selected_services':activeServicesList[currentActiveServiceIndex].selectedServices,
          'other_services':activeServicesList[currentActiveServiceIndex].otherServices,
          'service_date':activeServicesList[currentActiveServiceIndex].serviceDate,
          'service_time':activeServicesList[currentActiveServiceIndex].serviceTime,
          'phone_number':activeServicesList[currentActiveServiceIndex].phoneNumber,
          'city_name':activeServicesList[currentActiveServiceIndex].cityName,
          'area':activeServicesList[currentActiveServiceIndex].area,
          'street':activeServicesList[currentActiveServiceIndex].street,
          'userId':LocalData.get(key: SharedKeys.uid),
          'request_date':DateTime.now()
        }).then((value) {
      deleteRequestService();
      emit(AddDoneServiceSuccessState());
    }).catchError((error){
      emit(AddDoneServiceErrorState());
      throw error;
    });
  }

  List<ServicesModel>doneServiceList=[];
  Future<void>getDoneService()async {
    emit(GetDoneServiceLoadingState());
    await FirebaseFirestore.instance.collection(FirebaseKeys.doneServices)
        .orderBy('request_date',descending: true)
        .where('userId',isEqualTo: LocalData.get(key: SharedKeys.uid))
        .get()
        .then((value) {
      doneServiceList=[];
      for(var i in value.docs){
        doneServiceList.add(ServicesModel.fromFireStore(i.data(), id: i.reference));
      }
      emit(GetDoneServiceSuccessState());
    }).catchError((error){
      emit(GetDoneServiceErrorState());
      throw error;
    });
  }

}
