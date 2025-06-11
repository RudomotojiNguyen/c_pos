// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_table.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVoucherTableCollection on Isar {
  IsarCollection<VoucherTable> get voucherTables => this.collection();
}

const VoucherTableSchema = CollectionSchema(
  name: r'VoucherTable',
  id: 7451230929139738371,
  properties: {
    r'cumulativeStringValues': PropertySchema(
      id: 0,
      name: r'cumulativeStringValues',
      type: IsarType.stringList,
    ),
    r'maxValue': PropertySchema(
      id: 1,
      name: r'maxValue',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.byte,
      enumMap: _VoucherTabletypeEnumValueMap,
    ),
    r'usable': PropertySchema(
      id: 3,
      name: r'usable',
      type: IsarType.long,
    ),
    r'value': PropertySchema(
      id: 4,
      name: r'value',
      type: IsarType.double,
    ),
    r'voucherCode': PropertySchema(
      id: 5,
      name: r'voucherCode',
      type: IsarType.string,
    ),
    r'voucherDetailId': PropertySchema(
      id: 6,
      name: r'voucherDetailId',
      type: IsarType.long,
    ),
    r'voucherId': PropertySchema(
      id: 7,
      name: r'voucherId',
      type: IsarType.long,
    ),
    r'voucherName': PropertySchema(
      id: 8,
      name: r'voucherName',
      type: IsarType.string,
    ),
    r'voucherValue': PropertySchema(
      id: 9,
      name: r'voucherValue',
      type: IsarType.double,
    )
  },
  estimateSize: _voucherTableEstimateSize,
  serialize: _voucherTableSerialize,
  deserialize: _voucherTableDeserialize,
  deserializeProp: _voucherTableDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _voucherTableGetId,
  getLinks: _voucherTableGetLinks,
  attach: _voucherTableAttach,
  version: '3.1.0+1',
);

