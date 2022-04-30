import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/Layout/shop_app/cubit_shop_layout.dart';
import 'package:sala/Layout/shop_app/shop_layout_states.dart';

import '../../../shared/components/componen/components.dart';
import '../../../shared/styles/color.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilderRec(
          condition: ShopCubit.get(context).favoriteModel != null,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => buildListItem(
                  ShopCubit.get(context)
                      .favoriteModel!
                      .data!
                      .data[index]
                      .product,
                  context,
                  isOldPrice: true,
                  index: index),
              separatorBuilder: (context, index) => SizedBox(height: 0),
              itemCount:
                  ShopCubit.get(context).favoriteModel!.data!.data.length),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: CozmoColor1,
            ),
          ),
        );
      },
    );
  }
}
