abstract class EventListEvents {}

class InitialEventListEvents extends EventListEvents {}

class EventListRequestEvent extends EventListEvents {
  String? queryString;

  EventListRequestEvent({this.queryString});
}
