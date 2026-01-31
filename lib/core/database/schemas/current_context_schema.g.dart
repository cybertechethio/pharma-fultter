// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_context_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCurrentContextSchemaCollection on Isar {
  IsarCollection<CurrentContextSchema> get currentContextSchemas =>
      this.collection();
}

const CurrentContextSchemaSchema = CollectionSchema(
  name: r'CurrentContextSchema',
  id: 9136945958358873300,
  properties: {
    r'currentBranchId': PropertySchema(
      id: 0,
      name: r'currentBranchId',
      type: IsarType.string,
    ),
    r'currentCompanyId': PropertySchema(
      id: 1,
      name: r'currentCompanyId',
      type: IsarType.string,
    ),
    r'singleton': PropertySchema(
      id: 2,
      name: r'singleton',
      type: IsarType.long,
    ),
  },

  estimateSize: _currentContextSchemaEstimateSize,
  serialize: _currentContextSchemaSerialize,
  deserialize: _currentContextSchemaDeserialize,
  deserializeProp: _currentContextSchemaDeserializeProp,
  idName: r'id',
  indexes: {
    r'singleton': IndexSchema(
      id: 2456010557685550950,
      name: r'singleton',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'singleton',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _currentContextSchemaGetId,
  getLinks: _currentContextSchemaGetLinks,
  attach: _currentContextSchemaAttach,
  version: '3.3.0',
);

int _currentContextSchemaEstimateSize(
  CurrentContextSchema object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.currentBranchId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.currentCompanyId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _currentContextSchemaSerialize(
  CurrentContextSchema object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.currentBranchId);
  writer.writeString(offsets[1], object.currentCompanyId);
  writer.writeLong(offsets[2], object.singleton);
}

CurrentContextSchema _currentContextSchemaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CurrentContextSchema();
  object.currentBranchId = reader.readStringOrNull(offsets[0]);
  object.currentCompanyId = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.singleton = reader.readLong(offsets[2]);
  return object;
}

P _currentContextSchemaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _currentContextSchemaGetId(CurrentContextSchema object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _currentContextSchemaGetLinks(
  CurrentContextSchema object,
) {
  return [];
}

void _currentContextSchemaAttach(
  IsarCollection<dynamic> col,
  Id id,
  CurrentContextSchema object,
) {
  object.id = id;
}

extension CurrentContextSchemaByIndex on IsarCollection<CurrentContextSchema> {
  Future<CurrentContextSchema?> getBySingleton(int singleton) {
    return getByIndex(r'singleton', [singleton]);
  }

  CurrentContextSchema? getBySingletonSync(int singleton) {
    return getByIndexSync(r'singleton', [singleton]);
  }

  Future<bool> deleteBySingleton(int singleton) {
    return deleteByIndex(r'singleton', [singleton]);
  }

  bool deleteBySingletonSync(int singleton) {
    return deleteByIndexSync(r'singleton', [singleton]);
  }

  Future<List<CurrentContextSchema?>> getAllBySingleton(
    List<int> singletonValues,
  ) {
    final values = singletonValues.map((e) => [e]).toList();
    return getAllByIndex(r'singleton', values);
  }

  List<CurrentContextSchema?> getAllBySingletonSync(List<int> singletonValues) {
    final values = singletonValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'singleton', values);
  }

  Future<int> deleteAllBySingleton(List<int> singletonValues) {
    final values = singletonValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'singleton', values);
  }

  int deleteAllBySingletonSync(List<int> singletonValues) {
    final values = singletonValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'singleton', values);
  }

  Future<Id> putBySingleton(CurrentContextSchema object) {
    return putByIndex(r'singleton', object);
  }

  Id putBySingletonSync(CurrentContextSchema object, {bool saveLinks = true}) {
    return putByIndexSync(r'singleton', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySingleton(List<CurrentContextSchema> objects) {
    return putAllByIndex(r'singleton', objects);
  }

  List<Id> putAllBySingletonSync(
    List<CurrentContextSchema> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'singleton', objects, saveLinks: saveLinks);
  }
}

extension CurrentContextSchemaQueryWhereSort
    on QueryBuilder<CurrentContextSchema, CurrentContextSchema, QWhere> {
  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhere>
  anySingleton() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'singleton'),
      );
    });
  }
}

