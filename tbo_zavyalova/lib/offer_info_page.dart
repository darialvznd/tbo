import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tbo_zavyalova/expanded_section.dart';
import 'package:tbo_zavyalova/styles/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/offer.dart';
import 'models/parameter.dart';

class OfferInfoPage extends StatefulWidget {
  @override
  _OfferInfoPageState createState() => _OfferInfoPageState();
}

bool _isExpanded = false;

class _OfferInfoPageState extends State<OfferInfoPage> {
  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.arrow_back),
            title: Column(
              children: [
                Text(
                  _offer.vendor,
                  style: AppTextStyle.companyName,
                ),
                Text(
                  _offer.categoryName.toLowerCase(),
                  style: AppTextStyle.category,
                ),
              ],
            )),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            //height: 460,
                            child: CarouselSlider(
                          options: CarouselOptions(height: 400),
                          items: _offer.picturesUrl
                              .map((item) => Container(
                                    child: Center(
                                        child: Image.network(
                                      item,
                                      fit: BoxFit.fill,
                                    )),
                                  ))
                              .toList(),
                        )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _offer.vendor,
                                style: AppTextStyle.boldText,
                              ),
                              Text(_offer.categoryName.toUpperCase(),
                                  style: AppTextStyle.fieldDescription
                                      .copyWith(color: AppColor.categoryColor)),
                            ],
                          ),
                          Text(
                              _offer.price.toString() +
                                  " " +
                                  (_offer.currency != null
                                      ? _offer.currency
                                      : "RUB"),
                              style: AppTextStyle.price2)
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Divider(
                        thickness: 1,
                        height: 1,
                      ),
                      _drawRow("Название", _offer.name),
                      //_drawRow("Модель", _offer.),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(_offer.url);
                        },
                        child: Text("Смотреть на сайте".toUpperCase(),
                            style: AppTextStyle.urlText),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "О товаре".toUpperCase(),
                            style: AppTextStyle.boldText,
                          ),
                          InkWell(
                              onTap: _toogleExpand,
                              child: !_isExpanded
                                  ? Icon(Icons.arrow_drop_down)
                                  : Icon(Icons.arrow_drop_up)),
                        ],
                      ),
                      _expandedSection(_offer.params),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.primary,
              ),
              width: 360,
              height: 47,
              child: FlatButton(
                child: Text(
                  "G",
                  style: AppTextStyle.button,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchURL(String urlString) async {
  if (await canLaunch(urlString)) {
    await launch(urlString);
  } else {
    throw 'Could not launch $urlString';
  }
}

_expandedSection(List<Parameter> parametes) {
  return ExpandedSection(
      expand: _isExpanded,
      child: Container(
        //height: 100,
        child: ListView.builder(
          itemCount: parametes.length,
          shrinkWrap: true,
          //   for (var item in parametes) {
          // }
          itemBuilder: (BuildContext context, int index) {
            return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _drawRow(parametes[index].name, (parametes[index].value))
                ]);
          },
        ),
      ));

  //Text("fd"));
}

_drawRow(String label, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label.toUpperCase(),
        style: AppTextStyle.fieldDescription,
      ),
      SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(text, style: AppTextStyle.companyName),
      ),
      SizedBox(
        height: 8,
      ),
      Divider(
        thickness: 1,
        height: 1,
      ),
    ],
  );
}
