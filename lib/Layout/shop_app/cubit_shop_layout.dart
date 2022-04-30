import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/Layout/shop_app/shop_layout_states.dart';
import 'package:sala/models/CartModel.dart';
import 'package:sala/models/CategoriesModel.dart';
import 'package:sala/models/ChangeFavoriteModel.dart';
import 'package:sala/models/FavoritesModel.dart';
import 'package:sala/models/HomeModel.dart';
import 'package:sala/models/changeCartModel.dart';
import 'package:sala/modules/shop_app/home_Screen/cateogries.dart';
import 'package:sala/modules/shop_app/home_Screen/favourite.dart';
import 'package:sala/modules/shop_app/home_Screen/products.dart';
import 'package:sala/modules/shop_app/home_Screen/profile.dart';
import 'package:sala/shared/components/componen/constant.dart';
import 'package:sala/shared/network/dio_helper.dart';
import 'package:sala/shared/network/end_points/end_points.dart';

import '../../models/login_model.dart';

class ShopCubit extends Cubit<ShopLayoutStates> {
  ShopCubit() : super(InitShopState());
  static ShopCubit get(context) => BlocProvider.of(context);

  List<Widget> Home_widget = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    ProfileScreen()
  ];

  List<BottomNavigationBarItem> Bottom_Nav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.app_registration), label: 'categories'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  int current = 0;
  void changeItem(int index) {
    current = index;

    if (index == 1)
      GetCategoriesData();
    else if (index == 2)
      GetFavoritesData();
    else if (index == 0) {
      GetHomeData();
      GetCartData();
      GetProfileData();
    } else if (index == 3) GetProfileData();
    emit(ChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  Map<int, bool> cart = {};
  void GetHomeData() {
    emit(ShopLoadingHomeState());

    // token = ShopModel!.data!.token;
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      //focus in this print
      // print(homeModel!.data!.banners[0]['image']);
      // print(homeModel!.status);

      homeModel!.data!.products.forEach((element) {
        favorites.addAll({element.id: element.in_favorites});
      });
      homeModel!.data!.products.forEach((element) {
        cart.addAll({element.id: element.in_cart});
      });

      emit(ShopSuccessHomeState());
    }).catchError((err) {
      print(err.toString());
      emit(ShopErrorHomeState());
    });
  }

  CategoriesModel? categoriesModel;

  void GetCategoriesData() {
    DioHelper.getData(url: CATEGORIES, token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      //focus in this print

      emit(ShopSuccessCategoriesState());
    }).catchError((err) {
      print(err.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavoriteModel? changeFavoriteModel;
  void ChangFavorite(int ProductId) {
    favorites[ProductId] = !favorites[ProductId]!;

    emit(ShopFavoritesState());
    DioHelper.postData(
            url: FAVORITES, data: {'product_id': ProductId}, token: token)
        .then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      if (!changeFavoriteModel!.status) {
        favorites[ProductId] = !favorites[ProductId]!;
      } else {
        GetFavoritesData();
      }
      // print(value.data);
      emit(ShopSuccessFavoritesState(changeFavoriteModel));
    }).catchError((err) {
      favorites[ProductId] = !favorites[ProductId]!;
      print(err.toString());
      emit(ShopErrorCFavoriteState());
    });
  }

  FavoriteModel? favoriteModel;

  void GetFavoritesData() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);

      // print(value.data.toString());
      emit(ShopSuccessGetFavoritesState());
    }).catchError((err) {
      print(err.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ChangeCartModel? changeCartModel;

  void ChangeCart(int ProductId) {
    cart[ProductId] = !cart[ProductId]!;
    emit(ShopCartState());
    DioHelper.postData(url: CART, data: {'product_id': ProductId}, token: token)
        .then((value) {
      changeCartModel = ChangeCartModel.fromJson(value.data);
      if (!changeCartModel!.status) {
        cart[ProductId] = !cart[ProductId]!;
      } else {
        GetCartData();
      }
      emit(ShopSuccessCartState(changeCartModel));
    }).catchError((err) {
      cart[ProductId] = !cart[ProductId]!;
      emit(ShopErrorCartState());
    });
  }

  CartModel? cartModel;

  void GetCartData() {
    emit(ShopLoadingGetCartState());
    DioHelper.getData(url: CART, token: token).then((value) {
      cartModel = CartModel.fromJson(value.data);

      // print(value.data.toString());
      emit(ShopSuccessGetCartState());
    }).catchError((err) {
      print(err.toString());
      emit(ShopErrorGetCartState());
    });
  }

  shopModel? ShopModel;

  void GetProfileData() {
    emit(ShopLoadingGetProfileState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      ShopModel = shopModel.fromJson(value.data);
      // token = ShopModel!.data!.token;
      // print(ShopModel!.data!.name);
      emit(ShopSuccessGetProfileState());
    }).catchError((err) {
      print(err.toString());
      emit(ShopErrorGetProfileState());
    });
  }

  Future GetUpdateData({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(ShopLoadingUpdateProfileState());
    DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'phone': phone,
      'email': email,
    }).then((value) {
      ShopModel = shopModel.fromJson(value.data);

      print(ShopModel!.data!.name);
      emit(ShopSuccessUpdateProfileState(ShopModel));
    }).catchError((err) {
      print(err.toString());
      emit(ShopErrorUpdateProfileState());
    });
  }

  bool isHidePassword1 = true;
  IconData password1 = Icons.visibility_outlined;

  void changePassword() {
    isHidePassword1 = !isHidePassword1;
    isHidePassword1
        ? password1 = Icons.visibility_outlined
        : password1 = Icons.visibility_off_outlined;
    emit(ChangeUpdatePassword());
  }

  bool isHidePasswordLogin = true;
  IconData passwordLogin = Icons.visibility_outlined;

  void changePasswordLogin() {
    isHidePasswordLogin = !isHidePasswordLogin;
    isHidePasswordLogin
        ? passwordLogin = Icons.visibility_outlined
        : passwordLogin = Icons.visibility_off_outlined;
    emit(ChangeUpdatePasswordLogin());
  }

  void PostData({required String email, required String password}) {
    emit(LoadingLogIn());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      print(value.data);
      ShopModel = shopModel.fromJson(value.data);

      token = ShopModel!.data!.token;
      // focus here you can't print the data token because if the data == null  will give an error
      // print(ShopLogin!.data!.token);
      print(ShopModel!.message);
      print(ShopModel!.status);

      emit(SuccessLogIn(ShopModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorLogIn(error: error.toString()));
    });
  }
}
