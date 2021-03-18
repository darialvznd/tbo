import 'package:flutter/material.dart';
import 'package:tbo_zavyalova/offer_card.dart';

import 'models/offer.dart';

class OfferListItem extends StatelessWidget {
  final Offer offer;

  const OfferListItem(this.offer);

  @override
  Widget build(BuildContext context) {
    return OfferCard(
      offer: offer,
    );
  }
}
