import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rushik_digital_14_task/bloc/event_list_bloc.dart';
import 'package:rushik_digital_14_task/bloc/event_list_events.dart';
import 'package:rushik_digital_14_task/bloc/event_list_states.dart';
import 'package:rushik_digital_14_task/common/common_dialog.dart';
import 'package:rushik_digital_14_task/ui/event_detail_page.dart';
import '../common/event_list_tile_widget.dart';

class EventListingPage extends StatefulWidget {
  const EventListingPage({Key? key}) : super(key: key);

  @override
  State<EventListingPage> createState() => _EventListingPageState();
}

class _EventListingPageState extends State<EventListingPage> {
  late TextEditingController searchTextFieldController;
  late FocusNode searchNode;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventListBloc>(context).add(EventListRequestEvent());
    searchTextFieldController = TextEditingController();
    searchNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(15, 50, 69, 1),
          toolbarHeight: size.height / 13,
          title: SizedBox(
            height: 40,
            child: getSearchBar(),
          ),
        ),
        body: BlocConsumer<EventListBloc, EventListStates>(
            listener: (bloc, state) {
          if (state is ErrorState) {
            CommonDialog(
                    context: context, title: "Alert!", message: state.message)
                .showAlert();
          }
        }, builder: (context, state) {
          return (state is LoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is EventListResponseState)
                  ? ListView.builder(
                      itemCount: state.entity.events!.length,
                      itemBuilder: (context, index) {
                        return EventListTileWidget(
                          imageSource: state
                                  .entity.events![index].performers![0].image ??
                              "",
                          title: state.entity.events![index].title!,
                          cityName:
                              "${state.entity.events![index].venue!.name!}, ${state.entity.events![index].venue!.state!}",
                          dateAndTime:
                              state.entity.events![index].getFormattedDate(),
                          isLiked: false,
                          callback: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventDetailPage(
                                  event: state.entity.events![index],
                                ),
                              ),
                            );
                          },
                        );
                      })
                  : const Center(
                      child: Text("No data found!!!"),
                    );
        }),
      ),
    );
  }

  Widget getSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.white.withOpacity(0.4),
            child: TextField(
              controller: searchTextFieldController,
              focusNode: searchNode,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              onChanged: (String value) {
                BlocProvider.of<EventListBloc>(context).add(
                    EventListRequestEvent(
                        queryString: value.replaceAll(" ", "+")));
              },
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Search",
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: const TextStyle(color: Colors.white, fontSize: 14),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 14,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    searchTextFieldController.clear();
                    BlocProvider.of<EventListBloc>(context)
                        .add(EventListRequestEvent());
                  },
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            BlocProvider.of<EventListBloc>(context)
                .add(EventListRequestEvent());
            searchTextFieldController.clear();
            searchNode.unfocus();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
