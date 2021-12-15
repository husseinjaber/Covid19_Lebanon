import 'package:cloud_firestore/cloud_firestore.dart';
class StatsService {
  Firestore firestore = Firestore.instance;

  Future<List<DocumentSnapshot>> getStat(){
//    getUser();
    try {
      return firestore.collection("stats")
          .getDocuments()
          .then((snaps) {
        print(snaps.documents.length);
        return snaps.documents;
      });
    }on Exception {

    }

}

Future<List<DocumentSnapshot>> getpics(){
//    getUser();
    try {
      return firestore.collection("picsforsymp")
          .getDocuments()
          .then((snaps) {
        print(snaps.documents.length);
        return snaps.documents;
      });
    }on Exception {

    }

}
Future<List<DocumentSnapshot>> getDONATE(){
//    getUser();
    try {
      return firestore.collection("donate")
          .getDocuments()
          .then((snaps) {
        print(snaps.documents.length);
        return snaps.documents;
      });
    }on Exception {

    }

}


}