int _voucherTableEstimateSize(
  VoucherTable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cumulativeStringValues.length * 3;
  {
    for (var i = 0; i < object.cumulativeStringValues.length; i++) {
      final value = object.cumulativeStringValues[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.voucherCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.voucherName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _voucherTableSerialize(
  VoucherTable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.cumulativeStringValues);
  writer.writeDouble(offsets[1], object.maxValue);
  writer.writeByte(offsets[2], object.type.index);
  writer.writeLong(offsets[3], object.usable);
  writer.writeDouble(offsets[4], object.value);
  writer.writeString(offsets[5], object.voucherCode);
  writer.writeLong(offsets[6], object.voucherDetailId);
  writer.writeLong(offsets[7], object.voucherId);
  writer.writeString(offsets[8], object.voucherName);
  writer.writeDouble(offsets[9], object.voucherValue);
}

VoucherTable _voucherTableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VoucherTable(
    cumulativeStringValues: reader.readStringList(offsets[0]) ?? [],
    maxValue: reader.readDoubleOrNull(offsets[1]),
    type: _VoucherTabletypeValueEnumMap[reader.readByteOrNull(offsets[2])] ??
        XDiscountType.none,
    usable: reader.readLongOrNull(offsets[3]),
    value: reader.readDoubleOrNull(offsets[4]),
    voucherCode: reader.readStringOrNull(offsets[5]),
    voucherDetailId: reader.readLongOrNull(offsets[6]),
    voucherId: reader.readLongOrNull(offsets[7]),
    voucherName: reader.readStringOrNull(offsets[8]),
    voucherValue: reader.readDoubleOrNull(offsets[9]),
  );
  object.id = id;
  return object;
}

P _voucherTableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (_VoucherTabletypeValueEnumMap[reader.readByteOrNull(offset)] ??
          XDiscountType.none) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VoucherTabletypeEnumValueMap = {
  'none': 0,
  'percent': 1,
  'amount': 2,
};
const _VoucherTabletypeValueEnumMap = {
  0: XDiscountType.none,
  1: XDiscountType.percent,
  2: XDiscountType.amount,
};

Id _voucherTableGetId(VoucherTable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _voucherTableGetLinks(VoucherTable object) {
  return [];
}

void _voucherTableAttach(
    IsarCollection<dynamic> col, Id id, VoucherTable object) {
  object.id = id;
}

extension VoucherTableQueryWhereSort
    on QueryBuilder<VoucherTable, VoucherTable, QWhere> {
  QueryBuilder<VoucherTable, VoucherTable, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VoucherTableQueryWhere
    on QueryBuilder<VoucherTable, VoucherTable, QWhereClause> {
  QueryBuilder<VoucherTable, VoucherTable, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<VoucherTable, VoucherTable, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterWhereClause> idBetween(
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

extension VoucherTableQueryFilter
    on QueryBuilder<VoucherTable, VoucherTable, QFilterCondition> {
  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cumulativeStringValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cumulativeStringValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cumulativeStringValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cumulativeStringValues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cumulativeStringValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cumulativeStringValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cumulativeStringValues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cumulativeStringValues',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cumulativeStringValues',
        value: '',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cumulativeStringValues',
        value: '',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cumulativeStringValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cumulativeStringValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cumulativeStringValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cumulativeStringValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cumulativeStringValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      cumulativeStringValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cumulativeStringValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      maxValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maxValue',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      maxValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maxValue',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      maxValueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      maxValueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      maxValueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      maxValueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> typeEqualTo(
      XDiscountType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      typeGreaterThan(
    XDiscountType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> typeLessThan(
    XDiscountType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> typeBetween(
    XDiscountType lower,
    XDiscountType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      usableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usable',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      usableIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usable',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> usableEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usable',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      usableGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usable',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      usableLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usable',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> usableBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usable',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> valueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      valueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> valueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition> valueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voucherCode',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voucherCode',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voucherCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'voucherCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'voucherCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'voucherCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherDetailIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voucherDetailId',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherDetailIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voucherDetailId',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherDetailIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherDetailId',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherDetailIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voucherDetailId',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherDetailIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voucherDetailId',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherDetailIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voucherDetailId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voucherId',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voucherId',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherId',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voucherId',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voucherId',
        value: value,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voucherId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voucherName',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voucherName',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voucherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voucherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voucherName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'voucherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'voucherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'voucherName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'voucherName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherName',
        value: '',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'voucherName',
        value: '',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voucherValue',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voucherValue',
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherValueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherValueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voucherValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherValueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voucherValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterFilterCondition>
      voucherValueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voucherValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension VoucherTableQueryObject
    on QueryBuilder<VoucherTable, VoucherTable, QFilterCondition> {}

extension VoucherTableQueryLinks
    on QueryBuilder<VoucherTable, VoucherTable, QFilterCondition> {}

extension VoucherTableQuerySortBy
    on QueryBuilder<VoucherTable, VoucherTable, QSortBy> {
  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByMaxValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxValue', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByMaxValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxValue', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByUsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usable', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByUsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usable', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByVoucherCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherCode', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      sortByVoucherCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherCode', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      sortByVoucherDetailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherDetailId', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      sortByVoucherDetailIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherDetailId', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByVoucherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherId', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByVoucherIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherId', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByVoucherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherName', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      sortByVoucherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherName', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> sortByVoucherValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherValue', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      sortByVoucherValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherValue', Sort.desc);
    });
  }
}

extension VoucherTableQuerySortThenBy
    on QueryBuilder<VoucherTable, VoucherTable, QSortThenBy> {
  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByMaxValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxValue', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByMaxValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxValue', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByUsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usable', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByUsableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usable', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByVoucherCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherCode', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      thenByVoucherCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherCode', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      thenByVoucherDetailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherDetailId', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      thenByVoucherDetailIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherDetailId', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByVoucherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherId', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByVoucherIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherId', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByVoucherName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherName', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      thenByVoucherNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherName', Sort.desc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy> thenByVoucherValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherValue', Sort.asc);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QAfterSortBy>
      thenByVoucherValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherValue', Sort.desc);
    });
  }
}

extension VoucherTableQueryWhereDistinct
    on QueryBuilder<VoucherTable, VoucherTable, QDistinct> {
  QueryBuilder<VoucherTable, VoucherTable, QDistinct>
      distinctByCumulativeStringValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cumulativeStringValues');
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QDistinct> distinctByMaxValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxValue');
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QDistinct> distinctByUsable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usable');
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QDistinct> distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QDistinct> distinctByVoucherCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voucherCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QDistinct>
      distinctByVoucherDetailId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voucherDetailId');
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QDistinct> distinctByVoucherId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voucherId');
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QDistinct> distinctByVoucherName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voucherName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VoucherTable, VoucherTable, QDistinct> distinctByVoucherValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voucherValue');
    });
  }
}

extension VoucherTableQueryProperty
    on QueryBuilder<VoucherTable, VoucherTable, QQueryProperty> {
  QueryBuilder<VoucherTable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VoucherTable, List<String>, QQueryOperations>
      cumulativeStringValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cumulativeStringValues');
    });
  }

  QueryBuilder<VoucherTable, double?, QQueryOperations> maxValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxValue');
    });
  }

  QueryBuilder<VoucherTable, XDiscountType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<VoucherTable, int?, QQueryOperations> usableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usable');
    });
  }

  QueryBuilder<VoucherTable, double?, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }

  QueryBuilder<VoucherTable, String?, QQueryOperations> voucherCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voucherCode');
    });
  }

  QueryBuilder<VoucherTable, int?, QQueryOperations> voucherDetailIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voucherDetailId');
    });
  }

  QueryBuilder<VoucherTable, int?, QQueryOperations> voucherIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voucherId');
    });
  }

  QueryBuilder<VoucherTable, String?, QQueryOperations> voucherNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voucherName');
    });
  }

  QueryBuilder<VoucherTable, double?, QQueryOperations> voucherValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voucherValue');
    });
  }
}
