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

  factory Igambo.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
