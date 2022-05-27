import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rushik_digital_14_task/bloc/event_list_events.dart';
import '../entities/event_list_item_entity.dart';
import '../repositories/api_repository.dart';
import 'event_list_states.dart';

class EventListBloc extends Bloc<EventListEvents, EventListStates> {
  final ApiRepository _apiRepository;

  EventListBloc(this._apiRepository) : super(InitialEventListStates()) {
    on<EventListRequestEvent>((event, emit) async {
      try {
        emit(LoadingState());
        EventListItemEntity responseData =
            await _apiRepository.fetchEventList(queryString: event.queryString);
        if (responseData.error==null) {
          emit(EventListResponseState(responseData));
        } else {
          emit(ErrorState(responseData.error!));
        }
      } on NetworkError {
        emit(ErrorState("Device is offline :("));
      }
    });
  }
}
