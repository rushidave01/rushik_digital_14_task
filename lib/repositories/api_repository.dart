import 'package:dio/dio.dart';
import 'package:rushik_digital_14_task/entities/event_list_item_entity.dart';
import 'package:rushik_digital_14_task/repositories/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider(Dio());

  Future<EventListItemEntity> fetchEventList({String? queryString}) {
    return _provider.fetchEventList(queryString: queryString??"");
  }
}

class NetworkError extends Error {}