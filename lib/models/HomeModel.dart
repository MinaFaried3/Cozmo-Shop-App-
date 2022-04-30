class HomeModel {
  late bool status;
  HomeDataModel? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  // we must  use dynamic
  List<banner> banners = [];
  List<product> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(banner.fromJson(element));
    });

    json['products'].forEach((element) {
      products.add(product.fromJson(element));
    });
  }
}

class banner {
  late int id;
  late String image;

  banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class product {
  late int id;
  late dynamic price;
  late dynamic old_price;
  late dynamic discount;
  late String image;
  late String name;
  late bool in_favorites;
  late bool in_cart;
  product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}
