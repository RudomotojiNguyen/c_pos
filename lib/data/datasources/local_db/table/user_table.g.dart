// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_table.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserTableCollection on Isar {
  IsarCollection<UserTable> get userTables => this.collection();
}

const UserTableSchema = CollectionSchema(
  name: r'UserTable',
  id: -5746057764649721089,
  properties: {
    r'accessToken': PropertySchema(
      id: 0,
      name: r'accessToken',
      type: IsarType.string,
    ),
    r'employeeId': PropertySchema(
      id: 1,
      name: r'employeeId',
      type: IsarType.long,
    ),
    r'fullName': PropertySchema(
      id: 2,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.long,
    ),
    r'jobTitleId': PropertySchema(
      id: 4,
      name: r'jobTitleId',
      type: IsarType.long,
    ),
    r'listFeature': PropertySchema(
      id: 5,
      name: r'listFeature',
      type: IsarType.stringList,
    ),
    r'storeId': PropertySchema(
      id: 6,
      name: r'storeId',
      type: IsarType.long,
    ),
    r'storeName': PropertySchema(
      id: 7,
      name: r'storeName',
      type: IsarType.string,
    ),
    r'userCode': PropertySchema(
      id: 8,
      name: r'userCode',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 9,
      name: r'userId',
      type: IsarType.long,
    ),
    r'username': PropertySchema(
      id: 10,
      name: r'username',
      type: IsarType.string,
    )
  },
  estimateSize: _userTableEstimateSize,
  serialize: _userTableSerialize,
  deserialize: _userTableDeserialize,
  deserializeProp: _userTableDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userTableGetId,
  getLinks: _userTableGetLinks,
  attach: _userTableAttach,
  version: '3.1.0+1',
);

int _userTableEstimateSize(
  UserTable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.accessToken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fullName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.listFeature;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.storeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.username;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userTableSerialize(
  UserTable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accessToken);
  writer.writeLong(offsets[1], object.employeeId);
  writer.writeString(offsets[2], object.fullName);
  writer.writeLong(offsets[3], object.isActive);
  writer.writeLong(offsets[4], object.jobTitleId);
  writer.writeStringList(offsets[5], object.listFeature);
  writer.writeLong(offsets[6], object.storeId);
  writer.writeString(offsets[7], object.storeName);
  writer.writeString(offsets[8], object.userCode);
  writer.writeLong(offsets[9], object.userId);
  writer.writeString(offsets[10], object.username);
}

UserTable _userTableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserTable();
  object.accessToken = reader.readStringOrNull(offsets[0]);
  object.employeeId = reader.readLongOrNull(offsets[1]);
  object.fullName = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.isActive = reader.readLongOrNull(offsets[3]);
  object.jobTitleId = reader.readLongOrNull(offsets[4]);
  object.listFeature = reader.readStringList(offsets[5]);
  object.storeId = reader.readLongOrNull(offsets[6]);
  object.storeName = reader.readStringOrNull(offsets[7]);
  object.userCode = reader.readStringOrNull(offsets[8]);
  object.userId = reader.readLongOrNull(offsets[9]);
  object.username = reader.readStringOrNull(offsets[10]);
  return object;
}

P _userTableDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userTableGetId(UserTable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userTableGetLinks(UserTable object) {
  return [];
}

void _userTableAttach(IsarCollection<dynamic> col, Id id, UserTable object) {
  object.id = id;
}

extension UserTableQueryWhereSort
    on QueryBuilder<UserTable, UserTable, QWhere> {
  QueryBuilder<UserTable, UserTable, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserTableQueryWhere
    on QueryBuilder<UserTable, UserTable, QWhereClause> {
  QueryBuilder<UserTable, UserTable, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<UserTable, UserTable, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterWhereClause> idBetween(
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

extension UserTableQueryFilter
    on QueryBuilder<UserTable, UserTable, QFilterCondition> {
  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      accessTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accessToken',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      accessTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accessToken',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> accessTokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      accessTokenGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> accessTokenLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> accessTokenBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accessToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      accessTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> accessTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> accessTokenContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accessToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> accessTokenMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accessToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      accessTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accessToken',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      accessTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accessToken',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> employeeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'employeeId',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      employeeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'employeeId',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> employeeIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      employeeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> employeeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> employeeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> isActiveEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> isActiveGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> isActiveLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> isActiveBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isActive',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> jobTitleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobTitleId',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      jobTitleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobTitleId',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> jobTitleIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobTitleId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      jobTitleIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobTitleId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> jobTitleIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobTitleId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> jobTitleIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobTitleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'listFeature',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'listFeature',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'listFeature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'listFeature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'listFeature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'listFeature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'listFeature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'listFeature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'listFeature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'listFeature',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'listFeature',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'listFeature',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listFeature',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listFeature',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listFeature',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listFeature',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listFeature',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      listFeatureLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'listFeature',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeId',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeId',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeName',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      storeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeName',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      storeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> storeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      storeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userCode',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      userCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userCode',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userCode',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      userCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userCode',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> userIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'username',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      usernameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'username',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'username',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'username',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'username',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition> usernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'username',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterFilterCondition>
      usernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'username',
        value: '',
      ));
    });
  }
}

extension UserTableQueryObject
    on QueryBuilder<UserTable, UserTable, QFilterCondition> {}

extension UserTableQueryLinks
    on QueryBuilder<UserTable, UserTable, QFilterCondition> {}

extension UserTableQuerySortBy on QueryBuilder<UserTable, UserTable, QSortBy> {
  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByAccessToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByAccessTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByJobTitleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitleId', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByJobTitleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitleId', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByUserCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userCode', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByUserCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userCode', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> sortByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension UserTableQuerySortThenBy
    on QueryBuilder<UserTable, UserTable, QSortThenBy> {
  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByAccessToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByAccessTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accessToken', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByJobTitleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitleId', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByJobTitleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitleId', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByUserCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userCode', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByUserCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userCode', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<UserTable, UserTable, QAfterSortBy> thenByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension UserTableQueryWhereDistinct
    on QueryBuilder<UserTable, UserTable, QDistinct> {
  QueryBuilder<UserTable, UserTable, QDistinct> distinctByAccessToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accessToken', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeId');
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByJobTitleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobTitleId');
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByListFeature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'listFeature');
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeId');
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByStoreName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByUserCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<UserTable, UserTable, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'username', caseSensitive: caseSensitive);
    });
  }
}

extension UserTableQueryProperty
    on QueryBuilder<UserTable, UserTable, QQueryProperty> {
  QueryBuilder<UserTable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserTable, String?, QQueryOperations> accessTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accessToken');
    });
  }

  QueryBuilder<UserTable, int?, QQueryOperations> employeeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeId');
    });
  }

  QueryBuilder<UserTable, String?, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<UserTable, int?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<UserTable, int?, QQueryOperations> jobTitleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobTitleId');
    });
  }

  QueryBuilder<UserTable, List<String>?, QQueryOperations>
      listFeatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listFeature');
    });
  }

  QueryBuilder<UserTable, int?, QQueryOperations> storeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeId');
    });
  }

  QueryBuilder<UserTable, String?, QQueryOperations> storeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeName');
    });
  }

  QueryBuilder<UserTable, String?, QQueryOperations> userCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userCode');
    });
  }

  QueryBuilder<UserTable, int?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<UserTable, String?, QQueryOperations> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'username');
    });
  }
}
