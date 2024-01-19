Map input = {}; // vstupní data

List<Group> groups = [
  Group(
    name: "Souseství 1",
    members: [
      Member(
        name: "Jan Novák",
        address: "Vodičkova 123/4 Praha 3",
        phone: "+420 123 456 789",
        type: MemberType.consumer,
        ean: "123456789",
      ),
    ],
  ),
];

class Group {
  String name;
  List<Member> members;

  static Group fromJson(Map<String, dynamic> json) {
    return Group(
      name: json["name"],
      members: (json["members"] as List<dynamic>)
          .map((e) => Member.fromJson(e))
          .toList(),
    );
  }

  Group({
    required this.name,
    required this.members,
  });
}

class Member {
  String name; // Pavel Novák
  String address; // Vodičkova 123/4 Praha 3
  String phone; // +420 123 456 789
  MemberType type; // v jsonu string - "producer" / "consumer"
  String ean; // EAN elektroměru

  static Member fromJson(Map<String, dynamic> json) {
    return Member(
      name: json["name"],
      address: json["address"],
      phone: json["phone"],
      type: json["type"] == "producer"
          ? MemberType.producer
          : MemberType.consumer,
      ean: json["ean"],
    );
  }

  Member({
    required this.name,
    required this.address,
    required this.phone,
    required this.type,
    required this.ean,
  });
}

enum MemberType { producer, consumer }

void loadData() {
  for (Map<String, dynamic> group in input["groups"]) {
    groups.add(Group.fromJson(group));
  }
}
