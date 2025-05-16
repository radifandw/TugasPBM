import 'package:cloud_firestore/cloud_firestore.dart';
import 'product.dart';

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Create a new product
  Future<void> addProduct(Product product) async {
    await _db.collection('products').add(product.toMap());
  }

  // Read all products from Firestore
  Stream<List<Product>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.id, doc.data());

      }).toList();
    });
  }

  // Update a product in Firestore
  Future<void> updateProduct(Product product) async {
    await _db.collection('products').doc(product.id).update(product.toMap());
  }

  // Delete a product from Firestore
  Future<void> deleteProduct(String productId) async {
    await _db.collection('products').doc(productId).delete();
  }
}
  