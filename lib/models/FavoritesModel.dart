class FavoriteModel {
  late bool status;

  Data? data;

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  late int currentPage;
  List<FavoriteData> data = [];
  late String firstPageUrl;
  late int from;
  late int lastPage;
  late String lastPageUrl;

  late String path;
  late int perPage;

  late int to;
  late int total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <FavoriteData>[];
      json['data'].forEach((v) {
        data.add(new FavoriteData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];

    path = json['path'];
    perPage = json['per_page'];

    to = json['to'];
    total = json['total'];
  }
}

class FavoriteData {
  late int id;
  Product? product;

  FavoriteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = Product.fromJson(json['product']);
  }
}

class Product {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late String description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
