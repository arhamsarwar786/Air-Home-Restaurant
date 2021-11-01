class ContactsModel {
  String name;

  String phone;

  ContactsModel(this.name, this.phone);

  Map toJson() =>
      {
        'name': name,
        'phone': phone,
      };
}