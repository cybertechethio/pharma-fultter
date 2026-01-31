// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PaginationModel', json, ($checkedConvert) {
      final val = _PaginationModel(
        currentPage: $checkedConvert('currentPage', (v) => (v as num).toInt()),
        totalPages: $checkedConvert('totalPages', (v) => (v as num).toInt()),
        totalItems: $checkedConvert('totalItems', (v) => (v as num).toInt()),
        itemsPerPage: $checkedConvert(
          'itemsPerPage',
          (v) => (v as num).toInt(),
        ),
        hasNextPage: $checkedConvert('hasNextPage', (v) => v as bool),
        hasPrevPage: $checkedConvert('hasPrevPage', (v) => v as bool),
        nextPage: $checkedConvert('nextPage', (v) => (v as num?)?.toInt()),
        prevPage: $checkedConvert('prevPage', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$PaginationModelToJson(_PaginationModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalItems': instance.totalItems,
      'itemsPerPage': instance.itemsPerPage,
      'hasNextPage': instance.hasNextPage,
      'hasPrevPage': instance.hasPrevPage,
      'nextPage': ?instance.nextPage,
      'prevPage': ?instance.prevPage,
    };
