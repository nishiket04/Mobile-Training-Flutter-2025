class LogOutTruLotModel {
  Null? _data;
  Meta? _meta;
  Null? _error;

  LogOutTruLotModel({Null? data, Meta? meta, Null? error}) {
    if (data != null) {
      this._data = data;
    }
    if (meta != null) {
      this._meta = meta;
    }
    if (error != null) {
      this._error = error;
    }
  }

  Null? get data => _data;
  set data(Null? data) => _data = data;
  Meta? get meta => _meta;
  set meta(Meta? meta) => _meta = meta;
  Null? get error => _error;
  set error(Null? error) => _error = error;

  LogOutTruLotModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'];
    _meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    _error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this._data;
    if (this._meta != null) {
      data['meta'] = this._meta!.toJson();
    }
    data['error'] = this._error;
    return data;
  }
}

class Meta {
  String? _message;
  String? _url;

  Meta({String? message, String? url}) {
    if (message != null) {
      this._message = message;
    }
    if (url != null) {
      this._url = url;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  String? get url => _url;
  set url(String? url) => _url = url;

  Meta.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    data['url'] = this._url;
    return data;
  }
}
