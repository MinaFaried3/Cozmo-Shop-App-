import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sala/Layout/shop_app/cubit_shop_layout.dart';
import 'package:sala/Layout/shop_app/shop_layout_states.dart';
import 'package:sala/models/CategoriesModel.dart';
import 'package:sala/models/HomeModel.dart';
import 'package:sala/modules/shop_app/home_Screen/Product_view.dart';
import 'package:sala/shared/styles/color.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
      listener: (context, state) {
        if (state is ShopSuccessFavoritesState) {
          Fluttertoast.showToast(
              msg: state.model!.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.red,
              fontSize: 16);
        }

        if (state is ShopSuccessCartState) {
          Fluttertoast.showToast(
              msg: state.model!.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.red,
              fontSize: 16);
        }
      },
      builder: (context, state) {
        var bloc1 = ShopCubit.get(context);
        return ConditionalBuilderRec(
          condition: BlocProvider.of<ShopCubit>(context).homeModel != null &&
              BlocProvider.of<ShopCubit>(context).categoriesModel != null,
          builder: (context) => productBuilder(
              BlocProvider.of<ShopCubit>(context).homeModel,
              BlocProvider.of<ShopCubit>(context).categoriesModel,
              context),
          fallback: (context) => Center(
              child: CircularProgressIndicator(
            color: CozmoColor1,
          )),
        );
      },
    );
  }

  Widget productBuilder(
      HomeModel? model, CategoriesModel? categoriesModel, context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CarouselSlider(
            items: model!.data!.banners
                .map((e) => Container(
                      margin: EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 13),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            topLeft: Radius.circular(6),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(e.image),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                blurRadius: 9,
                                spreadRadius: 3,
                                offset: Offset(0, 2))
                          ]),
                    ))
                .toList(),
            options: CarouselOptions(
                height: 200,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1)),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 6),
          child: Text(
            "Categories",
            style: TextStyle(
                color: CozmoText, fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 130,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                CategoreyItem(categoriesModel!.data!.data[index]),
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            itemCount: categoriesModel!.data!.data.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            "New Products",
            style: TextStyle(
                color: CozmoText, fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 1 / 1.58,
            children: List.generate(model.data!.products.length, (index) {
              return Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 9,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductView(
                                  index,
                                  model,
                                )));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            height: 200,
                            // padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${model.data!.products[index].image}'),
                                )),
                          ),
                          if (model.data!.products[index].discount != 0)
                            Container(
                              margin: EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        blurRadius: 6,
                                        spreadRadius: 2,
                                        offset: Offset(0, 3))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Discount',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              model.data!.products[index].name,
                              style: TextStyle(
                                  color: CozmoText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // SizedBox(
                            //   height: 0,
                            // ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${model.data!.products[index].price} ',
                                  style: TextStyle(
                                      color: CozmoColor2,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                if (model.data!.products[index].discount != 0)
                                  Text(
                                    '${model.data!.products[index].old_price} ',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: CozmoColor1,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                Spacer(),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      print(model.data!.products[index].id);
                                      ShopCubit.get(context).ChangFavorite(
                                          model.data!.products[index].id);
                                    },
                                    icon: ShopCubit.get(context).favorites[
                                            model.data!.products[index].id]!
                                        ? Icon(
                                            Icons.favorite,
                                            color: CozmoColor7,
                                            size: 27,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            color: CozmoText1,
                                            size: 20,
                                          ),
                                    padding: EdgeInsets.all(0),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ShopCubit.get(context).ChangeCart(
                                        model.data!.products[index].id);
                                  },
                                  icon: ShopCubit.get(context)
                                          .cart[model.data!.products[index].id]!
                                      ? Icon(
                                          Icons.shopping_cart_outlined,
                                          color: CozmoColor2,
                                        )
                                      : Icon(
                                          Icons.add_shopping_cart_outlined,
                                          color: CozmoText1,
                                        ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ]),
    );
  }

  Widget CategoreyItem(DataObject model) => Center(
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Stack(
            alignment: Alignment.bottomCenter,
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
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(
                  model.name,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
}
