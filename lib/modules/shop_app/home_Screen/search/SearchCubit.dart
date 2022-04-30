import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/models/SearchModel.dart';
import 'package:sala/modules/shop_app/home_Screen/search/SearchStates.dart';
import 'package:sala/shared/network/dio_helper.dart';
import 'package:sala/shared/network/end_points/end_points.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(InitSearchState());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;
  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(url: SEARCH, data: {'text': text}).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      // print(searchModel!.data!.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
