class Address {
  final String? street;
  final String? city;
  final String? suite;
  final String? zipcode;

  Address(
      {required this.city,
      required this.suite,
      required this.street,
      required this.zipcode});

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    return Address(
      city: parsedJson['city'],
      street: parsedJson['street'],
      zipcode: parsedJson['zipcode'],
      suite: parsedJson['suite'],
    );
  }
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> pJson) {
    return Company(
      name: pJson['name'],
      catchPhrase: pJson['catchPhrase'],
      bs: pJson['bs'],
    );
  }
}

class Model {
  final int id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  Model({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.company,
    required this.phone,
    required this.website,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }
}
