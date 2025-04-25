class UserDetailsModel {
  String? _message;
  Data? _data;

  UserDetailsModel({String? message, Data? data}) {
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

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  String? _sId;
  String? _sFullName;
  String? _sEmail;
  String? _eLoginMethod;
  int? _nPhoneNumber;
  String? _sProfileImage;

  Data({
    String? sId,
    String? sFullName,
    String? sEmail,
    String? eLoginMethod,
    int? nPhoneNumber,
    String? sProfileImage,
  }) {
    if (sId != null) {
      this._sId = sId;
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
    if (nPhoneNumber != null) {
      this._nPhoneNumber = nPhoneNumber;
    }
    if (sProfileImage != null) {
      this._sProfileImage = sProfileImage;
    }
  }

  String? get sId => _sId;

  set sId(String? sId) => _sId = sId;

  String? get sFullName => _sFullName;

  set sFullName(String? sFullName) => _sFullName = sFullName;

  String? get sEmail => _sEmail;

  set sEmail(String? sEmail) => _sEmail = sEmail;

  String? get eLoginMethod => _eLoginMethod;

  set eLoginMethod(String? eLoginMethod) => _eLoginMethod = eLoginMethod;

  int? get nPhoneNumber => _nPhoneNumber;

  set nPhoneNumber(int? nPhoneNumber) => _nPhoneNumber = nPhoneNumber;

  String? get sProfileImage => _sProfileImage;

  set sProfileImage(String? sProfileImage) => _sProfileImage = sProfileImage;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _sFullName = json['sFullName'];
    _sEmail = json['sEmail'];
    _eLoginMethod = json['eLoginMethod'];
    _nPhoneNumber = json['nPhoneNumber'];
    _sProfileImage = json['sProfileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = this._sId;
    data['sFullName'] = this._sFullName;
    data['sEmail'] = this._sEmail;
    data['eLoginMethod'] = this._eLoginMethod;
    data['nPhoneNumber'] = this._nPhoneNumber;
    data['sProfileImage'] = this._sProfileImage;
    return data;
  }
}
