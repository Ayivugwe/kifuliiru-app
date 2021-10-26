class Igambo {
  final String id;
  late final String igamboMuKifuliiru;
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
        id: json['_id'] as String,
        igamboMuKifuliiru: json['title'] as String,
        sobanuuroYalyoMuKifuliiru: json['sobaanuro'] as String,
        sobanuuroYalyoMuKiswahili: json['sobaanuroYeKiswahili'] as String,
        sobanuuroYalyoMuKifaransa: json['sobaanuroYeKifaransa'] as String,
        sobanuuroYalyoMuKingereza: json['sobaanuroYeKingereza'] as String);
  }
}
