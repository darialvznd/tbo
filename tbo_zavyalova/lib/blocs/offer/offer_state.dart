import 'package:tbo_zavyalova/models/offer.dart';

abstract class OfferState {
//  get offers => null;
}

class OfferEmptyState extends OfferState {}

class OfferLoadingState extends OfferState {
  final bool showProgressBar;

  OfferLoadingState(this.showProgressBar);
}

class OfferLoadedState extends OfferState {
  List<Offer> offers;
  OfferLoadedState(this.offers);
}

class OfferErrorState extends OfferState {}
