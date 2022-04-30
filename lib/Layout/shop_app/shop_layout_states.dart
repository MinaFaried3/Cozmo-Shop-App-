import 'package:sala/models/ChangeFavoriteModel.dart';
import 'package:sala/models/changeCartModel.dart';
import 'package:sala/models/login_model.dart';

abstract class ShopLayoutStates {}

class InitShopState extends ShopLayoutStates {}

class ChangeBottomNavState extends ShopLayoutStates {}

class ShopLoadingHomeState extends ShopLayoutStates {}

class ShopSuccessHomeState extends ShopLayoutStates {}

class ShopErrorHomeState extends ShopLayoutStates {}

class ShopSuccessCategoriesState extends ShopLayoutStates {}

class ShopErrorCategoriesState extends ShopLayoutStates {}

class ShopSuccessFavoritesState extends ShopLayoutStates {
  final ChangeFavoriteModel? model;
  ShopSuccessFavoritesState(this.model);
}

class ShopFavoritesState extends ShopLayoutStates {}

class ShopErrorCFavoriteState extends ShopLayoutStates {}

class ShopSuccessGetFavoritesState extends ShopLayoutStates {}

class ShopErrorGetFavoritesState extends ShopLayoutStates {}

class ShopLoadingGetFavoritesState extends ShopLayoutStates {}

class ShopSuccessCartState extends ShopLayoutStates {
  final ChangeCartModel? model;
  ShopSuccessCartState(this.model);
}

class ShopCartState extends ShopLayoutStates {}

class ShopErrorCartState extends ShopLayoutStates {}

class ShopSuccessGetCartState extends ShopLayoutStates {}

class ShopErrorGetCartState extends ShopLayoutStates {}

class ShopLoadingGetCartState extends ShopLayoutStates {}

class ShopSuccessGetProfileState extends ShopLayoutStates {}

class ShopErrorGetProfileState extends ShopLayoutStates {}

class ShopLoadingGetProfileState extends ShopLayoutStates {}

class ShopSuccessUpdateProfileState extends ShopLayoutStates {
  final shopModel? loginModel;

  ShopSuccessUpdateProfileState(this.loginModel);
}

class ShopErrorUpdateProfileState extends ShopLayoutStates {}

class ShopLoadingUpdateProfileState extends ShopLayoutStates {}

class ChangeUpdatePassword extends ShopLayoutStates {}

class ChangeUpdatePasswordLogin extends ShopLayoutStates {}

class LoadingLogIn extends ShopLayoutStates {}

class SuccessLogIn extends ShopLayoutStates {
  final shopModel loginModel;
  SuccessLogIn(this.loginModel);
}

class ErrorLogIn extends ShopLayoutStates {
  final String error;
  ErrorLogIn({required this.error});
}
