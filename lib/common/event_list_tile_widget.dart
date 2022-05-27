import 'package:flutter/material.dart';

class EventListTileWidget extends StatelessWidget {
  final String imageSource, title, cityName, dateAndTime;
  final bool isLiked;
  final VoidCallback callback;

  const EventListTileWidget(
      {Key? key,
      required this.imageSource,
      required this.title,
      required this.cityName,
      required this.dateAndTime,
      this.isLiked = false,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Stack(
            children: [
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Image.network(
                  imageSource,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text("Invalid Data");
                  },
                ),
              ),
              Visibility(
                  visible: isLiked,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 22,
                  )),
            ],
          ),
          title: Text(
            title,
            maxLines: 1,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 3,
              ),
              Text(
                cityName,
                maxLines: 1,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                dateAndTime,
                maxLines: 1,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          onTap: callback,
        ),
        const Divider(
          height: 0.1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
