// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCompanySchemaCollection on Isar {
  IsarCollection<CompanySchema> get companySchemas => this.collection();
}

const CompanySchemaSchema = CollectionSchema(
  name: r'CompanySchema',
  id: -6475315725971422798,
  properties: {
    r'autoPrint': PropertySchema(
      id: 0,
      name: r'autoPrint',
      type: IsarType.bool,
    ),
    r'city': PropertySchema(id: 1, name: r'city', type: IsarType.string),
    r'companyId': PropertySchema(
      id: 2,
      name: r'companyId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'defaultStartDate': PropertySchema(
      id: 4,
      name: r'defaultStartDate',
      type: IsarType.dateTime,
    ),
    r'logoUrl': PropertySchema(id: 5, name: r'logoUrl', type: IsarType.string),
    r'name': PropertySchema(id: 6, name: r'name', type: IsarType.string),
    r'phone1': PropertySchema(id: 7, name: r'phone1', type: IsarType.string),
    r'phone2': PropertySchema(id: 8, name: r'phone2', type: IsarType.string),
    r'tinNumber': PropertySchema(
      id: 9,
      name: r'tinNumber',
      type: IsarType.string,
    ),
    r'tradeName': PropertySchema(
      id: 10,
      name: r'tradeName',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'wereda': PropertySchema(id: 12, name: r'wereda', type: IsarType.string),
  },

  estimateSize: _companySchemaEstimateSize,
  serialize: _companySchemaSerialize,
  deserialize: _companySchemaDeserialize,
  deserializeProp: _companySchemaDeserializeProp,
  idName: r'id',
  indexes: {
    r'companyId': IndexSchema(
      id: 482756417767355356,
      name: r'companyId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'companyId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _companySchemaGetId,
  getLinks: _companySchemaGetLinks,
  attach: _companySchemaAttach,
  version: '3.3.0',
);

int _companySchemaEstimateSize(
  CompanySchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.city;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.companyId.length * 3;
  {
    final value = object.logoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.phone1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tinNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tradeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.wereda;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _companySchemaSerialize(
  CompanySchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.autoPrint);
  writer.writeString(offsets[1], object.city);
  writer.writeString(offsets[2], object.companyId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDateTime(offsets[4], object.defaultStartDate);
  writer.writeString(offsets[5], object.logoUrl);
  writer.writeString(offsets[6], object.name);
  writer.writeString(offsets[7], object.phone1);
  writer.writeString(offsets[8], object.phone2);
  writer.writeString(offsets[9], object.tinNumber);
  writer.writeString(offsets[10], object.tradeName);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeString(offsets[12], object.wereda);
}

CompanySchema _companySchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CompanySchema();
  object.autoPrint = reader.readBoolOrNull(offsets[0]);
  object.city = reader.readStringOrNull(offsets[1]);
  object.companyId = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.defaultStartDate = reader.readDateTimeOrNull(offsets[4]);
  object.id = id;
  object.logoUrl = reader.readStringOrNull(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.phone1 = reader.readStringOrNull(offsets[7]);
  object.phone2 = reader.readStringOrNull(offsets[8]);
  object.tinNumber = reader.readStringOrNull(offsets[9]);
  object.tradeName = reader.readStringOrNull(offsets[10]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[11]);
  object.wereda = reader.readStringOrNull(offsets[12]);
  return object;
}

P _companySchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _companySchemaGetId(CompanySchema object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _companySchemaGetLinks(CompanySchema object) {
  return [];
}

void _companySchemaAttach(
  IsarCollection<dynamic> col,
  Id id,
  CompanySchema object,
) {
  object.id = id;
}

extension CompanySchemaByIndex on IsarCollection<CompanySchema> {
  Future<CompanySchema?> getByCompanyId(String companyId) {
    return getByIndex(r'companyId', [companyId]);
  }

  CompanySchema? getByCompanyIdSync(String companyId) {
    return getByIndexSync(r'companyId', [companyId]);
  }

  Future<bool> deleteByCompanyId(String companyId) {
    return deleteByIndex(r'companyId', [companyId]);
  }

  bool deleteByCompanyIdSync(String companyId) {
    return deleteByIndexSync(r'companyId', [companyId]);
  }

  Future<List<CompanySchema?>> getAllByCompanyId(List<String> companyIdValues) {
    final values = companyIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'companyId', values);
  }

  List<CompanySchema?> getAllByCompanyIdSync(List<String> companyIdValues) {
    final values = companyIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'companyId', values);
  }

  Future<int> deleteAllByCompanyId(List<String> companyIdValues) {
    final values = companyIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'companyId', values);
  }

  int deleteAllByCompanyIdSync(List<String> companyIdValues) {
    final values = companyIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'companyId', values);
  }

  Future<Id> putByCompanyId(CompanySchema object) {
    return putByIndex(r'companyId', object);
  }

  Id putByCompanyIdSync(CompanySchema object, {bool saveLinks = true}) {
    return putByIndexSync(r'companyId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCompanyId(List<CompanySchema> objects) {
    return putAllByIndex(r'companyId', objects);
  }

  List<Id> putAllByCompanyIdSync(
    List<CompanySchema> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'companyId', objects, saveLinks: saveLinks);
  }
}

extension CompanySchemaQueryWhereSort
    on QueryBuilder<CompanySchema, CompanySchema, QWhere> {
  QueryBuilder<CompanySchema, CompanySchema, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CompanySchemaQueryWhere
    on QueryBuilder<CompanySchema, CompanySchema, QWhereClause> {
  QueryBuilder<CompanySchema, CompanySchema, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<CompanySchema, CompanySchema, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterWhereClause>
  companyIdEqualTo(String companyId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'companyId', value: [companyId]),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterWhereClause>
  companyIdNotEqualTo(String companyId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'companyId',
                lower: [],
                upper: [companyId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'companyId',
                lower: [companyId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'companyId',
                lower: [companyId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'companyId',
                lower: [],
                upper: [companyId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension CompanySchemaQueryFilter
    on QueryBuilder<CompanySchema, CompanySchema, QFilterCondition> {
  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  autoPrintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'autoPrint'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  autoPrintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'autoPrint'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  autoPrintEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'autoPrint', value: value),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'city'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'city'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition> cityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'city',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  cityStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  cityEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  cityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'city',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition> cityMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'city',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'city', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'city', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'companyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'companyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'companyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'companyId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'companyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'companyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'companyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'companyId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'companyId', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  companyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'companyId', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  defaultStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'defaultStartDate'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  defaultStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'defaultStartDate'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  defaultStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'defaultStartDate', value: value),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  defaultStartDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultStartDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  defaultStartDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultStartDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  defaultStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultStartDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'logoUrl'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'logoUrl'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'logoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'logoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'logoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'logoUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'logoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'logoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'logoUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'logoUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'logoUrl', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  logoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'logoUrl', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'phone1'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'phone1'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1EqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'phone1',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phone1',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phone1',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phone1',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1StartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'phone1',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1EndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'phone1',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'phone1',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'phone1',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phone1', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'phone1', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'phone2'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'phone2'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2EqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'phone2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phone2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phone2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phone2',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2StartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'phone2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2EndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'phone2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'phone2',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'phone2',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phone2', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  phone2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'phone2', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tinNumber'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tinNumber'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tinNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tinNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tinNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tinNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tinNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tinNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tinNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tinNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tinNumber', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tinNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tinNumber', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tradeName'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tradeName'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tradeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tradeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tradeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tradeName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tradeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tradeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tradeName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tradeName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tradeName', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  tradeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tradeName', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  updatedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'wereda'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'wereda'),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'wereda',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'wereda',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'wereda',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'wereda',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'wereda',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'wereda',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'wereda',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'wereda',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'wereda', value: ''),
      );
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterFilterCondition>
  weredaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'wereda', value: ''),
      );
    });
  }
}

extension CompanySchemaQueryObject
    on QueryBuilder<CompanySchema, CompanySchema, QFilterCondition> {}

extension CompanySchemaQueryLinks
    on QueryBuilder<CompanySchema, CompanySchema, QFilterCondition> {}

extension CompanySchemaQuerySortBy
    on QueryBuilder<CompanySchema, CompanySchema, QSortBy> {
  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByAutoPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoPrint', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  sortByAutoPrintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoPrint', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  sortByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  sortByDefaultStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultStartDate', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  sortByDefaultStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultStartDate', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByLogoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByLogoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByPhone1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone1', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByPhone1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone1', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByPhone2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone2', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByPhone2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone2', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByTinNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tinNumber', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  sortByTinNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tinNumber', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByTradeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tradeName', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  sortByTradeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tradeName', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByWereda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wereda', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> sortByWeredaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wereda', Sort.desc);
    });
  }
}

