class LogInTruLotModel {
  Data? _data;
  Meta? _meta;
  Null? _error;

  LogInTruLotModel({Data? data, Meta? meta, Null? error}) {
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

  Data? get data => _data;
  set data(Data? data) => _data = data;
  Meta? get meta => _meta;
  set meta(Meta? meta) => _meta = meta;
  Null? get error => _error;
  set error(Null? error) => _error = error;

  LogInTruLotModel.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    _error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    if (this._meta != null) {
      data['meta'] = this._meta!.toJson();
    }
    data['error'] = this._error;
    return data;
  }
}

class Data {
  String? _id;
  String? _name;
  String? _type;
  Contact? _contact;
  Contact? _alternativeContact;
  String? _vehicalType;
  String? _profile;
  bool? _canDriveOnHills;
  int? _experience;
  Null? _requiredSleep;
  String? _dateOfBirth;
  Licence? _licence;
  Null? _bankAccount;
  Coordination? _coordination;
  Hubs? _hubs;
  String? _language;

  Data(
      {String? id,
        String? name,
        String? type,
        Contact? contact,
        Contact? alternativeContact,
        String? vehicalType,
        String? profile,
        bool? canDriveOnHills,
        int? experience,
        Null? requiredSleep,
        String? dateOfBirth,
        Licence? licence,
        Null? bankAccount,
        Coordination? coordination,
        Hubs? hubs,
        String? language}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (type != null) {
      this._type = type;
    }
    if (contact != null) {
      this._contact = contact;
    }
    if (alternativeContact != null) {
      this._alternativeContact = alternativeContact;
    }
    if (vehicalType != null) {
      this._vehicalType = vehicalType;
    }
    if (profile != null) {
      this._profile = profile;
    }
    if (canDriveOnHills != null) {
      this._canDriveOnHills = canDriveOnHills;
    }
    if (experience != null) {
      this._experience = experience;
    }
    if (requiredSleep != null) {
      this._requiredSleep = requiredSleep;
    }
    if (dateOfBirth != null) {
      this._dateOfBirth = dateOfBirth;
    }
    if (licence != null) {
      this._licence = licence;
    }
    if (bankAccount != null) {
      this._bankAccount = bankAccount;
    }
    if (coordination != null) {
      this._coordination = coordination;
    }
    if (hubs != null) {
      this._hubs = hubs;
    }
    if (language != null) {
      this._language = language;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get type => _type;
  set type(String? type) => _type = type;
  Contact? get contact => _contact;
  set contact(Contact? contact) => _contact = contact;
  Contact? get alternativeContact => _alternativeContact;
  set alternativeContact(Contact? alternativeContact) =>
      _alternativeContact = alternativeContact;
  String? get vehicalType => _vehicalType;
  set vehicalType(String? vehicalType) => _vehicalType = vehicalType;
  String? get profile => _profile;
  set profile(String? profile) => _profile = profile;
  bool? get canDriveOnHills => _canDriveOnHills;
  set canDriveOnHills(bool? canDriveOnHills) =>
      _canDriveOnHills = canDriveOnHills;
  int? get experience => _experience;
  set experience(int? experience) => _experience = experience;
  Null? get requiredSleep => _requiredSleep;
  set requiredSleep(Null? requiredSleep) => _requiredSleep = requiredSleep;
  String? get dateOfBirth => _dateOfBirth;
  set dateOfBirth(String? dateOfBirth) => _dateOfBirth = dateOfBirth;
  Licence? get licence => _licence;
  set licence(Licence? licence) => _licence = licence;
  Null? get bankAccount => _bankAccount;
  set bankAccount(Null? bankAccount) => _bankAccount = bankAccount;
  Coordination? get coordination => _coordination;
  set coordination(Coordination? coordination) => _coordination = coordination;
  Hubs? get hubs => _hubs;
  set hubs(Hubs? hubs) => _hubs = hubs;
  String? get language => _language;
  set language(String? language) => _language = language;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
    _contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    _alternativeContact = json['alternative_contact'] != null
        ? new Contact.fromJson(json['alternative_contact'])
        : null;
    _vehicalType = json['vehical_type'];
    _profile = json['profile'];
    _canDriveOnHills = json['can_drive_on_hills'];
    _experience = json['experience'];
    _requiredSleep = json['required_sleep'];
    _dateOfBirth = json['date_of_birth'];
    _licence =
    json['licence'] != null ? new Licence.fromJson(json['licence']) : null;
    _bankAccount = json['bank_account'];
    _coordination = json['coordination'] != null
        ? new Coordination.fromJson(json['coordination'])
        : null;
    _hubs = json['hubs'] != null ? new Hubs.fromJson(json['hubs']) : null;
    _language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['type'] = this._type;
    if (this._contact != null) {
      data['contact'] = this._contact!.toJson();
    }
    if (this._alternativeContact != null) {
      data['alternative_contact'] = this._alternativeContact!.toJson();
    }
    data['vehical_type'] = this._vehicalType;
    data['profile'] = this._profile;
    data['can_drive_on_hills'] = this._canDriveOnHills;
    data['experience'] = this._experience;
    data['required_sleep'] = this._requiredSleep;
    data['date_of_birth'] = this._dateOfBirth;
    if (this._licence != null) {
      data['licence'] = this._licence!.toJson();
    }
    data['bank_account'] = this._bankAccount;
    if (this._coordination != null) {
      data['coordination'] = this._coordination!.toJson();
    }
    if (this._hubs != null) {
      data['hubs'] = this._hubs!.toJson();
    }
    data['language'] = this._language;
    return data;
  }
}

class Contact {
  String? _countryCode;
  String? _phoneCode;
  String? _number;

