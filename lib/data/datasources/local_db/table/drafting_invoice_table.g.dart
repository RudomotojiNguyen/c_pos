// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drafting_invoice_table.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDraftingInvoiceTableCollection on Isar {
  IsarCollection<DraftingInvoiceTable> get draftingInvoiceTables =>
      this.collection();
}

const DraftingInvoiceTableSchema = CollectionSchema(
  name: r'DraftingInvoiceTable',
  id: -5766724932029116372,
  properties: {
    r'billId': PropertySchema(
      id: 0,
      name: r'billId',
      type: IsarType.string,
    ),
    r'billNumber': PropertySchema(
      id: 1,
      name: r'billNumber',
      type: IsarType.long,
    ),
    r'couponDiscountCode': PropertySchema(
      id: 2,
      name: r'couponDiscountCode',
      type: IsarType.string,
    ),
    r'createdDate': PropertySchema(
      id: 3,
      name: r'createdDate',
      type: IsarType.dateTime,
    ),
    r'customerNote': PropertySchema(
      id: 4,
      name: r'customerNote',
      type: IsarType.string,
    ),
    r'customerOtp': PropertySchema(
      id: 5,
      name: r'customerOtp',
      type: IsarType.string,
    ),
    r'deliveryFeeStr': PropertySchema(
      id: 6,
      name: r'deliveryFeeStr',
      type: IsarType.string,
    ),
    r'discountMemberType': PropertySchema(
      id: 7,
      name: r'discountMemberType',
      type: IsarType.byte,
      enumMap: _DraftingInvoiceTablediscountMemberTypeEnumValueMap,
    ),
    r'discountTotalBill': PropertySchema(
      id: 8,
      name: r'discountTotalBill',
      type: IsarType.double,
    ),
    r'employeeSubDetailStr': PropertySchema(
      id: 9,
      name: r'employeeSubDetailStr',
      type: IsarType.string,
    ),
    r'isCountPoint': PropertySchema(
      id: 10,
      name: r'isCountPoint',
      type: IsarType.bool,
    ),
    r'isDefaultInfo': PropertySchema(
      id: 11,
      name: r'isDefaultInfo',
      type: IsarType.bool,
    ),
    r'isEstimateCost': PropertySchema(
      id: 12,
      name: r'isEstimateCost',
      type: IsarType.bool,
    ),
    r'isSoldByCompany': PropertySchema(
      id: 13,
      name: r'isSoldByCompany',
      type: IsarType.bool,
    ),
    r'method': PropertySchema(
      id: 14,
      name: r'method',
      type: IsarType.bool,
    ),
    r'orderId': PropertySchema(
      id: 15,
      name: r'orderId',
      type: IsarType.long,
    ),
    r'orderSubDetailStr': PropertySchema(
      id: 16,
      name: r'orderSubDetailStr',
      type: IsarType.string,
    ),
    r'preOrderId': PropertySchema(
      id: 17,
      name: r'preOrderId',
      type: IsarType.long,
    ),
    r'productImei': PropertySchema(
      id: 18,
      name: r'productImei',
      type: IsarType.string,
    ),
    r'saleNote': PropertySchema(
      id: 19,
      name: r'saleNote',
      type: IsarType.string,
    ),
    r'storeStr': PropertySchema(
      id: 20,
      name: r'storeStr',
      type: IsarType.string,
    ),
    r'tradeInType': PropertySchema(
      id: 21,
      name: r'tradeInType',
      type: IsarType.byte,
      enumMap: _DraftingInvoiceTabletradeInTypeEnumValueMap,
    ),
    r'typeCart': PropertySchema(
      id: 22,
      name: r'typeCart',
      type: IsarType.byte,
      enumMap: _DraftingInvoiceTabletypeCartEnumValueMap,
    ),
    r'vatChecked': PropertySchema(
      id: 23,
      name: r'vatChecked',
      type: IsarType.bool,
    ),
    r'warrantyNote': PropertySchema(
      id: 24,
      name: r'warrantyNote',
      type: IsarType.string,
    )
  },
  estimateSize: _draftingInvoiceTableEstimateSize,
  serialize: _draftingInvoiceTableSerialize,
  deserialize: _draftingInvoiceTableDeserialize,
  deserializeProp: _draftingInvoiceTableDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'customer': LinkSchema(
      id: 8433360668942239306,
      name: r'customer',
      target: r'CustomerTable',
      single: true,
    ),
    r'products': LinkSchema(
      id: -3939145271577960230,
      name: r'products',
      target: r'ProductTable',
      single: false,
    ),
    r'product': LinkSchema(
      id: -6331165857611544185,
      name: r'product',
      target: r'ProductTable',
      single: true,
    ),
    r'paymentMethods': LinkSchema(
      id: -5823010668766491842,
      name: r'paymentMethods',
      target: r'PaymentMethodTable',
      single: false,
    ),
    r'paymentMethodsPrePay': LinkSchema(
      id: 3669796564787066540,
      name: r'paymentMethodsPrePay',
      target: r'PaymentMethodTable',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _draftingInvoiceTableGetId,
  getLinks: _draftingInvoiceTableGetLinks,
  attach: _draftingInvoiceTableAttach,
  version: '3.1.0+1',
);

int _draftingInvoiceTableEstimateSize(
  DraftingInvoiceTable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.billId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.couponDiscountCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customerOtp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.deliveryFeeStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.employeeSubDetailStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.orderSubDetailStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productImei;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.saleNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.storeStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.warrantyNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _draftingInvoiceTableSerialize(
  DraftingInvoiceTable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.billId);
  writer.writeLong(offsets[1], object.billNumber);
  writer.writeString(offsets[2], object.couponDiscountCode);
  writer.writeDateTime(offsets[3], object.createdDate);
  writer.writeString(offsets[4], object.customerNote);
  writer.writeString(offsets[5], object.customerOtp);
  writer.writeString(offsets[6], object.deliveryFeeStr);
  writer.writeByte(offsets[7], object.discountMemberType.index);
  writer.writeDouble(offsets[8], object.discountTotalBill);
  writer.writeString(offsets[9], object.employeeSubDetailStr);
  writer.writeBool(offsets[10], object.isCountPoint);
  writer.writeBool(offsets[11], object.isDefaultInfo);
  writer.writeBool(offsets[12], object.isEstimateCost);
  writer.writeBool(offsets[13], object.isSoldByCompany);
  writer.writeBool(offsets[14], object.method);
  writer.writeLong(offsets[15], object.orderId);
  writer.writeString(offsets[16], object.orderSubDetailStr);
  writer.writeLong(offsets[17], object.preOrderId);
  writer.writeString(offsets[18], object.productImei);
  writer.writeString(offsets[19], object.saleNote);
  writer.writeString(offsets[20], object.storeStr);
  writer.writeByte(offsets[21], object.tradeInType.index);
  writer.writeByte(offsets[22], object.typeCart.index);
  writer.writeBool(offsets[23], object.vatChecked);
  writer.writeString(offsets[24], object.warrantyNote);
}

DraftingInvoiceTable _draftingInvoiceTableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DraftingInvoiceTable();
  object.billId = reader.readStringOrNull(offsets[0]);
  object.billNumber = reader.readLongOrNull(offsets[1]);
  object.couponDiscountCode = reader.readStringOrNull(offsets[2]);
  object.createdDate = reader.readDateTime(offsets[3]);
  object.customerNote = reader.readStringOrNull(offsets[4]);
  object.customerOtp = reader.readStringOrNull(offsets[5]);
  object.deliveryFeeStr = reader.readStringOrNull(offsets[6]);
  object.discountMemberType =
      _DraftingInvoiceTablediscountMemberTypeValueEnumMap[
              reader.readByteOrNull(offsets[7])] ??
          DiscountMemberType.point;
  object.discountTotalBill = reader.readDoubleOrNull(offsets[8]);
  object.employeeSubDetailStr = reader.readStringOrNull(offsets[9]);
  object.id = id;
  object.isCountPoint = reader.readBoolOrNull(offsets[10]);
  object.isDefaultInfo = reader.readBoolOrNull(offsets[11]);
  object.isEstimateCost = reader.readBoolOrNull(offsets[12]);
  object.isSoldByCompany = reader.readBoolOrNull(offsets[13]);
  object.method = reader.readBoolOrNull(offsets[14]);
  object.orderId = reader.readLongOrNull(offsets[15]);
  object.orderSubDetailStr = reader.readStringOrNull(offsets[16]);
  object.preOrderId = reader.readLongOrNull(offsets[17]);
  object.productImei = reader.readStringOrNull(offsets[18]);
  object.saleNote = reader.readStringOrNull(offsets[19]);
  object.storeStr = reader.readStringOrNull(offsets[20]);
  object.tradeInType = _DraftingInvoiceTabletradeInTypeValueEnumMap[
          reader.readByteOrNull(offsets[21])] ??
      TradeInType.undefine;
  object.typeCart = _DraftingInvoiceTabletypeCartValueEnumMap[
          reader.readByteOrNull(offsets[22])] ??
      CartType.retail;
  object.vatChecked = reader.readBoolOrNull(offsets[23]);
  object.warrantyNote = reader.readStringOrNull(offsets[24]);
  return object;
}

