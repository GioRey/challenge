class CounterModel {
  final String? uid;
  int? count;

  CounterModel({this.uid, this.count});

  CounterModel copyWith({String? uid, int? count}) {
    return CounterModel(uid: uid ?? this.uid, count: count ?? this.count);
  }

  Map<String, dynamic> toJson() => {'uid': uid, 'counter': count};

  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(uid: json['uid'], count: json['counter']);
  }
}
