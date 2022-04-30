import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/models/login_model.dart';
import 'package:sala/modules/shop_app/login/login_cubit/loginStates.dart';
import 'package:sala/shared/network/dio_helper.dart';

import '../../../../shared/components/componen/constant.dart';
import '../../../../shared/network/end_points/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isHidePassword = true;
  IconData password = Icons.visibility_outlined;
  shopModel? ShopLogin;
  void changePassword() {
    isHidePassword = !isHidePassword;
    password = isHidePassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePassword());
  }

  void PostData({required String email, required String password}) {
    emit(LoadingLogIn());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
      ShopLogin = shopModel.fromJson(value.data);

      token = ShopLogin!.data!.token;
      // focus here you can't print the data token because if the data == null  will give an error
      // print(ShopLogin!.data!.token);
      print(ShopLogin!.message);
      print(ShopLogin!.status);

      emit(SuccessLogIn(ShopLogin!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorLogIn(error: error.toString()));
    });
  }
}
