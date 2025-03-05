import '../../presentation/utils/utils.dart';

class CommissionDetailModel {
  String? fullName;
  int? jobTitleId;
  String? jobTitleName;
  String? fromDate;
  String? toDate;
  double? totalSalesPoints;
  double? totalRefundPoints;
  double? totalPoints;
  List<CommissionBillModel>? bills;
  List<CommissionBillModel>? billRefunds;

  CommissionDetailModel(
      {this.fullName,
      this.jobTitleId,
      this.jobTitleName,
      this.fromDate,
      this.toDate,
      this.totalSalesPoints,
      this.totalRefundPoints,
      this.totalPoints,
      this.bills,
      this.billRefunds});

  CommissionDetailModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    jobTitleId = json['jobTitleId'];
    jobTitleName = json['jobTitleName'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    totalSalesPoints = Utils.toDouble(json['totalSalesPoints']);
    totalRefundPoints = Utils.toDouble(json['totalRefundPoints']);
    totalPoints = Utils.toDouble(json['totalPoints']);
    if (json['bills'] != null) {
      bills = <CommissionBillModel>[];
      json['bills'].forEach((v) {
        bills!.add(CommissionBillModel.fromJson(v));
      });
    }
    if (json['billRefunds'] != null) {
      billRefunds = <CommissionBillModel>[];
      json['billRefunds'].forEach((v) {
        billRefunds!.add(CommissionBillModel.fromJson(v));
      });
    }
  }

  double get getTotalPoints => totalPoints ?? 0;
}

class CommissionBillModel {
  String? id; // id bill (uuid)
  int? billNumber;
  String? relatedBillId; // id bill liên quan (uuid)
  String? productId;
  String? productName;
  double? rewardPoint; //hoa hồng của SP (SL 1)
  int? quantity; // số lượng SP
  double?
      point; // hoa hồng sau khi nhân số lượng (BE đã tính: rewardPoint * quantity)

  CommissionBillModel({
    this.id,
    this.billNumber,
    this.relatedBillId,
    this.productId,
    this.productName,
    this.rewardPoint,
    this.quantity,
    this.point,
  });

  CommissionBillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billNumber = json['billNumber'];
    relatedBillId = json['relatedBillId'];
    productId = json['productId'];
    productName = json['productName'];
    rewardPoint = Utils.toDouble(json['rewardPoint']);
    quantity = json['quantity'];
    point = Utils.toDouble(json['point']);
  }

  double get getProductAmount => rewardPoint ?? 0;

  double get getTotalAmount => point ?? 0;

  String get getName => productName ?? '';

  int get getQuantity => quantity ?? 1;
}
