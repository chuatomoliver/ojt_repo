import 'package:audit_finance_app/models/journal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCRUD {
  Future createEntry({required Journal journalEntry}) async {
    final docJournal = FirebaseFirestore.instance.collection('journal').doc();

    journalEntry.id = docJournal.id;

    await docJournal.set(journalEntry.toJson());
  }

  // READ ALL DATA
  Stream<List<Journal>> readEntries() => FirebaseFirestore.instance
      .collection('journal')
      .snapshots()
      .map((snaphot) =>
          snaphot.docs.map((entry) => Journal.fromJson(entry.data())).toList());

  // READ SPECIFIC DATA
  Future<Journal?> readEntry() async {
    // ADD PARAMETER FOR ID REFERENCE
    final docJournal =
        FirebaseFirestore.instance.collection('journal').doc('sampleid');
    final snapshot = await docJournal.get();

    if (snapshot.exists) {
      return Journal.fromJson(snapshot.data()!);
    }
    return null;
  }

  void deleteEntry({required String id}) {
    // ADD PARAMETER FOR ID REFERENCE
    final docJournal = FirebaseFirestore.instance.collection('journal').doc(id);

    docJournal.delete();
  }

  void updateEntry({required Journal entry}) {
    final docJournal =
        FirebaseFirestore.instance.collection('journal').doc(entry.id);

    docJournal.update(entry.toJson());
  }
}
