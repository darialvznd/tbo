import 'package:equatable/equatable.dart';

abstract class OfferSearchEvent extends Equatable {
  OfferSearchEvent();
}

class TextChanged extends OfferSearchEvent {
  final String text;

  TextChanged({this.text});

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
