import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/storage.dart';

class CloudFunctions {
  //static instance of firebase
  static final firebaseInstance = FirebaseFirestore.instance;

  //collection references
  static final CollectionReference users = firebaseInstance.collection('users');

  static final CollectionReference categories =
      firebaseInstance.collection('categories');

  static final CollectionReference whatsNew =
      firebaseInstance.collection('whatsnew');
  static final CollectionReference trending =
      firebaseInstance.collection('trending');

  static final CollectionReference banners =
      firebaseInstance.collection('banners');

  //add user to users-collection
  Future<void> registerUser(String uid, String email, String userName) async {
    Map<String, dynamic> userMap = {
      'uid': uid,
      'email': email,
      'userName': userName
    };
    await users.doc(uid).set(userMap);
  }

  //get user details
  Future<DocumentSnapshot> getUserDetail(String uid) async {
    return await users.doc(uid).get();
  }

  //get product list by category
  Future<List<QueryDocumentSnapshot>> getCategories(String category) async {
    final QuerySnapshot docReference =
        await categories.where('category', isEqualTo: category).get();
    print('doc reference length : ${docReference.docs.length}');

    final result = await categories
        .doc(docReference.docs[0]['id'])
        .collection('products')
        .get();

    //  print("document length is ${result.docs.length}");
    return result.docs;
  }

  //get whatsnew
  Future<List<QueryDocumentSnapshot>> getWhatsNew() async {
    final result = await whatsNew.get();
    return result.docs;
  }

  Future<List<QueryDocumentSnapshot>> getTrending() async {
    final result = await trending.get();
    return result.docs;
  }

  //add to cart
  Future<void> addToCart(String uid, Map<String, dynamic> productMap) async {
    await users.doc(uid).collection('cart').add(productMap);
  }

  //get from cart
  Future<List<QueryDocumentSnapshot>> getFromCart(String uid) async {
    final result = await users.doc(uid).collection('cart').get();
    print('${result.docs.length}');
    return result.docs;
  }

  //add to favourites
  Future<void> addToFavourites(
       Map<String, dynamic> productMap) async {
         final String uid = Storage().getUid();
    await users.doc(uid).collection('favourites').add(productMap);
  }

  //get from favourites
  Future<List<QueryDocumentSnapshot>> getFromFavourites(String uid) async {
    final result = await users.doc(uid).collection('favourites').get();
    print('${result.docs.length}');
    return result.docs;
  }

  //checkout
  Future<void> checkout() async {
    final uid = await Storage().getUid();
    final cartCollection = await users.doc(uid).collection('cart').get();
    await cartCollection.docs.forEach((doc) async {
      await firebaseInstance.runTransaction((Transaction transaction) async {
        await transaction.delete(doc.reference);
      });
    });
  }

  //get banner image
  Future<List<DocumentSnapshot>> getBannerImage() async {
    final uid = await Storage().getUid();
    final results = await banners.get();
    return   results.docs;
  }
}
