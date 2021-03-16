import 'package:flutter/material.dart';
import 'package:tbo_zavyalova/models/offer.dart';
import 'package:tbo_zavyalova/models/parameter.dart';

import 'package:tbo_zavyalova/offer_card.dart';

class ElementPage extends StatelessWidget {
  Offer _offer = Offer(
    price: 9524,
    picturesUrl: [
      "https://cdn-images.farfetch-contents.com/14/51/44/92/14514492_22022313_1000.jpg",
      "https://cdn-images.farfetch-contents.com/14/51/44/92/14514492_22022316_1000.jpg",
      "https://cdn-images.farfetch-contents.com/14/51/44/92/14514492_22022319_1000.jpg",
      "https://cdn-images.farfetch-contents.com/14/51/44/92/14514492_22022322_1000.jpg"
    ],
    url:
        "https://ad.admitad.com/g/f3a24921ecf6f0a2c5437a3d556164/?subid=app&i=5&f_id=17132&ulp=https%3A%2F%2Fwww.farfetch.com%2Fru%2Fshopping%2Fmen%2Fconverse-ct70-archive-remix-flag-item-14514492.aspx%3Fsize%3D27%26storeid%3D12425",
    description:
        "Кеды CT70 Archive Remix Flag от Converse. Резиновая подошва и контрастная окантовка.",
    id: "1451449256",
    vendorCode: "166425C",
    currency: "RUB",
    categoryName: "Кроссовки",
    //  available: true,
    name: "Converse кеды CT70 Archive Remix Flag",
    salesNotes: "Доставка от 18 тыс руб. бесплатно!",
    params: [
      Parameter(
        "размер",
        "8",
        unit: "CONVERSE US",
      ),
      Parameter("материал", "Хлопок, Резина"),
      Parameter("цвет", "Черный"),
      Parameter(
        'пол',
        'Мужской',
      )
    ],
    modifiedTime: DateTime.fromMillisecondsSinceEpoch(1605240580),
    vendor: "Converse",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    child: OfferCard(offer: _offer),
                  ),
                  SizedBox(width: 25),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    height: 270,
                    child: OfferCard(offer: _offer),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 270,
                    child: OfferCard(offer: _offer),
                  ),
                  SizedBox(width: 25),
                  Container(
                    width: 160,
                    height: 270,
                    child: OfferCard(offer: _offer),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
