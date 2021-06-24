class UrunOzellikleri {
  int id;
  String name;
  String stoc;
  String avatar;

  UrunOzellikleri({this.name, this.stoc, this.avatar});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["stok"] = stoc;
    map["avatar"] = avatar;
    return map;
  }

  UrunOzellikleri.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    stoc = map["stok adedi"];
    avatar = map["avatar"];
  }
}
