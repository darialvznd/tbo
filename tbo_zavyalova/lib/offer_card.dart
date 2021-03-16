import 'package:flutter/material.dart';
import 'package:tbo_zavyalova/models/offer.dart';
import 'package:tbo_zavyalova/models/parameter.dart';
import 'package:tbo_zavyalova/styles/style.dart';

class OfferCard extends StatefulWidget {
  final Offer offer;

  const OfferCard({Key key, this.offer}) : super(key: key);

  @override
  _OfferCardState createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.onPrimary,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 3.0,
              offset: Offset(0.0, 1.0)),
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12),
              blurRadius: 1.0,
              offset: Offset(0, 2)),
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.14),
              blurRadius: 1.0,
              offset: Offset(0, 1)),
        ],
      ),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Stack(children: [
                Image.network(
                  widget.offer.picturesUrl[0],
                  fit: BoxFit.fitHeight,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        child: Icon(
                          _liked
                              ? Icons.favorite_outlined
                              : Icons.favorite_border,
                          color: _liked
                              ? AppColor.primary
                              : AppColor.onSurfaceMediumEmphasis,
                        ),
                        onTap: () {
                          setState(() {
                            _liked = !_liked;
                          });
                        },
                      ),
                    ))
              ]),
            ),
            // Divider(
            //   height: 1,
            //   thickness: 1,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 3, 10, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.offer.price.toString() +
                                " " +
                                (widget.offer.currency !=
                            null
                        ? widget.offer.currency
                        : "RUB"),
                    style: AppTextStyle.price,
                  ),
                  Text(
                    widget.offer.vendor,
                    style: AppTextStyle.companyName,
                  ),
                  //TODO категория
                  Text(
                    widget.offer.categoryName.toLowerCase(),
                    style: AppTextStyle.category,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
