import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/offer/offer_bloc.dart';
import '../blocs/offer/offer_event.dart';
import '../blocs/offer/offer_state.dart';
import '../models/offer.dart';
import '../offer_list_item.dart';

class OfferListPage extends StatefulWidget {
  @override
  _OfferListPageState createState() => _OfferListPageState();
}

OfferBloc offerListBloc;

class _OfferListPageState extends State<OfferListPage> {
  final List<Offer> _offers = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      offerListBloc = BlocProvider.of<OfferBloc>(context);
      offerListBloc.add(OfferLoadEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<OfferBloc, OfferState>(builder: (context, state) {
        if (state is OfferEmptyState) {
          return Text('В данном разделе информация отсутствует');
        } else if (state is OfferLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is OfferLoadedState) {
          _offers.addAll(state.offers);
          context.bloc<OfferBloc>().isFetching = false;
          Scaffold.of(context).hideCurrentSnackBar();
        } else if (state is OfferErrorState && _offers.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                color: Colors.red,
                onPressed: () {
                  context.bloc<OfferBloc>()
                    ..isFetching = true
                    ..add(OfferFetchEvent());
                },
                icon: Icon(Icons.refresh),
              ),
              const SizedBox(height: 15),
              Text('error', textAlign: TextAlign.center),
            ],
          );
        }
        return ListView.separated(
          controller: _scrollController
            ..addListener(() {
              if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent &&
                  !context.bloc<OfferBloc>().isFetching) {
                context.bloc<OfferBloc>()
                  ..isFetching = true
                  ..add(OfferFetchEvent());
              }
            }),
          itemBuilder: (context, index) => OfferListItem(_offers[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: _offers.length,
        );
        // }
        //  else {
        //   return SingleChildScrollView(
        //       child: Center(child: Text(state.offers.length.toString())));
        // return ListView.separated(
        //   controller: _scrollController
        //     ..addListener(() {
        //       if (_scrollController.offset ==
        //               _scrollController.position.maxScrollExtent &&
        //           !context.bloc<OfferBloc>().isFetching) {
        //         context.bloc<OfferBloc>()
        //           ..isFetching = true
        //           ..add(OfferFetchEvent());
        //       }
        //     }),
        //   itemBuilder: (context, index) => OfferListItem(_offers[index]),
        //   separatorBuilder: (context, index) => const SizedBox(height: 20),
        //   itemCount: _offers.length,
        // );
      })),
    );
  }
}
