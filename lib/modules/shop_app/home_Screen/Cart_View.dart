import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala/Layout/shop_app/cubit_shop_layout.dart';
import 'package:sala/Layout/shop_app/shop_layout_states.dart';
import 'package:sala/modules/shop_app/home_Screen/CartScreen.dart';
import 'package:sala/modules/shop_app/home_Screen/search/search.dart';
import 'package:sala/shared/styles/color.dart';

import '../../../models/CartModel.dart';

class CartView extends StatelessWidget {
  CartItems? model;
  CartView(this.model);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350,
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(model!.product!.image),
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 9,
                                  spreadRadius: 3,
                                  offset: Offset(0, 3))
                            ]),
                      ),
                      if (model!.product!.discount != 0)
                        Container(
                          margin: EdgeInsets.only(right: 15, bottom: 10),
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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    model!.product!.name,
                    style: TextStyle(
                        color: CozmoText,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Price',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Text(
                          '${model!.product!.price} .LE',
                          style: TextStyle(
                              color: CozmoColor2,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        if (model!.product!.discount != 0)
                          Text(
                            '${model!.product!.oldPrice} .LE',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: CozmoColor1,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "In Stock....",
                    style: TextStyle(
                        color: CozmoText,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 9,
                                    spreadRadius: 3,
                                    offset: Offset(0, 3))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: MaterialButton(
                            onPressed: () {
                              ShopCubit.get(context)
                                  .ChangFavorite(model!.product!.id);
                            },
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    ShopCubit.get(context)
                                        .ChangFavorite(model!.product!.id);
                                  },
                                  padding: EdgeInsets.all(0),
                                  icon: ShopCubit.get(context)
                                          .favorites[model!.product!.id]!
                                      ? Icon(
                                          Icons.favorite,
                                          color: CozmoColor7,
                                          size: 27,
                                        )
                                      : Icon(Icons.favorite_border),
                                ),
                                Text(
                                  "Wish List",
                                  style: TextStyle(
                                      color: ShopCubit.get(context)
                                              .favorites[model!.product!.id]!
                                          ? CozmoColor2
                                          : CozmoText,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 9,
                                    spreadRadius: 3,
                                    offset: Offset(0, 3))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: MaterialButton(
                            onPressed: () {
                              ShopCubit.get(context)
                                  .ChangeCart(model!.product!.id);
                            },
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: ShopCubit.get(context)
                                          .cart[model!.product!.id]!
                                      ? Icon(
                                          Icons.shopping_cart_outlined,
                                          color: CozmoColor2,
                                        )
                                      : Icon(Icons.add_shopping_cart_outlined),
                                ),
                                Text(
                                  "Add Cart",
                                  style: TextStyle(
                                      color: ShopCubit.get(context)
                                              .cart[model!.product!.id]!
                                          ? CozmoColor2
                                          : CozmoText,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    padding: EdgeInsets.all(8),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: CozmoColor2,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 4,
                              blurRadius: 9,
                              offset: Offset(0, 3))
                        ]),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
