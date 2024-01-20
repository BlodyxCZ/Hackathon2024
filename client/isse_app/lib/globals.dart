const String apiUrl = "localhost:5024";

List<Location> locatitons = [
  Location(
    id: 1,
    memberOwner: MemberOwner(
      id: 2,
      firstName: "Lukáš",
      lastName: "Moravec",
      phoneNumber: "123456789",
      idCardNumber: "162O832163",
    ),
    address: Address(
      street: "Moskevská",
      code: "124",
      postalCode: "40747",
      city: "Česká Lípa",
      region: "Liberecký kraj",
    ),
    latitude: 51.2930283,
    longtitude: 14.12398012,
  ),
  Location(
    id: 1,
    memberOwner: MemberOwner(
      id: 2,
      firstName: "Lukáš",
      lastName: "Slezák",
      phoneNumber: "123456789",
      idCardNumber: "162O832163",
    ),
    address: Address(
      street: "Moskevská",
      code: "124",
      postalCode: "40747",
      city: "Česká Lípa",
      region: "Liberecký kraj",
    ),
    latitude: 51.2930283,
    longtitude: 14.12398012,
  ),
  Location(
    id: 2,
    memberOwner: MemberOwner(
      id: 1,
      firstName: "David",
      lastName: "Vobruba",
      phoneNumber: "987654321",
      idCardNumber: "718973912",
    ),
    address: Address(
      street: "Dobiášova",
      code: "855",
      postalCode: "46006",
      city: "Liberec",
      region: "Liberecký kraj",
    ),
    latitude: 51.2920483,
    longtitude: 14.22398012,
  ),
];

class Address {
  String street; //ulice Moskevská
  String code; //č. domu 124
  String postalCode; //PSČ 40747
  String city; //město Česká Lípa
  String region; //kraj Ústecký kraj

  Address({
    required this.street,
    required this.code,
    required this.postalCode,
    required this.city,
    required this.region,
  });
}

class LocationData {}

class Location {
  int id;
  MemberOwner memberOwner;
  Address address;
  double latitude;
  double longtitude;
  LocationData? locationData;

  Location({
    required this.id,
    required this.memberOwner,
    required this.address,
    required this.latitude,
    required this.longtitude,
    this.locationData,
  });
}

class MemberOwner {
  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String idCardNumber;

  MemberOwner({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.idCardNumber,
  });
}
