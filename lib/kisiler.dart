class Contact {
  int id;
  String fullName;
  String phoneNumber;
  String avatar;

  Contact({this.fullName, this.phoneNumber, this.avatar});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["fullName"] = fullName;
    map["phoneNumber"] = phoneNumber;
    map["avatar"] = avatar;
    return map;
  }

  Contact.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    fullName = map["fullName"];
    phoneNumber = map["phoneNumber"];
    avatar = map["avatar"];
  }
}
