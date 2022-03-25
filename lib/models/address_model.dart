class AddressModel {
  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String? _contactPersonNumber;
  late String? _address;
  late String? _latitude;
  late String? _longitude;

  AddressModel({
    id,
    required addressType,
    contactPersonName,
    contactPersonNumber,
    address,
    latitude,
    longitude,
  }) {
    _id = id;
    _addressType = addressType;
    _contactPersonName = contactPersonName;
    _contactPersonNumber = contactPersonNumber;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
  }

  String get address => _address!;
  String get addressType => _addressType;
  String get contactPersonName => _contactPersonName!;
  String get contactPersonNumber => _contactPersonNumber!;
  String get latitude => _latitude!;
  String get longitude => _longitude!;

  AddressModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _addressType = json['address_type'];
    _contactPersonName = json['contact_person_name'];
    _contactPersonNumber = json['_contact_person_number'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['address_type'] = _addressType;
    data['contact_person_name'] = _contactPersonName;
    data['contact_person_number'] = _contactPersonNumber;
    data['latitude'] = _latitude;
    data['longitude'] = _longitude;
    data['address'] = _address;
    return data;
  }
}
