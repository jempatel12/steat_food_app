import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelpers {
  FirebaseHelpers._();

  static final FirebaseHelpers firebaseHelpers = FirebaseHelpers._();

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> featchData({required dbname}) {
    return firebaseFirestore.collection(dbname).snapshots();
  }

  Future<void> updatedata(
      {required Map<String, dynamic> data,
        required String id,
        required dbname}) async {
    await firebaseFirestore.collection(dbname).doc(id).update(data);
  }
}