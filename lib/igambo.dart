class Igambo {
  String? igambo;
  String? kifuliiru, kiswahili, kifaransa, kingereza, kishushanyo, holidesirwi;

  Igambo(
      {this.igambo,
      this.kifuliiru,
      this.kiswahili,
      this.kifaransa,
      this.kingereza,
      this.kishushanyo,
      this.holidesirwi});

  factory Igambo.fromJson(Map<String, dynamic> json) {
    return Igambo(
        igambo: json['Igambo'] ?? "",
        kifuliiru: json['Kifuliiru'] ?? "",
        kiswahili: json['Kiswahili'] ?? "",
        kifaransa: json['Kifaransa'] ?? "",
        kingereza: json['Kingereza'] ?? "",
        kishushanyo: json['Kishushanyo'] ?? "",
        holidesirwi: json['Holidesirwi'] ?? "");
  }
}
