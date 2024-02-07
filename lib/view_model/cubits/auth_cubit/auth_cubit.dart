import 'package:bati_app/models/users_model.dart';
import 'package:bati_app/view_model/data/firebase/firebaseKeys.dart';
import 'package:bati_app/view_model/data/local_data/shared_keys.dart';
import 'package:bati_app/view_model/data/local_data/shared_preferences.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:bati_app/view_model/utils/icons/app_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context)=>BlocProvider.of<AuthCubit>(context);

  GlobalKey<FormState>formKeyLoginAuth=GlobalKey<FormState>();
  GlobalKey<FormState>formKeyRegisterAuth=GlobalKey<FormState>();
  GlobalKey<FormState>formChangePasskey=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  TextEditingController changeNameController=TextEditingController();
  TextEditingController changeEmailController=TextEditingController();
  TextEditingController changePhoneController=TextEditingController();
  TextEditingController changeOldPasswordController=TextEditingController();
  TextEditingController oldPasswordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();

  TextEditingController sendMessageController=TextEditingController();



  bool oldPassword=true;
  IconData suffixIcon=AppIcons.visibility;
 void changeSuffixIconOldPass(){
   oldPassword?suffixIcon=AppIcons.visibilityOf:suffixIcon=AppIcons.visibility;
   oldPassword=!oldPassword;
   emit(ChangeSuffixIconOldPass());
 }

 bool newPassword=true;
  IconData suffixIconNewPass=AppIcons.visibility;
  void changeSuffixIconNewPass(){
    newPassword?suffixIconNewPass=AppIcons.visibilityOf:suffixIconNewPass=AppIcons.visibility;
    newPassword=!newPassword;
    emit(ChangeSuffixIconNewPass());
  }

 Future<void>register()async {
   emit(RegisterLoadingState());
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: emailController.text,
       password: passwordController.text
   ).then((value) async {
     await addUserToFireStore(value);
     showToast(msg: 'register successfully');
     emit(RegisterSuccessState());
   })
   .catchError((error){
     showToast(msg:error.toString(),color: AppColors.errorColor);
     emit(RegisterErrorState());
     throw error;
   });
 }

 Future<void>login()async {
   emit(LoginLoadingState());
   await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: emailController.text,
       password: passwordController.text
   ).then((value) {
     LocalData.set(key:SharedKeys.uid,value:value.user?.uid);
     showToast(msg: 'Login Successfully');
     emit(LoginSuccessState());
   })
   .catchError((error){
     showToast(msg: error.toString(),color:AppColors.errorColor);
     emit(LoginErrorState());
     throw error;
   });
 }

  Future<void>addUserToFireStore(UserCredential value)async{
    await FirebaseFirestore.instance.collection(FirebaseKeys.users)
        .doc(value.user?.uid)
        .set({
      'name':nameController.text,
      'email':emailController.text,
      'phone':phoneController.text,
      'userId':value.user?.uid
    });
  }

  UsersModel ?userModel;
  Future<void> getUserData()async {
    emit(GetUserDataLoadingState());
    await FirebaseFirestore.instance.collection(FirebaseKeys.users)
        .doc(LocalData.get(key: SharedKeys.uid))
        .get()
    .then((value) {
      userModel=UsersModel.fromFireStore(value.data()??{});
      changeNameController.text=userModel?.name??'';
      changeEmailController.text=userModel?.email??'';
      changePhoneController.text=userModel?.phoneNumber??'';
      emit(GetUserDataSuccessState());
    }).catchError((error){
      emit(GetUserDataErrorState());
    });

  }

  Future<void>updateUserData()async {
   emit(UpdateUserDataLoadingState());
   await FirebaseFirestore.instance.collection(FirebaseKeys.users)
       .doc(userModel?.userId)
       .update({
     'name':changeNameController.text,
     'email':changeEmailController.text,
     'phone':changePhoneController.text
   })
       .then((value) {
         getUserData();
         emit(UpdateUserDataSuccessState());
   })
       .catchError((error){
         emit(UpdateUserDataErrorState());
   });
  }

  Future<void>deleteUserAccount()async {
    emit(DeleteUserAccountLoadingState());
    await FirebaseFirestore.instance.collection(FirebaseKeys.users)
        .doc(userModel?.userId)
        .delete()
        .then((value) {
         LocalData.clear();
         FirebaseAuth.instance.signOut();
          emit(DeleteUserAccountSuccessState());
    })
        .catchError((error){
          emit(DeleteUserAccountErrorState());
    });
  }

  Future<void>changePassword(String newPassword,String oldPassword)async {
    emit(ChangePasswordLoadingState());
    User? user = FirebaseAuth.instance.currentUser;

    await user?.updatePassword(newPassword)
    .then((value) {
      emit(ChangePasswordSuccessState());
    }).catchError((error){
      emit(ChangePasswordErrorState());
    });
    // await FirebaseAuth.instance
    //     .currentUser?.updatePassword(newPasswordController.text)
    //     .then((value) {
    //       emit(ChangePasswordSuccessState());
    // })
    //     .catchError((error){
    //       emit(ChangePasswordErrorState());
    // });
  }

 Future<void> sendMessage()async {
    emit(SendMessageLoadingState());
   await FirebaseFirestore.instance.collection(FirebaseKeys.usersMessage)
        .add({
      'message':sendMessageController.text,
     'userId':LocalData.get(key: SharedKeys.uid)
    }).then((value) {
      sendMessageController.clear();
     showToast(msg: 'Send a Message Successfully');
      emit(SendMessageSuccessState());
    }).catchError((error){
      emit(SendMessageErrorState());
    });
}

}
