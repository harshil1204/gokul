import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gokul/model/model.dart';


// Create a service for database operations
class FirebaseService {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addCategory(Category category) async {
  await _firestore.collection('Categories').doc(category.id).set(category.toMap());
}

Future<void> addProduct(Product product) async {
  await _firestore.collection('Products').doc(product.id).set(product.toMap());
}

Future<List<Product>> getProductsByCategory(String categoryID) async {
  // List<Product> product = [];
  // QuerySnapshot productSnapshot = await _firestore.collection('Products').where('categoryID', isEqualTo: categoryID).get();
  //
  // productSnapshot.docs.forEach((productDoc) {
  //   product.add(
  //     Product(
  //       id: productDoc.id,
  //       name: productDoc['name'] ?? '',
  //       categoryID: productDoc['categoryID'] ?? '',
  //     ),
  //   );
  // });
  //
  // return product;

  List<Product> products = [];
  QuerySnapshot productSnapshot = await _firestore
      .collection('Products')
      .where('categoryID', isEqualTo: categoryID)
      .get();

  products = productSnapshot.docs.map((productDoc) {
    // Explicitly check for null values before accessing fields
    String productName = productDoc['name'] as String? ?? 'Unknown Product';
    String productCategoryID = productDoc['categoryID'] as String? ?? 'Unknown Category';

    return Product(
      id: productDoc.id,
      name: productName,
      categoryID: productCategoryID,
    );
  }).toList();

  return products;
}

Future<dynamic> fetchDataFromFirestoreBanner() async {
  List<Map<String, dynamic>> dataList = [];

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Banner').get();

    var a=querySnapshot.docs.map((e) => e.data()).toList();


    return a;
  } catch (e) {
    // Handle errors here
    print("Error fetching data: $e");
    return dataList; // Return an empty list or handle the error as needed
  }
}

Future<dynamic> fetchDataFromFirestoreGoldPrice() async {
  List<Map<String, dynamic>> dataList = [];

  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('GoldPrice').orderBy('time',descending: true).get();

    var a=querySnapshot.docs.map((e) => e.data()).toList();


    return a;
  } catch (e) {
    // Handle errors here
    print("Error fetching data: $e");
    return dataList; // Return an empty list or handle the error as needed
  }
}

Future<List<Category>> getAllCategories() async {
  List<Category> categories = [];
  QuerySnapshot categorySnapshot = await _firestore.collection('Categories').get();

  categorySnapshot.docs.forEach((categoryDoc) {
    categories.add(
      Category(
        id: categoryDoc.id,
        name: categoryDoc['name'],
      ),
    );
  });

  return categories;
}

Future<List<Map<String, dynamic>>> fetchDataFromFirestore() async {
  List<Map<String, dynamic>> dataList = [];

  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await FirebaseFirestore.instance.collection('Banner').get();

    dataList = querySnapshot.docs.map((doc) => doc.data()).toList();

    return dataList;
  } catch (e) {
    print('Error fetching data: $e');
    return dataList; // Return an empty list on error
  }
}
}