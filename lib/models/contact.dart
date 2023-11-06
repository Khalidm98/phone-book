class Contact {
  int? id;
  String? name;
  String? phone;
  String? avatar;

  Contact({
    this.id,
    this.name,
    this.phone,
    this.avatar,
  });

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'phone': phone,
      'avatar': avatar,
    };
    map.removeWhere((_, value) => value == null);
    return map;
  }
}
