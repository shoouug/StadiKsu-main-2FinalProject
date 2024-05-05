class StadiumModel {
  final int capacity;
  final String department;
  final String imgURL;
  final String name;
  final String stNo;
  final String state;

  StadiumModel(
      {required this.capacity,
      required this.department,
      required this.imgURL,
      required this.name,
      required this.stNo,
      required this.state});

  factory StadiumModel.fromJson(Map<String, dynamic> json) {
    return StadiumModel(
      capacity: json['capacity'] as int,
      department: json['department'] as String,
      imgURL: json['imgURL'] as String,
      name: json['name'] as String,
      stNo: json['stNo'] as String,
      state: json['state'] as String,
    );
  }
}
