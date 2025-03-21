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
    r'couponDiscountCode': PropertySchema(
      id: 0,
      name: r'couponDiscountCode',
      type: IsarType.string,
    ),
    r'createdDate': PropertySchema(
      id: 1,
      name: r'createdDate',
      type: IsarType.dateTime,
    ),
    r'deliveryFeeStr': PropertySchema(
      id: 2,
      name: r'deliveryFeeStr',
      type: IsarType.string,
    ),
    r'discountMemberType': PropertySchema(
      id: 3,
      name: r'discountMemberType',
      type: IsarType.byte,
      enumMap: _DraftingInvoiceTablediscountMemberTypeEnumValueMap,
    ),
    r'discountTotalBill': PropertySchema(
      id: 4,
      name: r'discountTotalBill',
      type: IsarType.double,
    ),
    r'orderSubDetailStr': PropertySchema(
      id: 5,
      name: r'orderSubDetailStr',
      type: IsarType.string,
    ),
    r'saleInfoStr': PropertySchema(
      id: 6,
      name: r'saleInfoStr',
      type: IsarType.string,
    ),
    r'saleNote': PropertySchema(
      id: 7,
      name: r'saleNote',
      type: IsarType.string,
    ),
    r'technicalInfoStr': PropertySchema(
      id: 8,
      name: r'technicalInfoStr',
      type: IsarType.string,
    ),
    r'tradeInType': PropertySchema(
      id: 9,
      name: r'tradeInType',
      type: IsarType.byte,
      enumMap: _DraftingInvoiceTabletradeInTypeEnumValueMap,
    ),
    r'typeCart': PropertySchema(
      id: 10,
      name: r'typeCart',
      type: IsarType.byte,
      enumMap: _DraftingInvoiceTabletypeCartEnumValueMap,
    ),
    r'warrantyNote': PropertySchema(
      id: 11,
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
    final value = object.couponDiscountCode;
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
    final value = object.orderSubDetailStr;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.saleInfoStr;
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
    final value = object.technicalInfoStr;
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
  writer.writeString(offsets[0], object.couponDiscountCode);
  writer.writeDateTime(offsets[1], object.createdDate);
  writer.writeString(offsets[2], object.deliveryFeeStr);
  writer.writeByte(offsets[3], object.discountMemberType.index);
  writer.writeDouble(offsets[4], object.discountTotalBill);
  writer.writeString(offsets[5], object.orderSubDetailStr);
  writer.writeString(offsets[6], object.saleInfoStr);
  writer.writeString(offsets[7], object.saleNote);
  writer.writeString(offsets[8], object.technicalInfoStr);
  writer.writeByte(offsets[9], object.tradeInType.index);
  writer.writeByte(offsets[10], object.typeCart.index);
  writer.writeString(offsets[11], object.warrantyNote);
}

