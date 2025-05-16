class Product {
  String id;
  String name;
  double price;

  Product({required this.id, required this.name, required this.price});

  // Convert model to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }

  // Convert Map from Firestore to model
  factory Product.fromMap(String id, Map<String, dynamic> map) {
    return Product(
      id: id,
      name: map['name'],
      price: map['price'],
    );
  }
}
