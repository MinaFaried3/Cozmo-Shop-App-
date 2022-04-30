import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/Layout/shop_app/cubit_shop_layout.dart';
import 'package:sala/Layout/shop_app/shop_layout_states.dart';
import 'package:sala/models/CategoriesModel.dart';
import 'package:sala/shared/styles/color.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc1 = ShopCubit.get(context);
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildCatItem(bloc1.categoriesModel!.data!.data[index]),
            separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  height: 1,
                  color: CozmoColor3,
                ),
            itemCount: bloc1.categoriesModel!.data!.data.length);
      },
    );
  }

  Widget buildCatItem(DataObject model) => Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(model.image),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.27),
                        spreadRadius: 3,
                        blurRadius: 9,
                        offset: Offset(0, 2))
                  ]),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
                child: Text(
              model.name,
              style: TextStyle(
                  color: CozmoText, fontWeight: FontWeight.w600, fontSize: 25),
            )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: CozmoColor,
                ))
          ],
        ),
      );
}
