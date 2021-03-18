import 'package:tbo_zavyalova/models/offer.dart';

abstract class OfferSearchState {}

class SearchStateEmpty extends OfferSearchState {}

class SearchStateLoading extends OfferSearchState {
  final bool showProgressBar;
  SearchStateLoading(this.showProgressBar);
}

class SearchStateSuccess extends OfferSearchState {
  final List<Offer> items;
  SearchStateSuccess(this.items);
  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends OfferSearchState {
  final String error;
  SearchStateError(this.error);
}
