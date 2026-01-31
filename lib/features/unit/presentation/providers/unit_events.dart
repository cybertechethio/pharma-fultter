import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/unit.dart';
import '../../../../core/errors/failure.dart';

part 'unit_events.g.dart';

sealed class UnitUiEvent {}

class UnitCreated extends UnitUiEvent {
  final UnitEntity entity;
  final String message;
  UnitCreated(this.entity, this.message);
}

class UnitUpdated extends UnitUiEvent {
  final UnitEntity entity;
  final String message;
  UnitUpdated(this.entity, this.message);
}

class UnitDeleted extends UnitUiEvent {
  final String id;
  final String message;
  UnitDeleted(this.id, this.message);
}

class UnitFailure extends UnitUiEvent {
  final Failure failure;
  UnitFailure(this.failure);
}

@riverpod
class UnitUiEvents extends _$UnitUiEvents {
  @override
  UnitUiEvent? build() {
    return null;
  }

  void emit(UnitUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

