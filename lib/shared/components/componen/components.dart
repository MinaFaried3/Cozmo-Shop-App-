import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:sala/modules/shop_app/home_Screen/favorite_View.dart';

import '../../../Layout/shop_app/cubit_shop_layout.dart';
import '../../styles/color.dart';

Widget NewsItem(article, context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    '${article['urlToImage']}',
                  ),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 90,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

// Widget NewsItem(article, context) {
//   return InkWell(
//     onTap: () {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => WebViewscreen(article['url'])));
//     },
//     child: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Container(
//             width: 90,
//             height: 90,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                     image: NetworkImage(
//                       '${article['urlToImage']}',
//                     ),
//                     fit: BoxFit.cover)),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Container(
//               height: 90,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       '${article['title']}',
//                       style: Theme.of(context).textTheme.bodyText1,
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Text(
//                     '${article['publishedAt']}',
//                     style: TextStyle(color: Colors.grey, fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

Widget ListMino(list, context) {
  return ConditionalBuilderRec(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => NewsItem(list[index], context),
        separatorBuilder: (context, index) => Container(
              width: 180,
              height: 1.5,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              color: Color(0xffc2a671),
            ),
        itemCount: list.length),
    fallback: (context) => Center(
      child: CircularProgressIndicator(
        color: Color(0xffffddad),
      ),
    ),
  );
}

Widget buildListItem(model, context, {bool isOldPrice = false, int? index}) =>
    Dismissible(
      key: Key(UniqueKey().toString()),
      onDismissed: (dis) {
        ShopCubit.get(context).ChangFavorite(model.id);
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FavoriteView(
                        model,
                        isOldPrice: isOldPrice,
                      )));
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
                          image: NetworkImage(model!.image),
                        ),
                      ),
                    ),
                    if (model.discount != 0 && isOldPrice)
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
                      model.name,
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
                              model.price.toString(),

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
                            if (model.discount != 0 && isOldPrice)
                              Text(
                                model.oldPrice.toString(),
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
                            ShopCubit.get(context).ChangFavorite(model.id);
                          },
                          icon: ShopCubit.get(context).favorites[model.id]!
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
                              ShopCubit.get(context).ChangeCart(model.id);
                            },
                            icon: ShopCubit.get(context).cart[model.id]!
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
      ),
    );
