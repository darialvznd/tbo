import 'dart:async';

import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_event.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_state.dart';
import 'package:tbo_zavyalova/repositories/offer_repository.dart';

class OfferSearchBloc extends Bloc<OfferSearchEvent, OfferSearchState> {
  final OfferRepository offerRepository;
  int page = 1;
  bool isFetching = false;
  OfferSearchBloc({@required this.offerRepository}) : super(null);

  @override
  void onTransition(Transition<OfferSearchEvent, OfferSearchState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  OfferSearchState get initialState => SearchStateEmpty();

  @override
  Stream<OfferSearchState> mapEventToState(
    OfferSearchEvent event,
  ) async* {
    if (event is TextChanged) {
      final String searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          final results = await offerRepository.search(searchTerm, page);
          yield SearchStateSuccess(results);
          page++;
        } catch (error) {
          yield SearchStateError('something went wrong');
        }
      }
    }
  }
}
