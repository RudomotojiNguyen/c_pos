// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_table.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPaymentMethodTableCollection on Isar {
  IsarCollection<PaymentMethodTable> get paymentMethodTables =>
      this.collection();
}

const PaymentMethodTableSchema = CollectionSchema(
  name: r'PaymentMethodTable',
  id: -8996728169815188203,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'cardNumber': PropertySchema(
      id: 1,
      name: r'cardNumber',
      type: IsarType.string,
    ),
    r'conditionNumber': PropertySchema(
      id: 2,
      name: r'conditionNumber',
      type: IsarType.string,
    ),
    r'idCard': PropertySchema(
      id: 3,
      name: r'idCard',
      type: IsarType.string,
    ),
    r'installmentMethodJson': PropertySchema(
      id: 4,
      name: r'installmentMethodJson',
      type: IsarType.string,
    ),
    r'methodDeposit': PropertySchema(
      id: 5,
      name: r'methodDeposit',
      type: IsarType.byte,
      enumMap: _PaymentMethodTablemethodDepositEnumValueMap,
    ),
    r'paymentId': PropertySchema(
      id: 6,
      name: r'paymentId',
      type: IsarType.long,
    ),
    r'paymentType': PropertySchema(
      id: 7,
      name: r'paymentType',
      type: IsarType.byte,
      enumMap: _PaymentMethodTablepaymentTypeEnumValueMap,
    ),
    r'refCode': PropertySchema(
      id: 8,
      name: r'refCode',
      type: IsarType.string,
    ),
    r'transactionDetailJson': PropertySchema(
      id: 9,
      name: r'transactionDetailJson',
      type: IsarType.string,
    )
  },
  estimateSize: _paymentMethodTableEstimateSize,
  serialize: _paymentMethodTableSerialize,
  deserialize: _paymentMethodTableDeserialize,
  deserializeProp: _paymentMethodTableDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _paymentMethodTableGetId,
  getLinks: _paymentMethodTableGetLinks,
  attach: _paymentMethodTableAttach,
  version: '3.1.0+1',
);

int _paymentMethodTableEstimateSize(
  PaymentMethodTable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cardNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.conditionNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.idCard;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.installmentMethodJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.refCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transactionDetailJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _paymentMethodTableSerialize(
  PaymentMethodTable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.cardNumber);
  writer.writeString(offsets[2], object.conditionNumber);
  writer.writeString(offsets[3], object.idCard);
  writer.writeString(offsets[4], object.installmentMethodJson);
  writer.writeByte(offsets[5], object.methodDeposit.index);
  writer.writeLong(offsets[6], object.paymentId);
  writer.writeByte(offsets[7], object.paymentType.index);
  writer.writeString(offsets[8], object.refCode);
  writer.writeString(offsets[9], object.transactionDetailJson);
}

PaymentMethodTable _paymentMethodTableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PaymentMethodTable();
  object.amount = reader.readDoubleOrNull(offsets[0]);
  object.cardNumber = reader.readStringOrNull(offsets[1]);
  object.conditionNumber = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.idCard = reader.readStringOrNull(offsets[3]);
  object.installmentMethodJson = reader.readStringOrNull(offsets[4]);
  object.methodDeposit = _PaymentMethodTablemethodDepositValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      MethodDeposit.interestPayment;
  object.paymentId = reader.readLongOrNull(offsets[6]);
  object.paymentType = _PaymentMethodTablepaymentTypeValueEnumMap[
          reader.readByteOrNull(offsets[7])] ??
      PaymentType.cash;
  object.refCode = reader.readStringOrNull(offsets[8]);
  object.transactionDetailJson = reader.readStringOrNull(offsets[9]);
  return object;
}

P _paymentMethodTableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_PaymentMethodTablemethodDepositValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MethodDeposit.interestPayment) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (_PaymentMethodTablepaymentTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          PaymentType.cash) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PaymentMethodTablemethodDepositEnumValueMap = {
  'interestPayment': 0,
  'noneInterestPayment': 1,
  'none': 2,
};
const _PaymentMethodTablemethodDepositValueEnumMap = {
  0: MethodDeposit.interestPayment,
  1: MethodDeposit.noneInterestPayment,
  2: MethodDeposit.none,
};
const _PaymentMethodTablepaymentTypeEnumValueMap = {
  'cash': 0,
  'transfer': 1,
  'credit': 2,
  'installment': 3,
  'refund': 4,
};
const _PaymentMethodTablepaymentTypeValueEnumMap = {
  0: PaymentType.cash,
  1: PaymentType.transfer,
  2: PaymentType.credit,
  3: PaymentType.installment,
  4: PaymentType.refund,
};

