import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/Layout/shop_app/cubit_shop_layout.dart';
import 'package:sala/Layout/shop_app/shop_layout_states.dart';
import 'package:sala/modules/shop_app/login/login.dart';
import 'package:sala/shared/network/cashe_helper.dart';
import 'package:sala/shared/styles/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var profile = ShopCubit.get(context);
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 73.5,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            image: DecorationImage(
                                image: NetworkImage(
                                    profile.ShopModel!.data!.image!))),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 7, bottom: 5),
                    //   child: CircleAvatar(
                    //     radius: 18,
                    //     child: IconButton(
                    //       onPressed: () {},
                    //       icon: Icon(
                    //         Icons.camera_alt_outlined,
                    //         size: 25,
                    //       ),
                    //       padding: EdgeInsets.all(0),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  profile.ShopModel!.data!.name,
                  style: TextStyle(
                      color: CozmoText,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  profile.ShopModel!.data!.email,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  profile.ShopModel!.data!.phone,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: CozmoText),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: BoxDecoration(
                              color: CozmoColor1,
                              borderRadius: BorderRadius.circular(30)),
                          child: MaterialButton(
                              onPressed: () {
                                ShopCubit.get(context).changeItem(0);
                              },
                              child: Icon(
                                Icons.home_outlined,
                                color: Colors.white,
                              ))),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 3.5,
                          decoration: BoxDecoration(
                              color: CozmoColor1,
                              borderRadius: BorderRadius.circular(30)),
                          child: MaterialButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Text(
                          "Account settings",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Row(
                          children: [
                            Text(
                              "Account security",
                              style: TextStyle(
                                  color: CozmoText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: CozmoText,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Row(
                          children: [
                            Text(
                              "Email notification preferences",
                              style: TextStyle(
                                  color: CozmoText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: CozmoText,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Text(
                          "Help and Support",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Row(
                          children: [
                            Text(
                              "About Cozmo",
                              style: TextStyle(
                                  color: CozmoText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: CozmoText,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Row(
                          children: [
                            Text(
                              "Frequently asked questions",
                              style: TextStyle(
                                  color: CozmoText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: CozmoText,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Row(
                          children: [
                            Text(
                              "Share the Cozmo app",
                              style: TextStyle(
                                  color: CozmoText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: CozmoText,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Text(
                          "Diagnostics",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Row(
                          children: [
                            Text(
                              "Status",
                              style: TextStyle(
                                  color: CozmoText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: CozmoText,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    CacheHelper.removeData(key: 'token').then((value) {
                      profile.changeItem(0);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => login()),
                          (route) => false);
                    });
                  },
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                        color: CozmoColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Cozmo v 1.1.1",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
