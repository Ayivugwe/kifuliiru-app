import 'dart:core';

class Umwazi {
  late int id;
  late String title;
  late String kishushanyo;
  late String magamboMingi;

  

  Umwazi(
      {required this.id,
      required this.title,
      required this.kishushanyo,
      required this.magamboMingi});
  Umwazi.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    kishushanyo = map['kishushanyo'];
    magamboMingi = map['magamboMingi'];
  }

  List getImyazi() {
    var list = [];
    Umwazi umwazi = Umwazi(
        id: 1,
        title: 'Umwazi 1',
        kishushanyo: 'Kishushanyo 1',
        magamboMingi: 'Magambo 1');

    list.add(umwazi);
    Umwazi umwazi2 = Umwazi(
        id: 2,
        title: 'Umwazi 2',
        kishushanyo: 'Kishushanyo 2',
        magamboMingi: 'Magambo 2');

    list.add(umwazi2);

    Umwazi umwazi3 = Umwazi(
        id: 3,
        title: 'Umwazi 3',
        kishushanyo: 'Kishushanyo 3',
        magamboMingi: 'Magambo 3');

    list.add(umwazi3);
    Umwazi umwazi4 = Umwazi(
        id: 4,
        title: 'Umwazi 4',
        kishushanyo: 'Kishushanyo 4',
        magamboMingi: 'Magambo 4');

    list.add(umwazi4);

    return list;
  }
}
