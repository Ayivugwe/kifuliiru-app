class Igambo {
  final String? id;
  final String title;
  final String? sobaanuro;
  final String? sobaanuroYeKiswahili;
  final String? sobaanuroYeKifaransa;
  final String? sobaanuroYeKingereza;
  final List<String>? holidesirwi;
  final String? createdDate;
  final String? status;

  Igambo({
    this.id,
    required this.title,
    this.sobaanuro,
    this.sobaanuroYeKiswahili,
    this.sobaanuroYeKifaransa,
    this.sobaanuroYeKingereza,
    this.holidesirwi,
    this.createdDate,
    this.status,
  });

  factory Igambo.fromJson(Map<String, dynamic> json) {
    return Igambo(
      id: json['_id'],
      title: json['title'] ?? '',
      sobaanuro: json['sobaanuro'],
      sobaanuroYeKiswahili: json['sobaanuroYeKiswahili'],
      sobaanuroYeKifaransa: json['sobaanuroYeKifaransa'],
      sobaanuroYeKingereza: json['sobaanuroYeKingereza'],
      holidesirwi: json['holidesirwi'] != null
          ? List<String>.from(json['holidesirwi'])
          : null,
      createdDate: json['_createdDate'],
      status: json['status'],
    );
  }
}
