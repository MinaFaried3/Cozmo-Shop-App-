import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Layout/shop_app/cubit_shop_layout.dart';
import '../../../Layout/shop_app/shop_layout_states.dart';
import '../../../shared/styles/color.dart';

class updateProfile extends StatelessWidget {
  const updateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var Bloc1 = ShopCubit.get(context);
          GlobalKey<FormState> formKey = GlobalKey<FormState>();
          TextEditingController? email = TextEditingController();
          TextEditingController? password = TextEditingController();
          TextEditingController? name = TextEditingController();
          TextEditingController? phone = TextEditingController();
          if (Bloc1.ShopModel != null) {
            email.text = Bloc1.ShopModel!.data!.email;
            phone.text = Bloc1.ShopModel!.data!.phone;

            name.text = Bloc1.ShopModel!.data!.name;
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("Update"),
            ),
            body: ConditionalBuilderRec(
              condition: Bloc1.ShopModel != null,
              builder: (context) => SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      if (state is ShopLoadingUpdateProfileState)
                        LinearProgressIndicator(),
                      Container(
                        padding: EdgeInsets.all(30),
                        width: double.infinity,
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 73.5,
                                    child: Container(
                                      width: 140,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(70),
                                          image: DecorationImage(
                                              image: NetworkImage(Bloc1
                                                  .ShopModel!.data!.image!))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 7, bottom: 5),
                                    child: CircleAvatar(
                                      radius: 18,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 25,
                                        ),
                                        padding: EdgeInsets.all(0),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              TextFormField(
                                controller: name,
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (val) {},
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
                                height: 30,
                              ),
                              TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                onFieldSubmitted: (val) {},
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
                                height: 30,
                              ),
                              TextFormField(
                                controller: phone,
                                keyboardType: TextInputType.phone,
                                onFieldSubmitted: (val) {},
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
                                height: 30,
                              ),
                              TextFormField(
                                controller: password,
                                obscureText: Bloc1.isHidePassword1,
                                // onFieldSubmitted: (val) {},
                                // validator: (String? val) {
                                //   if (val!.isEmpty) {
                                //     return "Please ,Enter your password..";
                                //   }
                                // },
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
                                        Bloc1.password1,
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
                                condition:
                                    state is! ShopLoadingUpdateProfileState,
                                // condition: false,
                                builder: (context) => Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: CozmoColor2,
                                      borderRadius: BorderRadius.circular(60)),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Bloc1.GetUpdateData(
                                              name: name.text,
                                              email: email.text,
                                              phone: phone.text)
                                          .then((value) {
                                        // Navigator.pop(context);
                                      });
                                    },
                                    child: Text(
                                      "UPDATE",
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}
