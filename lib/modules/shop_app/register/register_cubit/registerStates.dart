import 'package:sala/models/login_model.dart';

abstract class RegisterStates {}

class InitRegisterState extends RegisterStates {}

class ChangeRegisterPassword extends RegisterStates {}

class LoadingRegister extends RegisterStates {}

class SuccessRegister extends RegisterStates {
  final shopModel loginModel;
  SuccessRegister(this.loginModel);
}

class ErrorRegister extends RegisterStates {
  final String error;
  ErrorRegister({required this.error});
}
// class LoadingLogIn extends RegisterStates{}
