import 'package:rushik_digital_14_task/entities/event_list_item_entity.dart';

abstract class EventListStates {}

class InitialEventListStates extends EventListStates {}

class EventListResponseState extends EventListStates {
  EventListItemEntity entity;

  EventListResponseState(this.entity);
}

class LoadingState extends EventListStates {}

class ErrorState extends EventListStates {
  String message;

  ErrorState(this.message);
}
