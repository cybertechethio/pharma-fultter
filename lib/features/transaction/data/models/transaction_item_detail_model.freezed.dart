// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionItemDetailModel {

@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get id;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get itemId; String get itemName; String get itemCode;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get quantity;@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int get taxRate;@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double get total;@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime get createdAt;@JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson) List<TransactionItemBatchDetailModel> get batches;
/// Create a copy of TransactionItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionItemDetailModelCopyWith<TransactionItemDetailModel> get copyWith => _$TransactionItemDetailModelCopyWithImpl<TransactionItemDetailModel>(this as TransactionItemDetailModel, _$identity);

  /// Serializes this TransactionItemDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionItemDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.total, total) || other.total == total)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.batches, batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,quantity,taxRate,total,createdAt,const DeepCollectionEquality().hash(batches));

@override
String toString() {
  return 'TransactionItemDetailModel(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, taxRate: $taxRate, total: $total, createdAt: $createdAt, batches: $batches)';
}


}

/// @nodoc
abstract mixin class $TransactionItemDetailModelCopyWith<$Res>  {
  factory $TransactionItemDetailModelCopyWith(TransactionItemDetailModel value, $Res Function(TransactionItemDetailModel) _then) = _$TransactionItemDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int itemId, String itemName, String itemCode,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int taxRate,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double total,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime createdAt,@JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson) List<TransactionItemBatchDetailModel> batches
});




}
/// @nodoc
class _$TransactionItemDetailModelCopyWithImpl<$Res>
    implements $TransactionItemDetailModelCopyWith<$Res> {
  _$TransactionItemDetailModelCopyWithImpl(this._self, this._then);

  final TransactionItemDetailModel _self;
  final $Res Function(TransactionItemDetailModel) _then;

/// Create a copy of TransactionItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? taxRate = null,Object? total = null,Object? createdAt = null,Object? batches = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,batches: null == batches ? _self.batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransactionItemBatchDetailModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionItemDetailModel].
extension TransactionItemDetailModelPatterns on TransactionItemDetailModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionItemDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionItemDetailModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionItemDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionItemDetailModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionItemDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionItemDetailModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int itemId,  String itemName,  String itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int taxRate, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt, @JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson)  List<TransactionItemBatchDetailModel> batches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionItemDetailModel() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.taxRate,_that.total,_that.createdAt,_that.batches);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int itemId,  String itemName,  String itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int taxRate, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt, @JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson)  List<TransactionItemBatchDetailModel> batches)  $default,) {final _that = this;
switch (_that) {
case _TransactionItemDetailModel():
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.taxRate,_that.total,_that.createdAt,_that.batches);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int id, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int itemId,  String itemName,  String itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double quantity, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)  int taxRate, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)  double total, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)  DateTime createdAt, @JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson)  List<TransactionItemBatchDetailModel> batches)?  $default,) {final _that = this;
switch (_that) {
case _TransactionItemDetailModel() when $default != null:
return $default(_that.id,_that.itemId,_that.itemName,_that.itemCode,_that.quantity,_that.taxRate,_that.total,_that.createdAt,_that.batches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionItemDetailModel implements TransactionItemDetailModel {
  const _TransactionItemDetailModel({@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.id, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.itemId, required this.itemName, required this.itemCode, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.quantity, @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required this.taxRate, @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) required this.total, @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) required this.createdAt, @JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson) required final  List<TransactionItemBatchDetailModel> batches}): _batches = batches;
  factory _TransactionItemDetailModel.fromJson(Map<String, dynamic> json) => _$TransactionItemDetailModelFromJson(json);

@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int id;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int itemId;
@override final  String itemName;
@override final  String itemCode;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double quantity;
@override@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) final  int taxRate;
@override@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) final  double total;
@override@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) final  DateTime createdAt;
 final  List<TransactionItemBatchDetailModel> _batches;
@override@JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson) List<TransactionItemBatchDetailModel> get batches {
  if (_batches is EqualUnmodifiableListView) return _batches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_batches);
}


/// Create a copy of TransactionItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionItemDetailModelCopyWith<_TransactionItemDetailModel> get copyWith => __$TransactionItemDetailModelCopyWithImpl<_TransactionItemDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionItemDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionItemDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.itemCode, itemCode) || other.itemCode == itemCode)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.taxRate, taxRate) || other.taxRate == taxRate)&&(identical(other.total, total) || other.total == total)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._batches, _batches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemId,itemName,itemCode,quantity,taxRate,total,createdAt,const DeepCollectionEquality().hash(_batches));

@override
String toString() {
  return 'TransactionItemDetailModel(id: $id, itemId: $itemId, itemName: $itemName, itemCode: $itemCode, quantity: $quantity, taxRate: $taxRate, total: $total, createdAt: $createdAt, batches: $batches)';
}


}

/// @nodoc
abstract mixin class _$TransactionItemDetailModelCopyWith<$Res> implements $TransactionItemDetailModelCopyWith<$Res> {
  factory _$TransactionItemDetailModelCopyWith(_TransactionItemDetailModel value, $Res Function(_TransactionItemDetailModel) _then) = __$TransactionItemDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int id,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int itemId, String itemName, String itemCode,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double quantity,@JsonKey(fromJson: JsonTypeConverters.intFromDynamic) int taxRate,@JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic) double total,@JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic) DateTime createdAt,@JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson) List<TransactionItemBatchDetailModel> batches
});




}
/// @nodoc
class __$TransactionItemDetailModelCopyWithImpl<$Res>
    implements _$TransactionItemDetailModelCopyWith<$Res> {
  __$TransactionItemDetailModelCopyWithImpl(this._self, this._then);

  final _TransactionItemDetailModel _self;
  final $Res Function(_TransactionItemDetailModel) _then;

/// Create a copy of TransactionItemDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemId = null,Object? itemName = null,Object? itemCode = null,Object? quantity = null,Object? taxRate = null,Object? total = null,Object? createdAt = null,Object? batches = null,}) {
  return _then(_TransactionItemDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,itemCode: null == itemCode ? _self.itemCode : itemCode // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,taxRate: null == taxRate ? _self.taxRate : taxRate // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,batches: null == batches ? _self._batches : batches // ignore: cast_nullable_to_non_nullable
as List<TransactionItemBatchDetailModel>,
  ));
}


}

// dart format on
