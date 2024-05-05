import 'package:stadi_k_s_u/backend/backend.dart';

class ReservationModel {
  final String userId;
  final String name;
  final String date;
  final String time;
  final String stadiumNo;
  final String reservationId;
  final String imageUrl;

  ReservationModel({
    required this.userId,
    required this.name,
    required this.date,
    required this.time,
    required this.stadiumNo,
    required this.reservationId,
    required this.imageUrl,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> data) {
    return ReservationModel(
      userId: data['UserID'] as String,
      name: data['stadiumName'] as String,
      date: data['date'] as String,
      time: data['time'] as String,
      stadiumNo: data['stadiumNo'] as String,
      reservationId: data['reservationId'] as String,
      imageUrl: data['ImageUrl'] as String,
    );
  }
}
