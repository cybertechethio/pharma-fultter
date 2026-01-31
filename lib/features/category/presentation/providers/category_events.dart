import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/category.dart';
import '../../../../core/errors/failure.dart';

part 'category_events.g.dart';

sealed class CategoryUiEvent {}

class CategoryCreated extends CategoryUiEvent {
  final Category entity;
  final String message;
  CategoryCreated(this.entity, this.message);
}

class CategoryUpdated extends CategoryUiEvent {
  final Category entity;
  final String message;
  CategoryUpdated(this.entity, this.message);
}

class CategoryDeleted extends CategoryUiEvent {
  final String id;
  final String message;
  CategoryDeleted(this.id, this.message);
}

class CategoryFailure extends CategoryUiEvent {
  final Failure failure;
  CategoryFailure(this.failure);
}

@Riverpod(keepAlive: true)
class CategoryUiEvents extends _$CategoryUiEvents {
  @override
  CategoryUiEvent? build() {
    return null;
  }

  void emit(CategoryUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