P _draftingInvoiceTableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_DraftingInvoiceTablediscountMemberTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DiscountMemberType.point) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset)) as P;
    case 13:
      return (reader.readBoolOrNull(offset)) as P;
    case 14:
      return (reader.readBoolOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (_DraftingInvoiceTabletradeInTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TradeInType.undefine) as P;
    case 22:
      return (_DraftingInvoiceTabletypeCartValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CartType.retail) as P;
    case 23:
      return (reader.readBoolOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DraftingInvoiceTablediscountMemberTypeEnumValueMap = {
  'point': 0,
  'none': 1,
};
const _DraftingInvoiceTablediscountMemberTypeValueEnumMap = {
  0: DiscountMemberType.point,
  1: DiscountMemberType.none,
};
const _DraftingInvoiceTabletradeInTypeEnumValueMap = {
  'undefine': 0,
  'tradeIn': 1,
  'buyingOldItems': 2,
  'exchangeWarranty': 3,
  'testDevice': 4,
};
const _DraftingInvoiceTabletradeInTypeValueEnumMap = {
  0: TradeInType.undefine,
  1: TradeInType.tradeIn,
  2: TradeInType.buyingOldItems,
  3: TradeInType.exchangeWarranty,
  4: TradeInType.testDevice,
};
const _DraftingInvoiceTabletypeCartEnumValueMap = {
  'retail': 0,
  'updateBill': 1,
  'order': 2,
  'updateOrder': 3,
  'tradeIn': 4,
  'none': 5,
};
const _DraftingInvoiceTabletypeCartValueEnumMap = {
  0: CartType.retail,
  1: CartType.updateBill,
  2: CartType.order,
  3: CartType.updateOrder,
  4: CartType.tradeIn,
  5: CartType.none,
};

Id _draftingInvoiceTableGetId(DraftingInvoiceTable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _draftingInvoiceTableGetLinks(
    DraftingInvoiceTable object) {
  return [
    object.customer,
    object.products,
    object.product,
    object.paymentMethods,
    object.paymentMethodsPrePay
  ];
}

void _draftingInvoiceTableAttach(
    IsarCollection<dynamic> col, Id id, DraftingInvoiceTable object) {
  object.id = id;
  object.customer
      .attach(col, col.isar.collection<CustomerTable>(), r'customer', id);
  object.products
      .attach(col, col.isar.collection<ProductTable>(), r'products', id);
  object.product
      .attach(col, col.isar.collection<ProductTable>(), r'product', id);
  object.paymentMethods.attach(
      col, col.isar.collection<PaymentMethodTable>(), r'paymentMethods', id);
  object.paymentMethodsPrePay.attach(col,
      col.isar.collection<PaymentMethodTable>(), r'paymentMethodsPrePay', id);
}

extension DraftingInvoiceTableQueryWhereSort
    on QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QWhere> {
  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DraftingInvoiceTableQueryWhere
    on QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QWhereClause> {
  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DraftingInvoiceTableQueryFilter on QueryBuilder<DraftingInvoiceTable,
    DraftingInvoiceTable, QFilterCondition> {
  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'billId',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'billId',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'billId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'billId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'billId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'billId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'billId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      billIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'billId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      billIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'billId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billId',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'billId',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'billNumber',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'billNumber',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'billNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'billNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'billNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> billNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'billNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'couponDiscountCode',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'couponDiscountCode',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'couponDiscountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'couponDiscountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'couponDiscountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'couponDiscountCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'couponDiscountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'couponDiscountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      couponDiscountCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'couponDiscountCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      couponDiscountCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'couponDiscountCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'couponDiscountCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> couponDiscountCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'couponDiscountCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> createdDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> createdDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> createdDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> createdDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerNote',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerNote',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      customerNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      customerNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerNote',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerNote',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerOtp',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerOtp',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerOtp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerOtp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerOtp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerOtp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerOtp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerOtp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      customerOtpContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerOtp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      customerOtpMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerOtp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerOtp',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerOtpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerOtp',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveryFeeStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveryFeeStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryFeeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveryFeeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveryFeeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveryFeeStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deliveryFeeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deliveryFeeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      deliveryFeeStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deliveryFeeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      deliveryFeeStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deliveryFeeStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryFeeStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> deliveryFeeStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deliveryFeeStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      discountMemberTypeEqualTo(DiscountMemberType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountMemberType',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> discountMemberTypeGreaterThan(
    DiscountMemberType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountMemberType',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> discountMemberTypeLessThan(
    DiscountMemberType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountMemberType',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> discountMemberTypeBetween(
    DiscountMemberType lower,
    DiscountMemberType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountMemberType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> discountTotalBillIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discountTotalBill',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> discountTotalBillIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discountTotalBill',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> discountTotalBillEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountTotalBill',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> discountTotalBillGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountTotalBill',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> discountTotalBillLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountTotalBill',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> discountTotalBillBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountTotalBill',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'employeeSubDetailStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'employeeSubDetailStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeSubDetailStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'employeeSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'employeeSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      employeeSubDetailStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      employeeSubDetailStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeSubDetailStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeSubDetailStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> employeeSubDetailStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeSubDetailStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isCountPointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCountPoint',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isCountPointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCountPoint',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isCountPointEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCountPoint',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isDefaultInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isDefaultInfo',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isDefaultInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isDefaultInfo',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isDefaultInfoEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefaultInfo',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isEstimateCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isEstimateCost',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isEstimateCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isEstimateCost',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isEstimateCostEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEstimateCost',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isSoldByCompanyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isSoldByCompany',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isSoldByCompanyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isSoldByCompany',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> isSoldByCompanyEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSoldByCompany',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> methodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'method',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> methodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'method',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> methodEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'method',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'orderId',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'orderId',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderId',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderId',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderId',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'orderSubDetailStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'orderSubDetailStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderSubDetailStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'orderSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'orderSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      orderSubDetailStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderSubDetailStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      orderSubDetailStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderSubDetailStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderSubDetailStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> orderSubDetailStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderSubDetailStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> preOrderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'preOrderId',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> preOrderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'preOrderId',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> preOrderIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preOrderId',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> preOrderIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preOrderId',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> preOrderIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preOrderId',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> preOrderIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preOrderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productImei',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productImei',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productImei',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      productImeiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productImei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      productImeiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productImei',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productImei',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productImeiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productImei',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'saleNote',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'saleNote',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saleNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saleNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saleNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saleNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'saleNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'saleNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      saleNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'saleNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      saleNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'saleNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saleNote',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'saleNote',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      storeStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      storeStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> storeStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> tradeInTypeEqualTo(TradeInType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tradeInType',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> tradeInTypeGreaterThan(
    TradeInType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tradeInType',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> tradeInTypeLessThan(
    TradeInType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tradeInType',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> tradeInTypeBetween(
    TradeInType lower,
    TradeInType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tradeInType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> typeCartEqualTo(CartType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeCart',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> typeCartGreaterThan(
    CartType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeCart',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> typeCartLessThan(
    CartType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeCart',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> typeCartBetween(
    CartType lower,
    CartType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeCart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> vatCheckedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vatChecked',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> vatCheckedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vatChecked',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> vatCheckedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vatChecked',
        value: value,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'warrantyNote',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'warrantyNote',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warrantyNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warrantyNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warrantyNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warrantyNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warrantyNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      warrantyNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warrantyNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      warrantyNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warrantyNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warrantyNote',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> warrantyNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warrantyNote',
        value: '',
      ));
    });
  }
}

extension DraftingInvoiceTableQueryObject on QueryBuilder<DraftingInvoiceTable,
    DraftingInvoiceTable, QFilterCondition> {}

extension DraftingInvoiceTableQueryLinks on QueryBuilder<DraftingInvoiceTable,
    DraftingInvoiceTable, QFilterCondition> {
  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customer(FilterQuery<CustomerTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> products(FilterQuery<ProductTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'products');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'products', length, true, length, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'products', 0, true, 0, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'products', 0, false, 999999, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'products', 0, true, length, include);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'products', length, include, 999999, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'products', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> product(FilterQuery<ProductTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethods(FilterQuery<PaymentMethodTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'paymentMethods');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'paymentMethods', length, true, length, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'paymentMethods', 0, true, 0, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'paymentMethods', 0, false, 999999, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'paymentMethods', 0, true, length, include);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'paymentMethods', length, include, 999999, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'paymentMethods', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      paymentMethodsPrePay(FilterQuery<PaymentMethodTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'paymentMethodsPrePay');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsPrePayLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'paymentMethodsPrePay', length, true, length, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsPrePayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'paymentMethodsPrePay', 0, true, 0, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsPrePayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'paymentMethodsPrePay', 0, false, 999999, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsPrePayLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'paymentMethodsPrePay', 0, true, length, include);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsPrePayLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'paymentMethodsPrePay', length, include, 999999, true);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> paymentMethodsPrePayLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'paymentMethodsPrePay', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DraftingInvoiceTableQuerySortBy
    on QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QSortBy> {
  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByBillId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billId', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByBillIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billId', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByBillNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billNumber', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByBillNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billNumber', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByCouponDiscountCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'couponDiscountCode', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByCouponDiscountCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'couponDiscountCode', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByCustomerNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerNote', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByCustomerNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerNote', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByCustomerOtp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerOtp', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByCustomerOtpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerOtp', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByDeliveryFeeStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryFeeStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByDeliveryFeeStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryFeeStr', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByDiscountMemberType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountMemberType', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByDiscountMemberTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountMemberType', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByDiscountTotalBill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountTotalBill', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByDiscountTotalBillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountTotalBill', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByEmployeeSubDetailStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeSubDetailStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByEmployeeSubDetailStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeSubDetailStr', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByIsCountPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCountPoint', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByIsCountPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCountPoint', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByIsDefaultInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefaultInfo', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByIsDefaultInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefaultInfo', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByIsEstimateCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEstimateCost', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByIsEstimateCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEstimateCost', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByIsSoldByCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSoldByCompany', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByIsSoldByCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSoldByCompany', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByOrderSubDetailStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderSubDetailStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByOrderSubDetailStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderSubDetailStr', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByPreOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preOrderId', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByPreOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preOrderId', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByProductImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productImei', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByProductImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productImei', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortBySaleNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleNote', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortBySaleNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleNote', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByStoreStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByStoreStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeStr', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByTradeInType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tradeInType', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByTradeInTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tradeInType', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByTypeCart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeCart', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByTypeCartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeCart', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByVatChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatChecked', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByVatCheckedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatChecked', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByWarrantyNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyNote', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByWarrantyNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyNote', Sort.desc);
    });
  }
}

