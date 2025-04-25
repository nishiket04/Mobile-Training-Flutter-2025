class SignupModel {
  String? _message;
  Data? _data;

  SignupModel({String? message, Data? data}) {
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  SignupModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  String? _sId;
  String? _sToken;
  String? _sFullName;
  String? _sEmail;
  String? _eLoginMethod;

  Data(
      {String? sId,
        String? sToken,
        String? sFullName,
        String? sEmail,
        String? eLoginMethod}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (sToken != null) {
      this._sToken = sToken;
    }
    if (sFullName != null) {
      this._sFullName = sFullName;
    }
    if (sEmail != null) {
      this._sEmail = sEmail;
    }
    if (eLoginMethod != null) {
      this._eLoginMethod = eLoginMethod;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get sToken => _sToken;
  set sToken(String? sToken) => _sToken = sToken;
  String? get sFullName => _sFullName;
  set sFullName(String? sFullName) => _sFullName = sFullName;
  String? get sEmail => _sEmail;
  set sEmail(String? sEmail) => _sEmail = sEmail;
  String? get eLoginMethod => _eLoginMethod;
  set eLoginMethod(String? eLoginMethod) => _eLoginMethod = eLoginMethod;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _sToken = json['sToken'];
    _sFullName = json['sFullName'];
    _sEmail = json['sEmail'];
    _eLoginMethod = json['eLoginMethod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = this._sId;
    data['sToken'] = this._sToken;
    data['sFullName'] = this._sFullName;
    data['sEmail'] = this._sEmail;
    data['eLoginMethod'] = this._eLoginMethod;
    return data;
  }
}
