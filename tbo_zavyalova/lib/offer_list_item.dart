import 'package:flutter/material.dart';

import 'models/offer.dart';

class OfferListItem extends StatelessWidget {
  final Offer offer;

  const OfferListItem(this.offer);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(offer.name),
      subtitle: Text(offer.description),
      childrenPadding: const EdgeInsets.all(16),
      leading: Container(
        color: Colors.red,
        margin: EdgeInsets.only(top: 8),
        child: Text(offer.id.toString()),
      ),
      children: [
        Text(
          offer.description,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        // offer?.url == null
        //     ? Container()
        //     : Image.network(
        //         offer.url,
        //         loadingBuilder: (context, widget, imageChunkEvent) {
        //           return imageChunkEvent == null
        //               ? widget
        //               : CircularProgressIndicator();
        //         },
        //         height: 300,
        //       ),
      ],
    );
  }
}
