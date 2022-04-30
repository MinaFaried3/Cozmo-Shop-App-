class ChangeFavoriteModel {
  late bool status;
  late String message;
  ChangeFavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