extension DraftingInvoiceTableQuerySortThenBy
    on QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QSortThenBy> {
  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByBillId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billId', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByBillIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billId', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByBillNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billNumber', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByBillNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billNumber', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByCouponDiscountCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'couponDiscountCode', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByCouponDiscountCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'couponDiscountCode', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByCustomerNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerNote', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByCustomerNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerNote', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByCustomerOtp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerOtp', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByCustomerOtpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerOtp', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByDeliveryFeeStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryFeeStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByDeliveryFeeStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryFeeStr', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByDiscountMemberType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountMemberType', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByDiscountMemberTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountMemberType', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByDiscountTotalBill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountTotalBill', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByDiscountTotalBillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountTotalBill', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByEmployeeSubDetailStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeSubDetailStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByEmployeeSubDetailStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeSubDetailStr', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByIsCountPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCountPoint', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByIsCountPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCountPoint', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByIsDefaultInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefaultInfo', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByIsDefaultInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefaultInfo', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByIsEstimateCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEstimateCost', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByIsEstimateCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEstimateCost', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByIsSoldByCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSoldByCompany', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByIsSoldByCompanyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSoldByCompany', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByOrderSubDetailStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderSubDetailStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByOrderSubDetailStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderSubDetailStr', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByPreOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preOrderId', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByPreOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preOrderId', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByProductImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productImei', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByProductImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productImei', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenBySaleNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleNote', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenBySaleNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleNote', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByStoreStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByStoreStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeStr', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByTradeInType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tradeInType', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByTradeInTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tradeInType', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByTypeCart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeCart', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByTypeCartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeCart', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByVatChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatChecked', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByVatCheckedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatChecked', Sort.desc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByWarrantyNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyNote', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByWarrantyNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warrantyNote', Sort.desc);
    });
  }
}

