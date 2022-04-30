import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/network/dio_helper.dart';
import 'NewsStates.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int current = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball_outlined), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
  ];

  // List<Widget> Screens =[
  //   Business(),
  //   Sports(),
  //   Science(),
  //
  // ];

  void change(int index) {
    current = index;
    if (index == 0)
      getSports();
    else if (index == 2) getScience();
    emit(ChangeBottomNavBar());
  }

  List<dynamic> business = [];
  void getBusiness() {
    if (business.length == 0) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '22a04cfa970940d2b498756e109bf238'
      }).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((err) {
        print("${err.toString()} is happend");
        emit(NewsGetBusinessErrorState(error: err.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getSports() {
    if (sports.length == 0) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '22a04cfa970940d2b498756e109bf238'
      }).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((err) {
        print("${err.toString()} is happend");
        emit(NewsGetSportsErrorState(error: err.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    if (science.length == 0) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '22a04cfa970940d2b498756e109bf238'
      }).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((err) {
        print("${err.toString()} is happend");
        emit(NewsGetScienceErrorState(error: err.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String Value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$Value',
      'apiKey': '22a04cfa970940d2b498756e109bf238'
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((err) {
      print("${err.toString()} is happend");
      emit(NewsGetSearchErrorState(error: err.toString()));
    });
  }
}
