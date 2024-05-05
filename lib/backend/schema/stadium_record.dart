import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StadiumRecord extends FirestoreRecord {
  StadiumRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "imgURL" field.
  String? _imgURL;
  String get imgURL => _imgURL ?? '';
  bool hasImgURL() => _imgURL != null;

  // "stNo" field.
  String? _stNo;
  String get stNo => _stNo ?? '';
  bool hasStNo() => _stNo != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  void _initializeFields() {
    _capacity = castToType<int>(snapshotData['capacity']);
    _imgURL = snapshotData['imgURL'] as String?;
    _stNo = snapshotData['stNo'] as String?;
    _name = snapshotData['name'] as String?;
    _department = snapshotData['Department'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Stadium');

  static Stream<StadiumRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StadiumRecord.fromSnapshot(s));

  static Future<StadiumRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StadiumRecord.fromSnapshot(s));

  static StadiumRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StadiumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StadiumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StadiumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StadiumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StadiumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStadiumRecordData({
  int? capacity,
  String? imgURL,
  String? stNo,
  String? name,
  String? department,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'capacity': capacity,
      'imgURL': imgURL,
      'stNo': stNo,
      'name': name,
      'Department': department,
    }.withoutNulls,
  );

  return firestoreData;
}

class StadiumRecordDocumentEquality implements Equality<StadiumRecord> {
  const StadiumRecordDocumentEquality();

  @override
  bool equals(StadiumRecord? e1, StadiumRecord? e2) {
    return e1?.capacity == e2?.capacity &&
        e1?.imgURL == e2?.imgURL &&
        e1?.stNo == e2?.stNo &&
        e1?.name == e2?.name &&
        e1?.department == e2?.department;
  }

  @override
  int hash(StadiumRecord? e) => const ListEquality()
      .hash([e?.capacity, e?.imgURL, e?.stNo, e?.name, e?.department]);

  @override
  bool isValidKey(Object? o) => o is StadiumRecord;
}
