class AuthModel {
  final bool status;
  final String message;
  final Data? data;

  AuthModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthModel.fromJson(json) => AuthModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  // final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  // final int points;
  // final int credit;
  final String token;

  Data({
    // required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    // required this.points,
    // required this.credit,
    required this.token,
  });

  factory Data.fromJson(json) => Data(
        // id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        // points: json["points"],
        // credit: json["credit"],
        token: json["token"],
      );
}