extension CurrentContextSchemaQueryWhere
    on QueryBuilder<CurrentContextSchema, CurrentContextSchema, QWhereClause> {
  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
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

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
  idBetween(
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

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
  singletonEqualTo(int singleton) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'singleton', value: [singleton]),
      );
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
  singletonNotEqualTo(int singleton) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'singleton',
                lower: [],
                upper: [singleton],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'singleton',
                lower: [singleton],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'singleton',
                lower: [singleton],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'singleton',
                lower: [],
                upper: [singleton],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
  singletonGreaterThan(int singleton, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'singleton',
          lower: [singleton],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
  singletonLessThan(int singleton, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'singleton',
          lower: [],
          upper: [singleton],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterWhereClause>
  singletonBetween(
    int lowerSingleton,
    int upperSingleton, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'singleton',
          lower: [lowerSingleton],
          includeLower: includeLower,
          upper: [upperSingleton],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CurrentContextSchemaQueryFilter
    on
        QueryBuilder<
          CurrentContextSchema,
          CurrentContextSchema,
          QFilterCondition
        > {
  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentBranchId'),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentBranchId'),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currentBranchId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentBranchId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentBranchId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentBranchId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'currentBranchId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'currentBranchId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'currentBranchId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'currentBranchId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentBranchId', value: ''),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentBranchIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'currentBranchId', value: ''),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentCompanyId'),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentCompanyId'),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currentCompanyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentCompanyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentCompanyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentCompanyId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'currentCompanyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'currentCompanyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'currentCompanyId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'currentCompanyId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentCompanyId', value: ''),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  currentCompanyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'currentCompanyId', value: ''),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  idBetween(
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

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  singletonEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'singleton', value: value),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  singletonGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'singleton',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  singletonLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'singleton',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    CurrentContextSchema,
    CurrentContextSchema,
    QAfterFilterCondition
  >
  singletonBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'singleton',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CurrentContextSchemaQueryObject
    on
        QueryBuilder<
          CurrentContextSchema,
          CurrentContextSchema,
          QFilterCondition
        > {}

extension CurrentContextSchemaQueryLinks
    on
        QueryBuilder<
          CurrentContextSchema,
          CurrentContextSchema,
          QFilterCondition
        > {}

extension CurrentContextSchemaQuerySortBy
    on QueryBuilder<CurrentContextSchema, CurrentContextSchema, QSortBy> {
  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  sortByCurrentBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBranchId', Sort.asc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  sortByCurrentBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBranchId', Sort.desc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  sortByCurrentCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentCompanyId', Sort.asc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  sortByCurrentCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentCompanyId', Sort.desc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  sortBySingleton() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singleton', Sort.asc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  sortBySingletonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singleton', Sort.desc);
    });
  }
}

extension CurrentContextSchemaQuerySortThenBy
    on QueryBuilder<CurrentContextSchema, CurrentContextSchema, QSortThenBy> {
  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  thenByCurrentBranchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBranchId', Sort.asc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  thenByCurrentBranchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentBranchId', Sort.desc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  thenByCurrentCompanyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentCompanyId', Sort.asc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  thenByCurrentCompanyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentCompanyId', Sort.desc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  thenBySingleton() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singleton', Sort.asc);
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QAfterSortBy>
  thenBySingletonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'singleton', Sort.desc);
    });
  }
}

extension CurrentContextSchemaQueryWhereDistinct
    on QueryBuilder<CurrentContextSchema, CurrentContextSchema, QDistinct> {
  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QDistinct>
  distinctByCurrentBranchId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'currentBranchId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QDistinct>
  distinctByCurrentCompanyId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'currentCompanyId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CurrentContextSchema, CurrentContextSchema, QDistinct>
  distinctBySingleton() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'singleton');
    });
  }
}

extension CurrentContextSchemaQueryProperty
    on
        QueryBuilder<
          CurrentContextSchema,
          CurrentContextSchema,
          QQueryProperty
        > {
  QueryBuilder<CurrentContextSchema, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CurrentContextSchema, String?, QQueryOperations>
  currentBranchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentBranchId');
    });
  }

  QueryBuilder<CurrentContextSchema, String?, QQueryOperations>
  currentCompanyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentCompanyId');
    });
  }

  QueryBuilder<CurrentContextSchema, int, QQueryOperations>
  singletonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'singleton');
    });
  }
}
