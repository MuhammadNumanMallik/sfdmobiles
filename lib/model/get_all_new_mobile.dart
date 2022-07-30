/// new_ph_id : 16
/// sh_id : 2
/// new_mob_name : "dftt"
/// new_mob_mod : 167
/// new_mob_ram : 6
/// new_mob_rom : 79
/// new_mob_price : 6788
/// new_mobile_pta : "yes"
/// new_mob_img : "image_picker4232975565624186484.jpg"

class GetAllNewMobile {
  GetAllNewMobile({
      int? newPhId, 
      int? shId, 
      String? newMobName, 
      int? newMobMod, 
      int? newMobRam, 
      int? newMobRom, 
      int? newMobPrice, 
      String? newMobilePta, 
      String? newMobImg,}){
    _newPhId = newPhId;
    _shId = shId;
    _newMobName = newMobName;
    _newMobMod = newMobMod;
    _newMobRam = newMobRam;
    _newMobRom = newMobRom;
    _newMobPrice = newMobPrice;
    _newMobilePta = newMobilePta;
    _newMobImg = newMobImg;
}

  GetAllNewMobile.fromJson(dynamic json) {
    _newPhId = json['new_ph_id'];
    _shId = json['sh_id'];
    _newMobName = json['new_mob_name'];
    _newMobMod = json['new_mob_mod'];
    _newMobRam = json['new_mob_ram'];
    _newMobRom = json['new_mob_rom'];
    _newMobPrice = json['new_mob_price'];
    _newMobilePta = json['new_mobile_pta'];
    _newMobImg = json['new_mob_img'];
  }
  int? _newPhId;
  int? _shId;
  String? _newMobName;
  int? _newMobMod;
  int? _newMobRam;
  int? _newMobRom;
  int? _newMobPrice;
  String? _newMobilePta;
  String? _newMobImg;
GetAllNewMobile copyWith({  int? newPhId,
  int? shId,
  String? newMobName,
  int? newMobMod,
  int? newMobRam,
  int? newMobRom,
  int? newMobPrice,
  String? newMobilePta,
  String? newMobImg,
}) => GetAllNewMobile(  newPhId: newPhId ?? _newPhId,
  shId: shId ?? _shId,
  newMobName: newMobName ?? _newMobName,
  newMobMod: newMobMod ?? _newMobMod,
  newMobRam: newMobRam ?? _newMobRam,
  newMobRom: newMobRom ?? _newMobRom,
  newMobPrice: newMobPrice ?? _newMobPrice,
  newMobilePta: newMobilePta ?? _newMobilePta,
  newMobImg: newMobImg ?? _newMobImg,
);
  int? get newPhId => _newPhId;
  int? get shId => _shId;
  String? get newMobName => _newMobName;
  int? get newMobMod => _newMobMod;
  int? get newMobRam => _newMobRam;
  int? get newMobRom => _newMobRom;
  int? get newMobPrice => _newMobPrice;
  String? get newMobilePta => _newMobilePta;
  String? get newMobImg => _newMobImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['new_ph_id'] = _newPhId;
    map['sh_id'] = _shId;
    map['new_mob_name'] = _newMobName;
    map['new_mob_mod'] = _newMobMod;
    map['new_mob_ram'] = _newMobRam;
    map['new_mob_rom'] = _newMobRom;
    map['new_mob_price'] = _newMobPrice;
    map['new_mobile_pta'] = _newMobilePta;
    map['new_mob_img'] = _newMobImg;
    return map;
  }

}