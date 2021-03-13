import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo/blocs/offer/offer_event.dart';
import 'package:tbo/blocs/offer/offer_state.dart';
import 'package:tbo/models/offer.dart';
import 'package:tbo/repositories/offer_repository.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final OfferRepository repository;

  OfferBloc({this.repository})
      : assert(repository != null),
        super(OfferEmptyState());

  @override
  Stream<OfferState> mapEventToState(event) async* {
    if (event is OfferLoadEvent) {
      yield OfferLoadingState();
      try {
        //  int id = event.idOfferType;
        final List<Offer> offerList = await repository.load();
        if (offerList != null && offerList.isNotEmpty) {
          yield OfferLoadedState(offerList);
        } else {
          yield OfferEmptyState();
        }
      } catch (e) {
        yield OfferErrorState();
      }
    }
  }
}
