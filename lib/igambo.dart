class Igambo {
  final int id;

  final String igamboMuKifuliiru;
  final String sobanuuroYalyo;
  final String holishaziri;
  final String kizunguzaKyalyo;
  final String indetoYeSobanuuro;

  Igambo({
    required this.id,
    required this.igamboMuKifuliiru,
    required this.sobanuuroYalyo,
    required this.kizunguzaKyalyo,
    required this.holishaziri,
    required this.indetoYeSobanuuro,
  });

  factory Igambo.fromJson(Map<String, dynamic> json) {
    return Igambo(
        id: json['id'] as int,
        igamboMuKifuliiru: json['title'] as String,
        sobanuuroYalyo: json['sobaanuro'] as String,
        kizunguzaKyalyo: json['sobaanuroYeKiswahili'] as String,
        holishaziri: json['sobaanuroYeKifaransa'] as String,
        indetoYeSobanuuro: json['sobaanuroYeKingereza'] as String);
  }
}
