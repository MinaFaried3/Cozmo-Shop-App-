import 'package:sala/models/login_model.dart';

abstract class LoginStates {}

class InitLoginState extends LoginStates {}

class ChangePassword extends LoginStates {}

class LoadingLogIn extends LoginStates {}

class SuccessLogIn extends LoginStates {
  final shopModel loginModel;
  SuccessLogIn(this.loginModel);
}

class ErrorLogIn extends LoginStates {
  final String error;
  ErrorLogIn({required this.error});
}
// class LoadingLogIn extends LoginStates{}
