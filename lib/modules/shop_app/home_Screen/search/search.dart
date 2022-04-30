import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/modules/shop_app/home_Screen/search/SearchCubit.dart';

import '../../../../shared/components/componen/components.dart';
import '../../../../shared/styles/color.dart';
import '../CartScreen.dart';
import 'SearchStates.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    // var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Container(
                margin: EdgeInsets.only(top: 5, right: 0, bottom: 5),
                height: 40,
                // width: double.infinity,
                child: TextFormField(
                  controller: search,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: CozmoText,
                      ),
                      // filled: true,

                      alignLabelWithHint: true,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontSize: 20, textBaseline: TextBaseline.ideographic),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CozmoText, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CozmoText, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      )),
                  cursorColor: CozmoText,
                  onFieldSubmitted: (String text) {
                    SearchCubit.get(context).search(text);
                  },
                  onChanged: (String text) {
                    SearchCubit.get(context).search(text);
                  },
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                    // bloc1.GetCartData();
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: CozmoText,
                    size: 30,
                  ),
                  // alignment: Alignment(-, 0.0),
                  padding: EdgeInsets.only(top: 7, bottom: 7),
                )
              ],
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 3,
                ),
                if (state is SearchLoadingState)
                  LinearProgressIndicator(
                    color: CozmoText,
                    backgroundColor: Colors.white70,
                  ),
                if (state is SearchSuccessState)
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => buildListItem(
                            SearchCubit.get(context)
                                .searchModel!
                                .data!
                                .data[index],
                            context,
                            isOldPrice: false),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 0),
                        itemCount: SearchCubit.get(context)
                            .searchModel!
                            .data!
                            .data
                            .length),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
