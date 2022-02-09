/* class Igambo {
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
} */

class Igambo {
  String? title;
  String? sobaanuro;
  String? sobaanuroYeKiswahili;
  String? sobaanuroYeKifaransa;
  String? sobaanuroYeKingereza;
  int? ndetoSobanuuro;
  String? kishushanyo;
  List<String>? holidesirwi;

  Igambo(
      {this.title,
      this.sobaanuro,
      this.sobaanuroYeKiswahili,
      this.sobaanuroYeKifaransa,
      this.sobaanuroYeKingereza,
      this.ndetoSobanuuro,
      this.kishushanyo,
      this.holidesirwi});

  Igambo.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    sobaanuro = json['Sobaanuro'];
    sobaanuroYeKiswahili = json['Sobaanuro ye Kiswahili'];
    sobaanuroYeKifaransa = json['Sobaanuro ye Kifaransa'];
    sobaanuroYeKingereza = json['Sobaanuro ye Kingereza'];
    ndetoSobanuuro = json['Ndeto_sobanuuro'];
    kishushanyo = json['Kishushanyo'];
    //holidesirwi = json['Holidesirwi'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Sobaanuro'] = this.sobaanuro;
    data['Sobaanuro ye Kiswahili'] = this.sobaanuroYeKiswahili;
    data['Sobaanuro ye Kifaransa'] = this.sobaanuroYeKifaransa;
    data['Sobaanuro ye Kingereza'] = this.sobaanuroYeKingereza;
    data['Ndeto_sobanuuro'] = this.ndetoSobanuuro;
    data['Kishushanyo'] = this.kishushanyo;
    data['Holidesirwi'] = this.holidesirwi;
    return data;
  }
}