DraftingInvoiceTable _draftingInvoiceTableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DraftingInvoiceTable();
  object.couponDiscountCode = reader.readStringOrNull(offsets[0]);
  object.createdDate = reader.readDateTime(offsets[1]);
  object.deliveryFeeStr = reader.readStringOrNull(offsets[2]);
  object.discountMemberType =
      _DraftingInvoiceTablediscountMemberTypeValueEnumMap[
              reader.readByteOrNull(offsets[3])] ??
          DiscountMemberType.point;
  object.discountTotalBill = reader.readDoubleOrNull(offsets[4]);
  object.id = id;
  object.orderSubDetailStr = reader.readStringOrNull(offsets[5]);
  object.saleInfoStr = reader.readStringOrNull(offsets[6]);
  object.saleNote = reader.readStringOrNull(offsets[7]);
  object.technicalInfoStr = reader.readStringOrNull(offsets[8]);
  object.tradeInType = _DraftingInvoiceTabletradeInTypeValueEnumMap[
          reader.readByteOrNull(offsets[9])] ??
      TradeInType.undefine;
  object.typeCart = _DraftingInvoiceTabletypeCartValueEnumMap[
          reader.readByteOrNull(offsets[10])] ??
      CartType.retail;
  object.warrantyNote = reader.readStringOrNull(offsets[11]);
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
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (_DraftingInvoiceTablediscountMemberTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          DiscountMemberType.point) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (_DraftingInvoiceTabletradeInTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TradeInType.undefine) as P;
    case 10:
      return (_DraftingInvoiceTabletypeCartValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CartType.retail) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DraftingInvoiceTablediscountMemberTypeEnumValueMap = {
  'point': 0,
  'dMem': 1,
  'none': 2,
};
const _DraftingInvoiceTablediscountMemberTypeValueEnumMap = {
  0: DiscountMemberType.point,
  1: DiscountMemberType.dMem,
  2: DiscountMemberType.none,
};
const _DraftingInvoiceTabletradeInTypeEnumValueMap = {
  'undefine': 0,
  'tradeIn': 1,
  'buyingOldItems': 2,
  'exchangeWarranty': 3,
};
const _DraftingInvoiceTabletradeInTypeValueEnumMap = {
  0: TradeInType.undefine,
  1: TradeInType.tradeIn,
  2: TradeInType.buyingOldItems,
  3: TradeInType.exchangeWarranty,
};
const _DraftingInvoiceTabletypeCartEnumValueMap = {
  'retail': 0,
  'updateBill': 1,
  'order': 2,
  'updateOrder': 3,
  'tradeIn': 4,
  'warranty': 5,
  'none': 6,
};
const _DraftingInvoiceTabletypeCartValueEnumMap = {
  0: CartType.retail,
  1: CartType.updateBill,
  2: CartType.order,
  3: CartType.updateOrder,
  4: CartType.tradeIn,
  5: CartType.warranty,
  6: CartType.none,
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
      QAfterFilterCondition> saleInfoStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'saleInfoStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleInfoStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'saleInfoStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleInfoStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saleInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleInfoStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saleInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleInfoStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saleInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleInfoStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saleInfoStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleInfoStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'saleInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleInfoStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'saleInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      saleInfoStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'saleInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      saleInfoStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'saleInfoStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleInfoStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saleInfoStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> saleInfoStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'saleInfoStr',
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
      QAfterFilterCondition> technicalInfoStrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'technicalInfoStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> technicalInfoStrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'technicalInfoStr',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> technicalInfoStrEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technicalInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> technicalInfoStrGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technicalInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> technicalInfoStrLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technicalInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> technicalInfoStrBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technicalInfoStr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> technicalInfoStrStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'technicalInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> technicalInfoStrEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'technicalInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      technicalInfoStrContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technicalInfoStr',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
          QAfterFilterCondition>
      technicalInfoStrMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technicalInfoStr',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> technicalInfoStrIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technicalInfoStr',
        value: '',
      ));
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable,
      QAfterFilterCondition> technicalInfoStrIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technicalInfoStr',
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
      sortBySaleInfoStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleInfoStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortBySaleInfoStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleInfoStr', Sort.desc);
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
      sortByTechnicalInfoStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicalInfoStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      sortByTechnicalInfoStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicalInfoStr', Sort.desc);
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
      thenBySaleInfoStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleInfoStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenBySaleInfoStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'saleInfoStr', Sort.desc);
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
      thenByTechnicalInfoStr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicalInfoStr', Sort.asc);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QAfterSortBy>
      thenByTechnicalInfoStrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicalInfoStr', Sort.desc);
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
      distinctByOrderSubDetailStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderSubDetailStr',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctBySaleInfoStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saleInfoStr', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctBySaleNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'saleNote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftingInvoiceTable, DraftingInvoiceTable, QDistinct>
      distinctByTechnicalInfoStr({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technicalInfoStr',
          caseSensitive: caseSensitive);
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
      orderSubDetailStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderSubDetailStr');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      saleInfoStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saleInfoStr');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      saleNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saleNote');
    });
  }

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      technicalInfoStrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technicalInfoStr');
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

  QueryBuilder<DraftingInvoiceTable, String?, QQueryOperations>
      warrantyNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warrantyNote');
    });
  }
}
