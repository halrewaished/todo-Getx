import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseManager {

  static final FirebaseManager shared = FirebaseManager();

  final testRef = FirebaseFirestore.instance.collection('FirebaseManager');


  test({required String Test}) async {

    testRef.doc('Beta').set({
      "test": Test,
    });}

}