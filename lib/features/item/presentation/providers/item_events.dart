import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/item.dart';
import '../../../../core/errors/failure.dart';

part 'item_events.g.dart';

sealed class ItemUiEvent {}

class ItemCreated extends ItemUiEvent {
  final Item entity;
  final String message;
  ItemCreated(this.entity, this.message);
}

class ItemUpdated extends ItemUiEvent {
  final Item entity;
  final String message;
  ItemUpdated(this.entity, this.message);
}

class ItemDeleted extends ItemUiEvent {
  final int id;
  final String message;
  ItemDeleted(this.id, this.message);
}

class ItemFailure extends ItemUiEvent {
  final Failure failure;
  ItemFailure(this.failure);
}

@riverpod
class ItemUiEvents extends _$ItemUiEvents {
  @override
  ItemUiEvent? build() {
    return null;
  }

  void emit(ItemUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

