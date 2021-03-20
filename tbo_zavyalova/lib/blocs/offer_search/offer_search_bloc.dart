import 'dart:async';

import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_event.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_state.dart';
import 'package:tbo_zavyalova/repositories/offer_repository.dart';

class OfferSearchBloc extends Bloc<OfferSearchEvent, OfferSearchState> {
  final OfferRepository offerRepository;
  int fetchPage = 1;
  int searchPage = 1;
  OfferSearchBloc({@required this.offerRepository}) : super(null);

  @override
  Stream<OfferSearchState> mapEventToState(
    OfferSearchEvent event,
  ) async* {
    if (event is OfferSearchFetchEvent) {
      yield SearchStateLoading(fetchPage == 1);
      try {
        final offerList = await offerRepository.search(fetchPage,
            categoryId: event.categoryId, term: event.searchText);
        if (offerList != null && offerList.isNotEmpty) {
          yield SearchStateSuccess(offerList);
          fetchPage++;
        } else {
          yield SearchStateEmpty();
        }
      } catch (e) {
        yield SearchStateError('something went wrong');
      }
    }
    if (event is TextChanged) {
      final String searchTerm = event.searchText;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading(searchPage == 1);
        try {
          final results = await offerRepository.search(searchPage,
              term: searchTerm, categoryId: event.categoryId);
          yield SearchStateSuccess(results);
        } catch (error) {
          yield SearchStateError('something went wrong');
        }
      }
    } else {}
  }
}
