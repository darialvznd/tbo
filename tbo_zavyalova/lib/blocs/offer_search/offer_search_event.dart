import 'package:equatable/equatable.dart';

class OfferSearchEvent extends Equatable {
  OfferSearchEvent();
}

class TextChanged extends OfferSearchEvent {
  final int categoryId;
  final String searchText;
  TextChanged({this.categoryId, this.searchText});
  @override
  List<Object> get props => [searchText];
  @override
  String toString() => 'TextChanged { text: $searchText }';
}

class OfferSearchLoadEvent extends OfferSearchEvent {
  OfferSearchLoadEvent();
}

class OfferSearchFetchEvent extends OfferSearchEvent {
  final int categoryId;
  final String searchText;
  OfferSearchFetchEvent({this.categoryId, this.searchText});
}
