abstract class OfferEvent {}

class OfferLoadEvent extends OfferEvent {
//  final int idOfferType;
  OfferLoadEvent();
}

class OfferFetchEvent extends OfferEvent {
  OfferFetchEvent();
}