  Contact({String? countryCode, String? phoneCode, String? number}) {
    if (countryCode != null) {
      this._countryCode = countryCode;
    }
    if (phoneCode != null) {
      this._phoneCode = phoneCode;
    }
    if (number != null) {
      this._number = number;
    }
  }

  String? get countryCode => _countryCode;
  set countryCode(String? countryCode) => _countryCode = countryCode;
  String? get phoneCode => _phoneCode;
  set phoneCode(String? phoneCode) => _phoneCode = phoneCode;
  String? get number => _number;
  set number(String? number) => _number = number;

  Contact.fromJson(Map<String, dynamic> json) {
    _countryCode = json['country_code'];
    _phoneCode = json['phone_code'];
    _number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this._countryCode;
    data['phone_code'] = this._phoneCode;
    data['number'] = this._number;
    return data;
  }
}

class Licence {
  String? _id;
  String? _number;
  String? _expiry;
  String? _type;

  Licence({String? id, String? number, String? expiry, String? type}) {
    if (id != null) {
      this._id = id;
    }
    if (number != null) {
      this._number = number;
    }
    if (expiry != null) {
      this._expiry = expiry;
    }
    if (type != null) {
      this._type = type;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get number => _number;
  set number(String? number) => _number = number;
  String? get expiry => _expiry;
  set expiry(String? expiry) => _expiry = expiry;
  String? get type => _type;
  set type(String? type) => _type = type;

  Licence.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _number = json['number'];
    _expiry = json['expiry'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['number'] = this._number;
    data['expiry'] = this._expiry;
    data['type'] = this._type;
    return data;
  }
}

class Coordination {
  String? _id;
  String? _name;
  Contact? _contact;
  Contact? _alternativeContact;
  String? _profile;
  String? _email;

  Coordination(
      {String? id,
        String? name,
        Contact? contact,
        Contact? alternativeContact,
        String? profile,
        String? email}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (contact != null) {
      this._contact = contact;
    }
    if (alternativeContact != null) {
      this._alternativeContact = alternativeContact;
    }
    if (profile != null) {
      this._profile = profile;
    }
    if (email != null) {
      this._email = email;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  Contact? get contact => _contact;
  set contact(Contact? contact) => _contact = contact;
  Contact? get alternativeContact => _alternativeContact;
  set alternativeContact(Contact? alternativeContact) =>
      _alternativeContact = alternativeContact;
  String? get profile => _profile;
  set profile(String? profile) => _profile = profile;
  String? get email => _email;
  set email(String? email) => _email = email;

  Coordination.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    _alternativeContact = json['alternative_contact'] != null
        ? new Contact.fromJson(json['alternative_contact'])
        : null;
    _profile = json['profile'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    if (this._contact != null) {
      data['contact'] = this._contact!.toJson();
    }
    if (this._alternativeContact != null) {
      data['alternative_contact'] = this._alternativeContact!.toJson();
    }
    data['profile'] = this._profile;
    data['email'] = this._email;
    return data;
  }
}

class Hubs {
  Null? _home;
  Null? _second;

  Hubs({Null? home, Null? second}) {
    if (home != null) {
      this._home = home;
    }
    if (second != null) {
      this._second = second;
    }
  }

  Null? get home => _home;
  set home(Null? home) => _home = home;
  Null? get second => _second;
  set second(Null? second) => _second = second;

  Hubs.fromJson(Map<String, dynamic> json) {
    _home = json['home'];
    _second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home'] = this._home;
    data['second'] = this._second;
    return data;
  }
}

class Meta {
  String? _url;
  String? _message;

  Meta({String? url, String? message}) {
    if (url != null) {
      this._url = url;
    }
    if (message != null) {
      this._message = message;
    }
  }

  String? get url => _url;
  set url(String? url) => _url = url;
  String? get message => _message;
  set message(String? message) => _message = message;

  Meta.fromJson(Map<String, dynamic> json) {
    _url = json['url'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this._url;
    data['message'] = this._message;
    return data;
  }
}
