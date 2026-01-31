// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_context_model.freezed.dart';
part 'current_context_model.g.dart';

@freezed
sealed class CurrentContextModel with _$CurrentContextModel {
  const factory CurrentContextModel({
    @JsonKey(fromJson: _idFromJson) String? currentCompanyId,
    @JsonKey(fromJson: _idFromJson) String? currentBranchId,
  }) = _CurrentContextModel;

  factory CurrentContextModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentContextModelFromJson(json);
}

/// Helper function to convert id from int to String
String? _idFromJson(dynamic value) {
  if (value == null) {
    return null;
  }
  
  if (value is int) {
    return value.toString();
  } else if (value is String) {
    return value;
  } else {
    throw ArgumentError('Expected int or String for id, got ${value.runtimeType}');
  }
}
