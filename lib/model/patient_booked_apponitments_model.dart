class MyModel {
  List<Dates>? dates;

  MyModel({required this.dates});

  MyModel.fromJson(Map<String, dynamic> json) {
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {

      'dates': this.dates!.map((v) => v.toJson()).toList(),
    };
  }
}

class Dates {
  String? time;

  Dates({required this.check,required this.time,});

  bool? check;

  Dates.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'check': check,
    };
  }
}
