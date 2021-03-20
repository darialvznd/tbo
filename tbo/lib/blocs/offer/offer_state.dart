import 'package:tbo/models/offer.dart';

abstract class OfferState {}

class OfferEmptyState extends OfferState {}

class OfferLoadingState extends OfferState {}

class OfferLoadedState extends OfferState {
  List<Offer> offers;
  OfferLoadedState(this.offers);
}

class OfferErrorState extends OfferState {}
