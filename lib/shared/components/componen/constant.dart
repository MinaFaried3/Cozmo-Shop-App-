import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/Layout/shop_app/cubit_shop_layout.dart';

import '../../../modules/shop_app/login/login.dart';
import '../../network/cashe_helper.dart';

Widget signout(context) {
  return TextButton(
    onPressed: () {
      CacheHelper.removeData(key: 'token').then((value) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return login();
        }), (route) => false);
      });
    },
    child: Text(
      "sign out",
      style: TextStyle(fontSize: 20),
    ),
  );
}

String? token = CacheHelper.getData(key: 'token');

ShopCubit bloc2(context) {
  var bloc = BlocProvider.of<ShopCubit>(context);
  return bloc;
}
