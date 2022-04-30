import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/Layout/shop_app/cubit_shop_layout.dart';
import 'package:sala/Layout/shop_app/shop_layout_states.dart';
import 'package:sala/modules/shop_app/home_Screen/CartScreen.dart';
import 'package:sala/modules/shop_app/home_Screen/search/search.dart';
import 'package:sala/shared/styles/color.dart';

import '../../modules/shop_app/home_Screen/update_profile.dart';
import '../../modules/shop_app/login/login.dart';
import '../../shared/network/cashe_helper.dart';

class ShopLayOut extends StatelessWidget {
  const ShopLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()
        ..GetHomeData()
        ..GetFavoritesData()
        ..GetCategoriesData()
        ..GetCartData()
        ..GetProfileData(),
      child: BlocConsumer<ShopCubit, ShopLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ShopCubit bloc1 = ShopCubit.get(context);
          double width1 = 300;
          return Scaffold(
            drawer: Container(
                width: width1,
                height: 750,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Drawer(
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 48,
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(70),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  bloc1.ShopModel != null
                                                      ? bloc1.ShopModel!.data!
                                                          .image!
                                                      : "image"))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: width1 / 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          bloc1.ShopModel != null
                                              ? bloc1.ShopModel!.data!.name
                                              : "user",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          bloc1.ShopModel != null
                                              ? bloc1.ShopModel!.data!.email
                                              : "email",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    bloc1.changeItem(3);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "home",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    bloc1.changeItem(0);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "favorite",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    bloc1.changeItem(2);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.app_registration,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "categories",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    bloc1.changeItem(1);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Divider(
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "your cart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CartScreen()));
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.search_sharp,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "search",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchScreen()));
                                  },
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.notifications_active,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "notification",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchScreen()));
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Divider(
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.app_blocking,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  title: Text(
                                    "sign out",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onTap: () {
                                    CacheHelper.removeData(key: 'token')
                                        .then((value) {
                                      // bloc1.homeModel = null;
                                      // bloc1.favoriteModel = null;
                                      // bloc1.cartModel = null;
                                      // bloc1.ShopModel = null;
                                      bloc1.cart = {};
                                      bloc1.favorites = {};
                                      bloc1.changeItem(0);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => login()),
                                          (route) => false);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))),
            appBar: AppBar(
              iconTheme: IconThemeData(color: CozmoText),
              title: Text(
                'Cozmo',
                style: TextStyle(
                    color: CozmoText,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    letterSpacing: 0),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen()));
                    },
                    icon: Icon(
                      Icons.search,
                      color: CozmoText,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                      // bloc1.GetCartData();
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: CozmoText,
                      size: 30,
                    ))
              ],
            ),
            body: bloc1.Home_widget[bloc1.current],
            bottomNavigationBar: Container(
              // margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: CozmoColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 8,
                        blurRadius: 6,
                        offset: Offset(0, 4))
                  ]),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                items: bloc1.Bottom_Nav,
                currentIndex: bloc1.current,
                onTap: (index) {
                  bloc1.changeItem(index);
                },
              ),
            ),
            floatingActionButton: bloc1.current == 3
                ? FloatingActionButton(
                    onPressed: () {
                      bloc1.GetProfileData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => updateProfile()));
                    },
                    child: Icon(Icons.edit),
                  )
                : null,
          );
        },
      ),
    );
  }
}
