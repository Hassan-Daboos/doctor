class MyModel {
  List<String>? dates;

  MyModel({required this.dates});

  MyModel.fromJson(Map<String, dynamic> json) {
    dates = List<String>.from(json['dates']);
  }

  Map<String, dynamic> toJson() {
    return {
      'dates': List<String>.from(dates!),
    };
  }
}
