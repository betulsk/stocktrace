class Product {
  //id INTEGER PRIMARY KEY, name TEXT, categoryId INTEGER,stockQuantity INTEGER, image TEXT, status INTEGER
  int id;
  String name;
  int categoryId;
  int stockQuantity;
  String image;
  int status;
  int price;

  Product(
      {this.id,
      this.name,
      this.categoryId,
      this.stockQuantity,
      this.image,
      this.price,
      this.status});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["categoryId"] = categoryId;
    map["stockQuantity"] = stockQuantity;
    map["price"] = price;
    map["image"] = image;
    map["status"] = status;
    return map;
  }

  Product.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    categoryId = map["categoryId"];
    stockQuantity = map["stockQuantity"];
    price = map["price"];
    image = map["image"];
    status = map["status"];
  }
}
