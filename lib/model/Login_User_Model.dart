/// user : {"s_id":1,"own_name":"Roomi","shp_name":"Roomi Mobile Center","ph_no":3247528449,"pass_word":123456}
/// error : 200
/// message : "login success"

class LoginUserModel {
  LoginUserModel({
      User? user, 
      int? error, 
      String? message,}){
    _user = user;
    _error = error;
    _message = message;
}

  LoginUserModel.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _error = json['error'];
    _message = json['message'];
  }
  User? _user;
  int? _error;
  String? _message;
LoginUserModel copyWith({  User? user,
  int? error,
  String? message,
}) => LoginUserModel(  user: user ?? _user,
  error: error ?? _error,
  message: message ?? _message,
);
  User? get user => _user;
  int? get error => _error;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['error'] = _error;
    map['message'] = _message;
    return map;
  }

}

/// s_id : 1
/// own_name : "Roomi"
/// shp_name : "Roomi Mobile Center"
/// ph_no : 3247528449
/// pass_word : 123456

class User {
  User({
      int? sId, 
      String? ownName, 
      String? shpName, 
      int? phNo, 
      int? passWord,}){
    _sId = sId;
    _ownName = ownName;
    _shpName = shpName;
    _phNo = phNo;
    _passWord = passWord;
}

  User.fromJson(dynamic json) {
    _sId = json['s_id'];
    _ownName = json['own_name'];
    _shpName = json['shp_name'];
    _phNo = json['ph_no'];
    _passWord = json['pass_word'];
  }
  int? _sId;
  String? _ownName;
  String? _shpName;
  int? _phNo;
  int? _passWord;
User copyWith({  int? sId,
  String? ownName,
  String? shpName,
  int? phNo,
  int? passWord,
}) => User(  sId: sId ?? _sId,
  ownName: ownName ?? _ownName,
  shpName: shpName ?? _shpName,
  phNo: phNo ?? _phNo,
  passWord: passWord ?? _passWord,
);
  int? get sId => _sId;
  String? get ownName => _ownName;
  String? get shpName => _shpName;
  int? get phNo => _phNo;
  int? get passWord => _passWord;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['s_id'] = _sId;
    map['own_name'] = _ownName;
    map['shp_name'] = _shpName;
    map['ph_no'] = _phNo;
    map['pass_word'] = _passWord;
    return map;
  }

}