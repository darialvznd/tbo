import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo_zavyalova/models/offer.dart';
import 'package:tbo_zavyalova/repositories/offer_repository.dart';

import 'offer_event.dart';
import 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  int page = 1;
  bool isFetching = false;
  final OfferRepository repository;

  OfferBloc({this.repository})
      : assert(repository != null),
        super(OfferEmptyState());

  @override
  Stream<OfferState> mapEventToState(event) async* {
    if (event is OfferFetchEvent) {
      yield OfferLoadingState();
      try {
        //  int id = event.idOfferType;
        final List<Offer> offerList = await repository.loadByPage(page);
        if (offerList != null && offerList.isNotEmpty) {
          yield OfferLoadedState(offerList);
          page++;
        } else {
          yield OfferEmptyState();
        }
      } catch (e) {
        yield OfferErrorState();
      }
    }
  }
}
