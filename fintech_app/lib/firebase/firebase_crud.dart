import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class FirebaseFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future register({required User user}) async {
    final docUser = _firestore.collection('users').doc();

    user.id = docUser.id;

    await docUser.set(user.toJson());
  }
}
