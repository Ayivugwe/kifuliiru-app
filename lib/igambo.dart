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
        id: json['_id'] ?? "",
        igamboMuKifuliiru: json['title'] ?? "",
        sobanuuroYalyoMuKifuliiru: json['sobaanuro'] ?? "",
        sobanuuroYalyoMuKiswahili: json['sobaanuroYeKiswahili'] ?? "",
        sobanuuroYalyoMuKifaransa: json['sobaanuroYeKifaransa'] ?? "",
        sobanuuroYalyoMuKingereza: json['sobaanuroYeKingereza'] ?? "");
  }
}