Id _paymentMethodTableGetId(PaymentMethodTable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _paymentMethodTableGetLinks(
    PaymentMethodTable object) {
  return [];
}

void _paymentMethodTableAttach(
    IsarCollection<dynamic> col, Id id, PaymentMethodTable object) {
  object.id = id;
}

extension PaymentMethodTableQueryWhereSort
    on QueryBuilder<PaymentMethodTable, PaymentMethodTable, QWhere> {
  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PaymentMethodTableQueryWhere
    on QueryBuilder<PaymentMethodTable, PaymentMethodTable, QWhereClause> {
  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterWhereClause>
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

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterWhereClause>
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

extension PaymentMethodTableQueryFilter
    on QueryBuilder<PaymentMethodTable, PaymentMethodTable, QFilterCondition> {
  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      amountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      amountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      amountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      amountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cardNumber',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cardNumber',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      cardNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conditionNumber',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conditionNumber',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conditionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conditionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conditionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conditionNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'conditionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'conditionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'conditionNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'conditionNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conditionNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      conditionNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'conditionNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idCard',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idCard',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idCard',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'idCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'idCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'idCard',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'idCard',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idCard',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      idCardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'idCard',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'installmentMethodJson',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'installmentMethodJson',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'installmentMethodJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'installmentMethodJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'installmentMethodJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'installmentMethodJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'installmentMethodJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'installmentMethodJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'installmentMethodJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'installmentMethodJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'installmentMethodJson',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      installmentMethodJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'installmentMethodJson',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      methodDepositEqualTo(MethodDeposit value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'methodDeposit',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      methodDepositGreaterThan(
    MethodDeposit value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'methodDeposit',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      methodDepositLessThan(
    MethodDeposit value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'methodDeposit',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      methodDepositBetween(
    MethodDeposit lower,
    MethodDeposit upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'methodDeposit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentId',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentId',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentId',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentId',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentId',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentTypeEqualTo(PaymentType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentType',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentTypeGreaterThan(
    PaymentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentType',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentTypeLessThan(
    PaymentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentType',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      paymentTypeBetween(
    PaymentType lower,
    PaymentType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'refCode',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'refCode',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'refCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'refCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'refCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'refCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'refCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'refCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'refCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      refCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'refCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactionDetailJson',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactionDetailJson',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDetailJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionDetailJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionDetailJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionDetailJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionDetailJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionDetailJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionDetailJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionDetailJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionDetailJson',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterFilterCondition>
      transactionDetailJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionDetailJson',
        value: '',
      ));
    });
  }
}

extension PaymentMethodTableQueryObject
    on QueryBuilder<PaymentMethodTable, PaymentMethodTable, QFilterCondition> {}

extension PaymentMethodTableQueryLinks
    on QueryBuilder<PaymentMethodTable, PaymentMethodTable, QFilterCondition> {}

extension PaymentMethodTableQuerySortBy
    on QueryBuilder<PaymentMethodTable, PaymentMethodTable, QSortBy> {
  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByConditionNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conditionNumber', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByConditionNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conditionNumber', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByIdCard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCard', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByIdCardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCard', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByInstallmentMethodJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installmentMethodJson', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByInstallmentMethodJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installmentMethodJson', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByMethodDeposit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodDeposit', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByMethodDepositDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodDeposit', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByPaymentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentId', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByPaymentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentId', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentType', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByPaymentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentType', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByRefCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refCode', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByRefCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refCode', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByTransactionDetailJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDetailJson', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      sortByTransactionDetailJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDetailJson', Sort.desc);
    });
  }
}

extension PaymentMethodTableQuerySortThenBy
    on QueryBuilder<PaymentMethodTable, PaymentMethodTable, QSortThenBy> {
  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByConditionNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conditionNumber', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByConditionNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conditionNumber', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByIdCard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCard', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByIdCardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idCard', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByInstallmentMethodJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installmentMethodJson', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByInstallmentMethodJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installmentMethodJson', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByMethodDeposit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodDeposit', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByMethodDepositDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodDeposit', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByPaymentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentId', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByPaymentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentId', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentType', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByPaymentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentType', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByRefCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refCode', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByRefCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refCode', Sort.desc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByTransactionDetailJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDetailJson', Sort.asc);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QAfterSortBy>
      thenByTransactionDetailJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionDetailJson', Sort.desc);
    });
  }
}

extension PaymentMethodTableQueryWhereDistinct
    on QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct> {
  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByCardNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByConditionNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'conditionNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByIdCard({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idCard', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByInstallmentMethodJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'installmentMethodJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByMethodDeposit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'methodDeposit');
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByPaymentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentId');
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByPaymentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentType');
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByRefCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentMethodTable, QDistinct>
      distinctByTransactionDetailJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionDetailJson',
          caseSensitive: caseSensitive);
    });
  }
}

extension PaymentMethodTableQueryProperty
    on QueryBuilder<PaymentMethodTable, PaymentMethodTable, QQueryProperty> {
  QueryBuilder<PaymentMethodTable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PaymentMethodTable, double?, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<PaymentMethodTable, String?, QQueryOperations>
      cardNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardNumber');
    });
  }

  QueryBuilder<PaymentMethodTable, String?, QQueryOperations>
      conditionNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'conditionNumber');
    });
  }

  QueryBuilder<PaymentMethodTable, String?, QQueryOperations> idCardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idCard');
    });
  }

  QueryBuilder<PaymentMethodTable, String?, QQueryOperations>
      installmentMethodJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'installmentMethodJson');
    });
  }

  QueryBuilder<PaymentMethodTable, MethodDeposit, QQueryOperations>
      methodDepositProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'methodDeposit');
    });
  }

  QueryBuilder<PaymentMethodTable, int?, QQueryOperations> paymentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentId');
    });
  }

  QueryBuilder<PaymentMethodTable, PaymentType, QQueryOperations>
      paymentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentType');
    });
  }

  QueryBuilder<PaymentMethodTable, String?, QQueryOperations>
      refCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refCode');
    });
  }

  QueryBuilder<PaymentMethodTable, String?, QQueryOperations>
      transactionDetailJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionDetailJson');
    });
  }
}
