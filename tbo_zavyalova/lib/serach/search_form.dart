import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_bloc.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_event.dart';
import 'package:tbo_zavyalova/blocs/offer_search/offer_search_state.dart';
import 'package:tbo_zavyalova/models/offer.dart';
import 'package:tbo_zavyalova/offer_card.dart';

class SearchForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 30,
        ),
        _SearchBar(),
        _SearchBody().key == null ? Container() : Expanded(child: _SearchBody())
      ]),
    );
  }
}

class _SearchBar extends StatefulWidget {
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();
  OfferSearchBloc _offerSearchBloc;

  @override
  void initState() {
    super.initState();
    _offerSearchBloc = BlocProvider.of<OfferSearchBloc>(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      // onEditingComplete: (text) {
      //   _offerSearchBloc.add(
      //     TextChanged(text: text),
      //   ); },
      onSubmitted: (text) {
        _offerSearchBloc.add(
          TextChanged(text: text),
        );
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: GestureDetector(
          child: Icon(Icons.clear),
          onTap: _onClearTapped,
        ),
        border: InputBorder.none,
        hintText: 'Enter a search term',
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = '';
    _offerSearchBloc.add(TextChanged(text: ''));
  }
}

class _SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferSearchBloc, OfferSearchState>(
      builder: (BuildContext context, OfferSearchState state) {
        if (state is SearchStateEmpty) {
          return Text('Please enter a term to begin');
        }
        if (state is SearchStateLoading) {
          return CircularProgressIndicator();
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          return state.items.isEmpty
              ? Text('No Results')
              : Expanded(child: _SearchResults(items: state.items));
        }
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  final List<Offer> items;

  const _SearchResults({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        //itemCount: ,
        children: new List.generate(items.length, (index) {
          return (Container(
            color: Colors.red,
          ));
          //return new GridTile(child: _Offer(item: items[index]));
        })

        // itemBuilder: (BuildContext context, int index) {
        //   return _Offer(item: items[index]);
        // },
        );
  }
}

class _Offer extends StatelessWidget {
  final Offer item;

  const _Offer({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width - 35,
      child: OfferCard(
        offer: item,
      ),
      // ListTile(

      //   leading: Text(item.description),
      //   // CircleAvatar(
      //   //   child: Image.network(item.description),
      //   // ),
      //   title: Text(item.name),
      //   // onTap: () async {
      //   //   if (await canLaunch(item.htmlUrl)) {
      //   //     await launch(item.htmlUrl);
      //   //   }
      //   // },
      // ),
    );
  }
}
