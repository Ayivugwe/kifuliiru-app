class Igambo {
  int id;

  String igamboMuKifuliiru,
      sobanuuroYalyo,
      holishaziri,
      kizunguzaKyalyo,
      indetoYeSobanuuro;

  Igambo(int id, String igamboMuKifuliiru, String sobanuuroYalyo,
      String kizunguzaKyalyo, String holishaziri, String indetoYeSobanuuro) {
    this.id = id;
    this.igamboMuKifuliiru = igamboMuKifuliiru;
    this.sobanuuroYalyo = sobanuuroYalyo;
    this.kizunguzaKyalyo = kizunguzaKyalyo;
    this.holishaziri = holishaziri;
    this.indetoYeSobanuuro = indetoYeSobanuuro;
  }

  factory Igambo.fromJson(dynamic json) {
    return Igambo(
        json['id'] as int,
        json['title'] as String,
        json['sobaanuro'] as String,
        json['sobaanuroYeKiswahili'] as String,
        json['sobaanuroYeKifaransa'] as String,
        json['sobaanuroYeKingereza'] as String);
  }
}
