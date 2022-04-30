import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Layout/shop_app/cubit_shop_layout.dart';
import '../../../Layout/shop_app/shop_layout_states.dart';
import '../../../models/CartModel.dart';
import '../../../shared/styles/color.dart';
import 'Cart_View.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
          ),
          body: ConditionalBuilderRec(
            condition: ShopCubit.get(context).cartModel != null,
            builder: (context) => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildFavItem(
                          ShopCubit.get(context)
                              .cartModel!
                              .data!
                              .cartItems[index],
                          context,
                          list: ShopCubit.get(context).cartModel!.data),
                      separatorBuilder: (context, index) => SizedBox(height: 0),
                      itemCount: ShopCubit.get(context)
                          .cartModel!
                          .data!
                          .cartItems
                          .length),
                  SizedBox(
                    height: 13,
                  ),
                  if (ShopCubit.get(context).cartModel!.data!.cartItems.length >
                      0)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 70),
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
                          "Buy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: CozmoColor1,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildFavItem(CartItems model, context, {Data? list}) =>
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CartView(model)));
        },
        child: Container(
          height: 170,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 3,
                    offset: Offset(0, 3))
              ]),
          child: Row(
            children: [
              Container(
                height: 200,
                width: 170,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      // padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(model.product!.image),
                        ),
                      ),
                    ),
                    if (model.product!.discount != 0)
                      Container(
                        margin: EdgeInsets.only(left: 6, bottom: 4),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
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
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.product!.name,
                      style: TextStyle(
                          color: CozmoText,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.8),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.product!.price.toString(),
                              style: TextStyle(
                                  color: CozmoColor2,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                              maxLines: 1,
                              // overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            if (model.product!.discount != 0)
                              Text(
                                model.product!.oldPrice.toString(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: CozmoColor1,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            ShopCubit.get(context)
                                .ChangFavorite(model.product!.id);
                          },
                          icon: ShopCubit.get(context)
                                  .favorites[model.product!.id]!
                              ? Icon(
                                  Icons.favorite,
                                  color: CozmoColor7,
                                  size: 22,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: CozmoColor7,
                                  size: 18,
                                ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              ShopCubit.get(context)
                                  .ChangeCart(model.product!.id);
                            },
                            icon:
                                ShopCubit.get(context).cart[model.product!.id]!
                                    ? Icon(
                                        Icons.shopping_cart_outlined,
                                        color: CozmoColor2,
                                      )
                                    : Icon(
                                        Icons.add_shopping_cart_outlined,
                                        color: CozmoText1,
                                      ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
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
}
