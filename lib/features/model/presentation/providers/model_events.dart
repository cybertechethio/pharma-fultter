import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/model.dart';
import '../../../../core/errors/failure.dart';

part 'model_events.g.dart';

sealed class ModelUiEvent {}

class ModelCreated extends ModelUiEvent {
  final ModelEntity entity;
  final String message;
  ModelCreated(this.entity, this.message);
}

class ModelUpdated extends ModelUiEvent {
  final ModelEntity entity;
  final String message;
  ModelUpdated(this.entity, this.message);
}

class ModelDeleted extends ModelUiEvent {
  final String id;
  final String message;
  ModelDeleted(this.id, this.message);
}

class ModelFailure extends ModelUiEvent {
  final Failure failure;
  ModelFailure(this.failure);
}

@riverpod
class ModelUiEvents extends _$ModelUiEvents {
  @override
  ModelUiEvent? build() {
    return null;
  }

  void emit(ModelUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

