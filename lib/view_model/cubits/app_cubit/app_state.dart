part of 'app_cubit.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeIndexButtonNavigationBarState extends AppStates{}

class ChangeServicesIndexState extends AppStates{}

class ChangeActiveServiceIndexState extends AppStates{}

class ChangeLanguageState extends AppStates{}

class ClearDateState extends AppStates{}

class AddNewServiceLoadingState extends AppStates{}

class AddNewServiceSuccessState extends AppStates{}

class AddNewServiceErrorState extends AppStates{}

class GetActiveServicesLoadingState extends AppStates{}

class GetActiveServicesSuccessState extends AppStates{}

class GetActiveServicesErrorState extends AppStates{}

class GetActiveServiceFromFireStoreLoadingState extends AppStates{}

class GetActiveServiceFromFireStoreSuccessState extends AppStates{}

class GetActiveServiceFromFireStoreErrorState extends AppStates{}

class EditRequestServiceLoadingState extends AppStates{}

class EditRequestServiceSuccessState extends AppStates{}

class EditRequestServiceErrorState extends AppStates{}

class DeleteRequestServiceLoadingState extends AppStates{}

class DeleteRequestServiceSuccessState extends AppStates{}

class DeleteRequestServiceErrorState extends AppStates{}

class AddDoneServiceLoadingState extends AppStates{}

class AddDoneServiceSuccessState extends AppStates{}

class AddDoneServiceErrorState extends AppStates{}

class GetDoneServiceLoadingState extends AppStates{}

class GetDoneServiceSuccessState extends AppStates{}

class GetDoneServiceErrorState extends AppStates{}

