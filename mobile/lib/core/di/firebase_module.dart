import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  // This tells get_it: "When someone asks for FirebaseFirestore,
  // return the FirebaseFirestore.instance singleton."
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}