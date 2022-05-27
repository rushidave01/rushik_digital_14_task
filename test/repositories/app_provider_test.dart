import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:rushik_digital_14_task/entities/event_list_item_entity.dart';
import 'package:rushik_digital_14_task/repositories/api_provider.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  String baseUrl = "";
  setUp(() {
    dio.httpClientAdapter = dioAdapter;
    baseUrl =
        'https://api.seatgeek.com/2/events?client_id=MjcxMzU3MTh8MTY1MzQ2NzgxMC4yNDYzNjA1&q=';
  });
  group("Eventlist Api cases", (){
    test("event list api test", () async {
      String data = File('test/asset/event_list_response.json').readAsStringSync();
      var jsonResult = json.decode(data);
      // print(jsonResult);

      dioAdapter.onGet(
        baseUrl,
            (request) {
          return request.reply(200, jsonResult);
        }
      );
      final provider = ApiProvider(dio);
      final response = await provider.fetchEventList(queryString: "");
      expect(response.events!.length, EventListItemEntity.fromJson(jsonResult).events!.length);
    });

    test("event list api test with search query", () async {
      String queryStringData = File('test/asset/event_list_query_string_response.json').readAsStringSync();
      var jsonResult = json.decode(queryStringData);

      dioAdapter.onGet(
        "${baseUrl}Texas+Ranger",
            (request) {
          return request.reply(200, jsonResult);
        }
      );
      final provider = ApiProvider(dio);
      final response = await provider.fetchEventList(queryString: "Texas+Ranger");
      expect(response.events!.length, EventListItemEntity.fromJson(jsonResult).events!.length);
    });
    test("event list api test with Error Response", () async {
      dioAdapter.onGet(
        "${baseUrl}Texas+Ranger",
            (request) {
          return request.reply(400, EventListItemEntity.withError("Data not found / Connection issue"));
        }
      );
      final provider = ApiProvider(dio);
      final response = await provider.fetchEventList(queryString: "Texas+Ranger");
      expect(response.error, "Data not found / Connection issue");
    });
  });
}
