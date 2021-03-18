import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_bloc.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_event.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_state.dart';
import 'package:tbo_zavyalova/models/offer.dart';
import 'package:tbo_zavyalova/offer_card.dart';
import 'package:tbo_zavyalova/offer_info_page.dart';
import 'package:tbo_zavyalova/styles/style.dart';

import '../offer_list_item.dart';

class SearchForm extends StatefulWidget {
  final int categoryId;

  const SearchForm({Key key, this.categoryId}) : super(key: key);
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final List<Offer> _offers = [];

  OfferSearchBloc _offerSearchBloc;

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _offerSearchBloc = BlocProvider.of<OfferSearchBloc>(context);
      _offerSearchBloc
          .add(OfferSearchFetchEvent(categoryId: widget.categoryId));
    });
    _scrollController.addListener(() {
      if (_scrollController.offset ==
              _scrollController.position.maxScrollExtent &&
          _offerSearchBloc.state is! SearchStateLoading) {
        _fetchData();
      }
    });
  }

  void _fetchData() {
    // listViewOffset = _scrollController.offset;
    _textController.text == ''
        ? context
            .read<OfferSearchBloc>()
            .add(OfferSearchFetchEvent(categoryId: widget.categoryId))
        : context.read<OfferSearchBloc>().add(OfferSearchFetchEvent(
            categoryId: widget.categoryId, searchText: _textController.text));
  }

  final _textController = TextEditingController();
  @override
  void dispose() {
    _textController.dispose();
    _textController.text = '';
    super.dispose();
  }

  void _onClearTapped() {
    _textController.text = '';
    _offerSearchBloc.add(TextChanged(searchText: ''));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 100) / 2;
    final double itemWidth = size.width / 2 - 30;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 15),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.onPrimary,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 3.0,
                        offset: Offset(0.0, 1.0)),
                  ],
                ),
                height: 40,
                child: TextField(
                  controller: _textController,
                  autocorrect: false,
                  onSubmitted: (text) {
                    _offers.clear();
                    _offerSearchBloc.add(
                      TextChanged(
                          searchText: text, categoryId: widget.categoryId),
                    );
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.clear),
                      onTap: _onClearTapped,
                    ),
                    border: InputBorder.none,
                    hintText: 'Товар, бренд или артикул',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //  _SearchBar(),
              BlocConsumer<OfferSearchBloc, OfferSearchState>(
                listener: (context, state) {
                  if (state is SearchStateSuccess) {
                    //  _offers.clear();
                    _offers.addAll(state.items);
                    if (_scrollController.hasClients) {}
                    Scaffold.of(context).hideCurrentSnackBar();
                  }
                },
                builder: (context, state) {
                  if (state is SearchStateEmpty && _offers.isEmpty) {
                    return Text('В данном разделе информация отсутствует');
                  } else if (state is SearchStateLoading &&
                      state.showProgressBar) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchStateError && _offers.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          color: Colors.red,
                          onPressed: () {
                            _fetchData();
                          },
                          icon: Icon(Icons.refresh),
                        ),
                        const SizedBox(height: 15),
                        Text('Ошибка', textAlign: TextAlign.center),
                      ],
                    );
                  }
                  return Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                      controller: _scrollController,
                      children: _offers
                          .map((item) => InkWell(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: OfferListItem(item),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OfferInfoPage(
                                              offer: item,
                                            )),
                                  );
                                },
                              ))
                          .toList(),
                    ),
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
