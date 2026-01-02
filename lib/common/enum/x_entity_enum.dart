enum XEntityEnum {
  bills,
  transactions,
  billsInvoices,
  purchaseOrders,
  orders,
  stockSlips,
  evaluationTrade,
  importTradeIn,
}

extension XEntityEnumExtension on XEntityEnum {
  static const Map<XEntityEnum, String> map = {
    XEntityEnum.bills: 'bills',
    XEntityEnum.transactions: 'transactions',
    XEntityEnum.billsInvoices: 'bills-invoices',
    XEntityEnum.purchaseOrders: 'purchase-orders',
    XEntityEnum.orders: 'orders',
    XEntityEnum.stockSlips: 'stock-slips',
    XEntityEnum.evaluationTrade: 'evaluation-trade',
    XEntityEnum.importTradeIn: 'import-trade-in',
  };

  String get getValue => map[this] ?? '';
}
