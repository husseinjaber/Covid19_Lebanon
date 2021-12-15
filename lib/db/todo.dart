import 'package:cloud_firestore/cloud_firestore.dart';
class TodoService {
  Firestore firestore = Firestore.instance;

  Future<List<DocumentSnapshot>> getTODO(){
//    getUser();
    try {
      return firestore.collection("todo")
          .getDocuments()
          .then((snaps) {
        print(snaps.documents.length);
        print("hereeeeeeeeee");
        return snaps.documents;
      });
    }on Exception {
      print("fuck");
    }

  }}
