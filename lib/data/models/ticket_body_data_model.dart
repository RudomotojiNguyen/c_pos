class TicketBodyDataModel {
  String? point;

  String? phoneNumberReceive;
  String? phoneNumberTransfer;
  String? billNumber;
  String? orderId;

  String? phoneNumberNew;
  String? phoneNumberOld;

  TicketBodyDataModel({
    this.point,
    this.phoneNumberReceive,
    this.phoneNumberTransfer,
    this.billNumber,
    this.orderId,
    this.phoneNumberNew,
    this.phoneNumberOld,
  });

  TicketBodyDataModel.fromJson(Map<String, dynamic> json) {
    point = json['point']?.toString();
    phoneNumberReceive = json['phoneNumberReceive'];
    phoneNumberTransfer = json['phoneNumberTransfer'];
    billNumber = json['billNumber']?.toString();
    orderId = json['orderId']?.toString();
    phoneNumberNew = json['phoneNumberNew'];
    phoneNumberOld = json['phoneNumberOld'];
  }
}
