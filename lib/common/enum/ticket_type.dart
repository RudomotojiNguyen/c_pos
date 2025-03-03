enum TicketType {
  none,
  pointTransfer,
  phoneNumberChange,
  addOrderForBill,
  storePO,
}

extension TicketTypeExtension on TicketType {
  static Map<String, TicketType> mapTicketType = {
    'POINT_TRANSFER': TicketType.pointTransfer,
    'PHONE_NUMBER_CHANGE': TicketType.phoneNumberChange,
    'ADD_ORDER_FOR_BILL': TicketType.addOrderForBill,
    'STORE_PO': TicketType.storePO,
  };
}
