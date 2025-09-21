import 'dart:convert';

import 'employee_model.dart';

class EmployeeSubDetailModel {
  // Nhân viên bán hàng:
  EmployeeModel? employee;

  // Nhân viên kỹ thuật
  EmployeeModel? technical;

  // Nhân viên CDPK
  EmployeeModel? cdpk;

  // Nhân viên thu ngân
  EmployeeModel? cashier;

  // Quản lý cửa hàng
  EmployeeModel? manager;

  // Trợ lý cửa hàng
  EmployeeModel? assistant;

  // Tiếp đón khách hàng
  EmployeeModel? receptionist;

  // Nhân viên giao hàng
  EmployeeModel? delivery;

  EmployeeSubDetailModel({
    this.employee,
    this.technical,
    this.cdpk,
    this.cashier,
    this.manager,
    this.assistant,
    this.receptionist,
    this.delivery,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['employee'] = employee?.toJson();
    data['technical'] = technical?.toJson();
    data['cdpk'] = cdpk?.toJson();
    data['cashier'] = cashier?.toJson();
    data['manager'] = manager?.toJson();
    data['assistant'] = assistant?.toJson();
    data['receptionist'] = receptionist?.toJson();
    data['delivery'] = delivery?.toJson();

    return data;
  }

  EmployeeSubDetailModel.fromJson(Map<String, dynamic> json) {
    employee = json['employee'] != null
        ? EmployeeModel.fromJson(json['employee'])
        : null;
    technical = json['technical'] != null
        ? EmployeeModel.fromJson(json['technical'])
        : null;
    cdpk = json['cdpk'] != null ? EmployeeModel.fromJson(json['cdpk']) : null;
    cashier = json['cashier'] != null
        ? EmployeeModel.fromJson(json['cashier'])
        : null;
    manager = json['manager'] != null
        ? EmployeeModel.fromJson(json['manager'])
        : null;
    assistant = json['assistant'] != null
        ? EmployeeModel.fromJson(json['assistant'])
        : null;
    receptionist = json['receptionist'] != null
        ? EmployeeModel.fromJson(json['receptionist'])
        : null;
    delivery = json['delivery'] != null
        ? EmployeeModel.fromJson(json['delivery'])
        : null;
  }

  EmployeeSubDetailModel toModel(String value) {
    final res = jsonDecode(value);
    return EmployeeSubDetailModel.fromJson(res);
  }

  EmployeeSubDetailModel copyWith({
    EmployeeModel? employee,
    EmployeeModel? technical,
    EmployeeModel? cdpk,
    EmployeeModel? cashier,
    EmployeeModel? manager,
    EmployeeModel? assistant,
    EmployeeModel? receptionist,
    EmployeeModel? delivery,
  }) {
    return EmployeeSubDetailModel(
      employee: employee ?? this.employee,
      technical: technical ?? this.technical,
      cdpk: cdpk ?? this.cdpk,
      cashier: cashier ?? this.cashier,
      manager: manager ?? this.manager,
      assistant: assistant ?? this.assistant,
      receptionist: receptionist ?? this.receptionist,
      delivery: delivery ?? this.delivery,
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

extension EmployeeSubDetailModelExtension on EmployeeSubDetailModel {
  bool get isEmpty =>
      employee == null &&
      technical == null &&
      cdpk == null &&
      cashier == null &&
      manager == null &&
      assistant == null &&
      receptionist == null &&
      delivery == null;

  EmployeeSubDetailModel updateEmployee({EmployeeModel? employee}) {
    return copyWith(employee: employee);
  }

  EmployeeSubDetailModel updateTechnical({EmployeeModel? technical}) {
    return copyWith(technical: technical);
  }

  EmployeeSubDetailModel updateCdpk({EmployeeModel? cdpk}) {
    return copyWith(cdpk: cdpk);
  }

  EmployeeSubDetailModel updateCashier({EmployeeModel? cashier}) {
    return copyWith(cashier: cashier);
  }

  EmployeeSubDetailModel updateManager({EmployeeModel? manager}) {
    return copyWith(manager: manager);
  }

  EmployeeSubDetailModel updateAssistant({EmployeeModel? assistant}) {
    return copyWith(assistant: assistant);
  }

  EmployeeSubDetailModel updateReceptionist({EmployeeModel? receptionist}) {
    return copyWith(receptionist: receptionist);
  }

  EmployeeSubDetailModel updateDelivery({EmployeeModel? delivery}) {
    return copyWith(delivery: delivery);
  }

  Map<String, dynamic> formatEmployeeSubDetailCreateBill() {
    return {
      "saleId": employee?.id,
      "technicalId": technical?.id,
      "accessoryStaffId": cdpk?.id,
      "cashierId": cashier?.id,
      "managerId": manager?.id,
      "assistantId": assistant?.id,
      "shipperId": delivery?.id,
      "receptionistId": receptionist?.id,
    };
  }
}
