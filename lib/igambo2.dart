// lib/models/igambo.dart

class DictionaryResponse {
  List<Igambo>? items;

  DictionaryResponse({this.items});

  DictionaryResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Igambo>[];
      json['items'].forEach((v) {
        items!.add(Igambo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Igambo {
  String? sId;
  String? sOwner;
  String? sCreatedDate;
  String? sUpdatedDate;
  String? igambo;
  String? kiswahili;
  String? kifuliiru;
  String? kingereza;
  String? kifaransa;
  List<String>? holidesirwi;

  Igambo({
    this.sId,
    this.sOwner,
    this.sCreatedDate,
    this.sUpdatedDate,
    this.kiswahili,
    this.kifuliiru,
    this.igambo,
    this.kingereza,
    this.kifaransa,
    this.holidesirwi,
  });

  Igambo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sOwner = json['_owner'];
    sCreatedDate = json['_createdDate'];
    sUpdatedDate = json['_updatedDate'];
    kiswahili = json['sobaanuroYeKiswahili'];
    kifuliiru = json['sobaanuro'];
    igambo = json['title'];
    kingereza = json['sobaanuroYeKingereza'];
    kifaransa = json['sobaanuroYeKifaransa'];
    holidesirwi = json['holidesirwi']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['_owner'] = sOwner;
    data['_createdDate'] = sCreatedDate;
    data['_updatedDate'] = sUpdatedDate;
    data['sobaanuroYeKiswahili'] = kiswahili;
    data['sobaanuro'] = kifuliiru;
    data['title'] = igambo;
    data['sobaanuroYeKingereza'] = kingereza;
    data['sobaanuroYeKifaransa'] = kifaransa;
    data['holidesirwi'] = holidesirwi;
    return data;
  }
}
