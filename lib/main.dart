import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rushik_digital_14_task/repositories/api_repository.dart';
import 'package:rushik_digital_14_task/ui/event_listing_page.dart';

import 'bloc/event_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rushik-Digital 14',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => EventListBloc(ApiRepository()),
          )
        ],
        child: const EventListingPage(),
      ),
    );
  }
}
