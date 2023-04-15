
class MedicalHistoryModel {
  String title;
  String date;

  String medicalPhoto;

  String userId;

  MedicalHistoryModel({
    required this.title,
    required this.date,
    required this.medicalPhoto,
    required this.userId,

  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'date':this.date,
      'medicalPhoto':this.medicalPhoto,
      'userId': this.userId,

    };
  }

  factory MedicalHistoryModel.fromMap(Map<String, dynamic> map) {
    return MedicalHistoryModel(
      title: map['title'] as String,
      date: map['date'] as String,
      medicalPhoto: map['medicalPhoto'] as String,
      userId: map['userId'] as String,

    );
  }
}
