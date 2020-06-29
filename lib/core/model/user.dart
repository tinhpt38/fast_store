class User {
  final int id;
  final String username;
  final String password;
  final String phone;
  final String address;

  User({this.id, this.username, this.password, this.phone, this.address});

  User.fromJson(Map<String, dynamic> json)
      : this.id = json["id"],
        this.username = json["user_name"],
        this.password = json["password"],
        this.phone = json["phone"],
        this.address = json["address"];

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "user_name": this.username,
        "password": this.password,
        "phone": this.phone,
        "address": this.address
      };
}
