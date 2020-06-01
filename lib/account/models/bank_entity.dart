class BankEntity {
  int id;
  String bankName;
  String firstLetter;

  BankEntity({this.id, this.bankName, this.firstLetter});

  BankEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
    firstLetter = json['first_letter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_name'] = this.bankName;
    data['first_letter'] = this.firstLetter;
    return data;
  }
}
