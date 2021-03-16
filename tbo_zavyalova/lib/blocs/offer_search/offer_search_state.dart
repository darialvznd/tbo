import 'package:equatable/equatable.dart';
import 'package:tbo_zavyalova/models/offer.dart';

abstract class OfferSearchState extends Equatable {
  OfferSearchState();

  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends OfferSearchState {}

class SearchStateLoading extends OfferSearchState {}

class SearchStateSuccess extends OfferSearchState {
  final List<Offer> items;

  SearchStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends OfferSearchState {
  final String error;

  SearchStateError(this.error);

  @override
  List<Object> get props => [error];
}
