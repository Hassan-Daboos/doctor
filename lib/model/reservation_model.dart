
class ReservationModel {
  String? time;
  String? userId;
  String? date;
  int? docId;



  ReservationModel({
     this.time,
     this.date,
     this.docId,

     this.userId,

  });

  Map<String, dynamic> toMap() {
    return {
      'time': this.time,
      'date': this.date,
      'docId': this.docId,

      'userId': this.userId,

    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      time: map['time'] as String,
      docId: map['docId'] as int,
      date: map['date'] as String,

      userId: map['userId'] as String,

    );
  }
}
