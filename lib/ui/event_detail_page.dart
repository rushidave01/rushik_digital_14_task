import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rushik_digital_14_task/entities/event_list_item_entity.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as Events;
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios,color: Colors.blueAccent,),
                ),
                Expanded(
                  child: Text(
                    event.title!,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Divider(
              height: 0.2,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Image.network(
                event.performers![0].image??"",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width/1.12,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('EEE, d MMM yyyy hh:mm a')
                    .format(DateTime.parse(
                    event.datetimeUtc!)),style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${event.venue!.name!}, ${event.venue!.state!}",
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
