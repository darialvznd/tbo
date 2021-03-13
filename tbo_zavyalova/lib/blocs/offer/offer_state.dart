import 'package:tbo_zavyalova/models/offer.dart';
import 'package:flutter/foundation.dart';

abstract class OfferState {
  get offers => null;
}

class OfferEmptyState extends OfferState {}

class OfferLoadingState extends OfferState {}

class OfferLoadedState extends OfferState {
  List<Offer> offers;
  OfferLoadedState(this.offers);
}

class OfferErrorState extends OfferState {}
