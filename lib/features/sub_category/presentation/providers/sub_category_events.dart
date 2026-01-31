import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/sub_category.dart';
import '../../../../core/errors/failure.dart';

part 'sub_category_events.g.dart';

sealed class SubCategoryUiEvent {}

class SubCategoryCreated extends SubCategoryUiEvent {
  final SubCategory entity;
  final String message;
  SubCategoryCreated(this.entity, this.message);
}

class SubCategoryUpdated extends SubCategoryUiEvent {
  final SubCategory entity;
  final String message;
  SubCategoryUpdated(this.entity, this.message);
}

class SubCategoryDeleted extends SubCategoryUiEvent {
  final String id;
  final String message;
  SubCategoryDeleted(this.id, this.message);
}

class SubCategoryFailure extends SubCategoryUiEvent {
  final Failure failure;
  SubCategoryFailure(this.failure);
}

@riverpod
class SubCategoryUiEvents extends _$SubCategoryUiEvents {
  @override
  SubCategoryUiEvent? build() {
    return null;
  }

  void emit(SubCategoryUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