extension CompanySchemaQuerySortThenBy
    on QueryBuilder<CompanySchema, CompanySchema, QSortThenBy> {
  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByAutoPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoPrint', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  thenByAutoPrintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoPrint', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  thenByCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyId', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  thenByDefaultStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultStartDate', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  thenByDefaultStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultStartDate', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByLogoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByLogoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoUrl', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByPhone1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone1', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByPhone1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone1', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByPhone2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone2', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByPhone2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone2', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByTinNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tinNumber', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  thenByTinNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tinNumber', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByTradeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tradeName', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  thenByTradeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tradeName', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByWereda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wereda', Sort.asc);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QAfterSortBy> thenByWeredaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wereda', Sort.desc);
    });
  }
}

extension CompanySchemaQueryWhereDistinct
    on QueryBuilder<CompanySchema, CompanySchema, QDistinct> {
  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByAutoPrint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoPrint');
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByCity({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByCompanyId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct>
  distinctByDefaultStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultStartDate');
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByLogoUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByPhone1({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByPhone2({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByTinNumber({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tinNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByTradeName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tradeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<CompanySchema, CompanySchema, QDistinct> distinctByWereda({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wereda', caseSensitive: caseSensitive);
    });
  }
}

extension CompanySchemaQueryProperty
    on QueryBuilder<CompanySchema, CompanySchema, QQueryProperty> {
  QueryBuilder<CompanySchema, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CompanySchema, bool?, QQueryOperations> autoPrintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoPrint');
    });
  }

  QueryBuilder<CompanySchema, String?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<CompanySchema, String, QQueryOperations> companyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyId');
    });
  }

  QueryBuilder<CompanySchema, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CompanySchema, DateTime?, QQueryOperations>
  defaultStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultStartDate');
    });
  }

  QueryBuilder<CompanySchema, String?, QQueryOperations> logoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoUrl');
    });
  }

  QueryBuilder<CompanySchema, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CompanySchema, String?, QQueryOperations> phone1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone1');
    });
  }

  QueryBuilder<CompanySchema, String?, QQueryOperations> phone2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone2');
    });
  }

  QueryBuilder<CompanySchema, String?, QQueryOperations> tinNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tinNumber');
    });
  }

  QueryBuilder<CompanySchema, String?, QQueryOperations> tradeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tradeName');
    });
  }

  QueryBuilder<CompanySchema, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CompanySchema, String?, QQueryOperations> weredaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wereda');
    });
  }
}
