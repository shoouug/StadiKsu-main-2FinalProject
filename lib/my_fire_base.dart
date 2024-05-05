import 'package:stadi_k_s_u/backend/backend.dart';
import 'package:stadi_k_s_u/stadium_model.dart';

class MyFireBaseStore {
  static List<StadiumModel> stadiums = [];
  // static getStadiums() async {
  //   final firestore =
  //       await FirebaseFirestore.instance.collection('Stadium').get();
  //   List<Map<String, dynamic>> data =
  //       firestore.docs.map((e) => e.data()).toList();
  //   stadiums = data.map((e) => StadiumModel.fromJson(e)).toList();
  //   print(stadiums);
  // }
}
