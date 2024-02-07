part of 'auth_cubit.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class ChangeSuffixIconOldPass extends AuthStates{}
class ChangeSuffixIconNewPass extends AuthStates{}


class RegisterLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class RegisterErrorState extends AuthStates{}

class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{}
class LoginErrorState extends AuthStates{}

class GetUserDataLoadingState extends AuthStates{}
class GetUserDataSuccessState extends AuthStates{}
class GetUserDataErrorState extends AuthStates{}

class UpdateUserDataLoadingState extends AuthStates{}
class UpdateUserDataSuccessState extends AuthStates{}
class UpdateUserDataErrorState extends AuthStates{}

class DeleteUserAccountLoadingState extends AuthStates{}
class DeleteUserAccountSuccessState extends AuthStates{}
class DeleteUserAccountErrorState extends AuthStates{}

class ChangePasswordLoadingState extends AuthStates{}
class ChangePasswordSuccessState extends AuthStates{}
class ChangePasswordErrorState extends AuthStates{}

class SendMessageLoadingState extends AuthStates{}
class SendMessageSuccessState extends AuthStates{}
class SendMessageErrorState extends AuthStates{}