class shopModel {
  late bool status;
  String? message;
  DataShopModel? data;

  shopModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataShopModel.fromJson(json['data']) : null;
  }
}

class DataShopModel {
  late int id;
  late String name;
  late String email;
  late String phone;
  String? image;
  int? points;
  int? credit;
  late String token;

  //named Constructor
  DataShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