extension DraftingInvoiceTableQueryWhereDistinct
    on QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct> {
  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByBillId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'billId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByBillNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'billNumber');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByCouponDiscountCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'couponDiscountCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdDate');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByCustomerNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerNote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByCustomerOtp({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerOtp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByDeliveryFeeStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryFeeStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByDiscountMemberType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountMemberType');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByDiscountTotalBill() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountTotalBill');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByEmployeeSubDetailStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeSubDetailStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByIsCountPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCountPoint');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByIsDefaultInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefaultInfo');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByIsEstimateCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEstimateCost');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByIsSoldByCompany() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSoldByCompany');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'method');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderId');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByOrderSubDetailStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderSubDetailStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByPreOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preOrderId');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByProductImei({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productImei', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctBySaleNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saleNote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByStoreStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeStr', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByTradeInType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tradeInType');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByTypeCart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeCart');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByVatChecked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vatChecked');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByWarrantyNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warrantyNote', caseSensitive: caseSensitive);
    });
  }
}

extension DraftingInvoiceTableQueryProperty on QueryBuilder<
    DraftingInvoiceTable, DraftingInvoiceTable, QQueryProperty> {
  QueryBuilder<DraftingInvoiceTable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      billIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billId');
    });
  }

  QueryBuilder<DraftingInvoiceTable, int?, QQueryOperations>
      billNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billNumber');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      couponDiscountCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'couponDiscountCode');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DateTime, QQueryOperations>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdDate');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      customerNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerNote');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      customerOtpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerOtp');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      deliveryFeeStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryFeeStr');
    });
  }

  QueryBuilder<DraftingInvoiceTable, DiscountMemberType, QQueryOperations>
      discountMemberTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountMemberType');
    });
  }

  QueryBuilder<DraftingInvoiceTable, double?, QQueryOperations>
      discountTotalBillProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountTotalBill');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      employeeSubDetailStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeSubDetailStr');
    });
  }

  QueryBuilder<DraftingInvoiceTable, bool?, QQueryOperations>
      isCountPointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCountPoint');
    });
  }

  QueryBuilder<DraftingInvoiceTable, bool?, QQueryOperations>
      isDefaultInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefaultInfo');
    });
  }

  QueryBuilder<DraftingInvoiceTable, bool?, QQueryOperations>
      isEstimateCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEstimateCost');
    });
  }

  QueryBuilder<DraftingInvoiceTable, bool?, QQueryOperations>
      isSoldByCompanyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSoldByCompany');
    });
  }

  QueryBuilder<DraftingInvoiceTable, bool?, QQueryOperations> methodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'method');
    });
  }

  QueryBuilder<DraftingInvoiceTable, int?, QQueryOperations> orderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderId');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      orderSubDetailStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderSubDetailStr');
    });
  }

  QueryBuilder<DraftingInvoiceTable, int?, QQueryOperations>
      preOrderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preOrderId');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      productImeiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productImei');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      saleNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saleNote');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      storeStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeStr');
    });
  }

  QueryBuilder<DraftingInvoiceTable, TradeInType, QQueryOperations>
      tradeInTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tradeInType');
    });
  }

  QueryBuilder<DraftingInvoiceTable, CartType, QQueryOperations>
      typeCartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeCart');
    });
  }

  QueryBuilder<DraftingInvoiceTable, bool?, QQueryOperations>
      vatCheckedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vatChecked');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      warrantyNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyNote');
    });
  }
}
