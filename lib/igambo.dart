class Igambo {
  final String id;
  final String igamboMuKifuliiru;
  final String sobanuuroYalyoMuKifuliiru,
      sobanuuroYalyoMuKiswahili,
      sobanuuroYalyoMuKifaransa,
      sobanuuroYalyoMuKingereza;

  Igambo({
    required this.id,
    required this.igamboMuKifuliiru,
    required this.sobanuuroYalyoMuKifuliiru,
    required this.sobanuuroYalyoMuKiswahili,
    required this.sobanuuroYalyoMuKifaransa,
    required this.sobanuuroYalyoMuKingereza,
  });

  factory Igambo.fromJson(Map<String, dynamic> json) {
    return Igambo(
        id: json['_id'].toString(),
        igamboMuKifuliiru: json['title'].toString(),
        sobanuuroYalyoMuKifuliiru: json['sobaanuro'].toString(),
        sobanuuroYalyoMuKiswahili: json['sobaanuroYeKiswahili'].toString(),
        sobanuuroYalyoMuKifaransa: json['sobaanuroYeKifaransa'].toString(),
        sobanuuroYalyoMuKingereza: json['sobaanuroYeKingereza'].toString());
  }
}
