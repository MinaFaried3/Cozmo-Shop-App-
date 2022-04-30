import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sala/modules/shop_app/register/register_cubit/REGISTERCubit.dart';
import 'package:sala/modules/shop_app/register/register_cubit/registerStates.dart';

import '../../../Layout/shop_app/shop_app.dart';
import '../../../shared/components/componen/constant.dart';
import '../../../shared/network/cashe_helper.dart';
import '../../../shared/styles/color.dart';

class register extends StatelessWidget {
  register({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is SuccessRegister) {
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
          var Bloc1 = RegisterCubit.get(context);
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
                          "REGISTER",
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
                          "Register now to browse our hot offers !!",
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
                          controller: name,
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (val) {
                            if (formKey.currentState!.validate()) {
                              Bloc1.PostData(
                                  email: email.text,
                                  password: password.text,
                                  name: name.text,
                                  phone: phone.text);
                            }
                          },
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please Enter your name..";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(color: CozmoColor2),
                              prefixIcon: Icon(
                                Icons.person_outline,
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
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (val) {
                            if (formKey.currentState!.validate()) {
                              Bloc1.PostData(
                                  email: email.text,
                                  password: password.text,
                                  name: name.text,
                                  phone: phone.text);
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
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          onFieldSubmitted: (val) {
                            if (formKey.currentState!.validate()) {
                              Bloc1.PostData(
                                  email: email.text,
                                  password: password.text,
                                  name: name.text,
                                  phone: phone.text);
                            }
                          },
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please Enter your phone number..";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "Phone",
                              labelStyle: TextStyle(color: CozmoColor2),
                              prefixIcon: Icon(
                                Icons.phone,
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
                                  email: email.text,
                                  password: password.text,
                                  name: name.text,
                                  phone: phone.text);
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
                          condition: state is! LoadingRegister,
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
                                      password: password.text,
                                      name: name.text,
                                      phone: phone.text);
                                }
                              },
                              child: Text(
                                "REGISTER",
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
