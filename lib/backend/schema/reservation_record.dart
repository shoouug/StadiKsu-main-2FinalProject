import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ReservationRecord extends FirestoreRecord {
  ReservationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "stadiumID" field.
  DocumentReference? _stadiumID;
  DocumentReference? get stadiumID => _stadiumID;
  bool hasStadiumID() => _stadiumID != null;

  // "UserID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _stadiumID = snapshotData['stadiumID'] as DocumentReference?;
    _userID = snapshotData['UserID'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservation');

  static Stream<ReservationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationRecord.fromSnapshot(s));

  static Future<ReservationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationRecord.fromSnapshot(s));

  static ReservationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationRecordData({
  DateTime? date,
  DocumentReference? stadiumID,
  DocumentReference? userID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'stadiumID': stadiumID,
      'UserID': userID,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationRecordDocumentEquality implements Equality<ReservationRecord> {
  const ReservationRecordDocumentEquality();

  @override
  bool equals(ReservationRecord? e1, ReservationRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.stadiumID == e2?.stadiumID &&
        e1?.userID == e2?.userID;
  }

  @override
  int hash(ReservationRecord? e) =>
      const ListEquality().hash([e?.date, e?.stadiumID, e?.userID]);

  @override
  bool isValidKey(Object? o) => o is ReservationRecord;
}
