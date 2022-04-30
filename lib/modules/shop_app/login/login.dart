import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sala/Layout/shop_app/shop_app.dart';
import 'package:sala/modules/shop_app/register/regidter.dart';
import 'package:sala/shared/network/cashe_helper.dart';
import 'package:sala/shared/styles/color.dart';

import '../../../shared/components/componen/constant.dart';
import 'login_cubit/loginCubit.dart';
import 'login_cubit/loginStates.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is SuccessLogIn) {
            if (state.loginModel.status == true) {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              Fluttertoast.showToast(
                  msg: state.loginModel.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.red,
                  fontSize: 16);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                token = state.loginModel.data!.token;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ShopLayOut()),
                    (route) => false);
              });
            } else {
              print(state.loginModel.message);
              Fluttertoast.showToast(
                  msg: state.loginModel.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.red,
                  fontSize: 16);
            }
          }
        },
        builder: (context, state) {
          var Bloc1 = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  color: CozmoColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 3),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Login now to browse our hot offers !!",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: CozmoColor1,
                                  fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (val) {
                            if (formKey.currentState!.validate()) {
                              Bloc1.PostData(
                                  email: email.text, password: password.text);
                            }
                          },
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please Enter your email address..";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(color: CozmoColor2),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: CozmoColor2,
                              ),
                              // border: OutlineInputBorder(),
                              focusColor: CozmoColor2,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CozmoColor2, width: 3))),
                          cursorColor: CozmoColor2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: Bloc1.isHidePassword,
                          onFieldSubmitted: (val) {
                            if (formKey.currentState!.validate()) {
                              Bloc1.PostData(
                                  email: email.text, password: password.text);
                            }
                          },
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please ,Enter your password..";
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: CozmoColor2),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: CozmoColor2,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  Bloc1.changePassword();
                                },
                                icon: Icon(
                                  Bloc1.password,
                                  color: CozmoColor2,
                                ),
                                highlightColor: CozmoColor3,
                              ),
                              // border: OutlineInputBorder(),
                              focusColor: CozmoColor2,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CozmoColor2, width: 3))),
                          cursorColor: CozmoColor2,
                          cursorRadius: Radius.circular(60),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ConditionalBuilderRec(
                          condition: state is! LoadingLogIn,
                          // condition: false,
                          builder: (context) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: CozmoColor2,
                                borderRadius: BorderRadius.circular(60)),
                            child: MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Bloc1.PostData(
                                      email: email.text,
                                      password: password.text);
                                  // if (state is SuccessLogIn) {
                                  //   token = Bloc1.ShopLogin!.data!.token;
                                  // }
                                  // BlocProvider.of<ShopCubit>(context)
                                  //     .GetHomeData();
                                  // BlocProvider.of<ShopCubit>(context)
                                  //     .GetFavoritesData();
                                  // BlocProvider.of<ShopCubit>(context)
                                  //     .GetCategoriesData();
                                  // BlocProvider.of<ShopCubit>(context)
                                  //     .GetCartData();
                                  // BlocProvider.of<ShopCubit>(context)
                                  //     .GetProfileData();
                                }
                              },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          fallback: (context) => Center(
                            child: CircularProgressIndicator(
                              color: CozmoColor2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account .....",
                              style: TextStyle(
                                  color: CozmoColor1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => register()));
                                },
                                child: Text(
                                  "Register",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: CozmoColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2),
                                ))
                          ],
                        )
                      ],
                    ),
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
