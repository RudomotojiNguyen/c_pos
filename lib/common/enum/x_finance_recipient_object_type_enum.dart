enum XFinanceRecipientObjectTypeEnum { financeExternal, financeInternal, none }

extension XFinanceRecipientObjectTypeEnumExtension
    on XFinanceRecipientObjectTypeEnum {
  static const Map<String, XFinanceRecipientObjectTypeEnum> map = {
    'finance_external': XFinanceRecipientObjectTypeEnum.financeExternal,
    'finance_internal': XFinanceRecipientObjectTypeEnum.financeInternal,
  };

  String get getValue {
    return map.entries.firstWhere((entry) => entry.value == this).key;
  }
}
