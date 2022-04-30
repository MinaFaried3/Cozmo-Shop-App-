import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/Layout/shop_app/shop_app.dart';
import 'package:sala/modules/shop_app/login/login.dart';
import 'package:sala/modules/shop_app/on_boarding/onBoarding.dart';
import 'package:sala/shared/components/componen/constant.dart';
import 'package:sala/shared/network/cashe_helper.dart';
import 'package:sala/shared/network/dio_helper.dart';
import 'package:sala/shared/styles/theme.dart';

import 'Layout/shop_app/cubit_shop_layout.dart';
import 'main_cubit/Main_Cubit.dart';
import 'main_cubit/Main_State.dart';
import 'shared/components/componen/BlocObserver.dart';
import 'shared/network/cashe_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.Init_dio();

  BlocOverrides.runZoned(
    () async {
      await CacheHelper.init_shared();
      bool? isDark = CacheHelper.getData(key: 'isDark');

      // CacheHelper.saveData(key: 'onBoarding', value: false).then((value) {});
      Widget? widget;
      token = CacheHelper.getData(key: 'token');
      print(token);
      bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
      // bool? onBoarding = false;

      if (onBoarding != null) {
        if (token != null) {
          widget = ShopLayOut();
        } else {
          widget = login();
        }
      } else {
        widget = OnBoarding();
      }

      runApp(Mino(isDark, widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class Mino extends StatelessWidget {
  @override
  final bool? isDark;
  final Widget? widget;
  Mino(this.isDark, this.widget);

  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => MainCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..GetHomeData()
            ..GetFavoritesData()
            ..GetCategoriesData()
            ..GetCartData()
            ..GetProfileData(),
        ),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: dark,
            theme: light,
            // themeMode: MainCubit.get(context).isDark!
            //     ? ThemeMode.dark
            //     : ThemeMode.light,
            themeMode: ThemeMode.light,
            home: widget,
          );
        },
      ),
    );
  }
}
