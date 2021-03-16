abstract class OfferEvent {
  @override
  List<Object> get props => [];
}

class OfferLoadEvent extends OfferEvent {
//  final int idOfferType;
  OfferLoadEvent();
}

class OfferFetchEvent extends OfferEvent {
  OfferFetchEvent();
}
