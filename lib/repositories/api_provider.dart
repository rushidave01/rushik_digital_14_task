import 'package:dio/dio.dart';
import '../entities/event_list_item_entity.dart';

class ApiProvider {
  final Dio _dio;
  final String _url = 'https://api.seatgeek.com/2/events?client_id=MjcxMzU3MTh8MTY1MzQ2NzgxMC4yNDYzNjA1&q=';
  ApiProvider(this._dio);

  Future<EventListItemEntity> fetchEventList({String? queryString}) async {
    try {
      Response response = await _dio.get(_url+queryString!);
      EventListItemEntity responseData = EventListItemEntity.fromJson(response.data);
      return responseData;
    } catch (error) {
      return EventListItemEntity.withError("Data not found / Connection issue");
    }
  }
}