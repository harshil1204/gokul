// Category model
class Category {
  String id;
  String name;

  Category({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}

class Banner1 {
  String url;

  Banner1({required this.url});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }
}

// Product model
class Product {
  String id;
  String name;
  String categoryID;

  Product({required this.id, required this.name, required this.categoryID});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'categoryID': categoryID,
    };
  }
}