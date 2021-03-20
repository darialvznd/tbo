import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tbo_zavyalova/expanded_section.dart';
import 'package:tbo_zavyalova/styles/style.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/offer.dart';
import '../models/parameter.dart';

class OfferInfoPage extends StatefulWidget {
  final Offer offer;

  const OfferInfoPage({Key key, this.offer}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios, color: AppColor.primary),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.offer.vendor,
                  style: AppTextStyle.companyName,
                ),
                Text(
                  widget.offer.categoryName.toLowerCase(),
                  style: AppTextStyle.category,
                ),
              ],
            )),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: CarouselSlider(
                          options: CarouselOptions(height: 350),
                          items: widget.offer.picturesUrl
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
                                widget.offer.vendor,
                                style: AppTextStyle.boldText,
                              ),
                              Text(widget.offer.categoryName.toUpperCase(),
                                  style: AppTextStyle.fieldDescription
                                      .copyWith(color: AppColor.categoryColor)),
                            ],
                          ),
                          Text(
                              widget.offer.price.toString() +
                                  " " +
                                  (widget.offer.currency != null
                                      ? widget.offer.currency
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
                      _drawRow("Название", widget.offer.name),
                      if (widget.offer.salesNotes != null)
                        _drawRow("Дополнительно", widget.offer.salesNotes),
                      SizedBox(
                        height: 8,
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
                                  ? Icon(Icons.keyboard_arrow_down_sharp,
                                      color: AppColor.primary)
                                  : Icon(Icons.keyboard_arrow_up_sharp,
                                      color: AppColor.primary)),
                        ],
                      ),
                      _expandedSection(widget.offer.params),
                      SizedBox(
                        height: 9,
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(widget.offer.url);
                        },
                        child: Text("Смотреть на сайте".toUpperCase(),
                            style: AppTextStyle.urlText),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: AppColor.primary,
                  ),
                  width: 200,
                  height: 50,
                  child: FlatButton(
                    child: Text(
                      "в корзину".toUpperCase(),
                      style: AppTextStyle.button,
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Товар добавлен в корзину",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColor.onPrimary,
                          textColor: AppColor.onSurfaceMediumEmphasis,
                          fontSize: 16.0);
                    },
                  ),
                ),
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
          physics: NeverScrollableScrollPhysics(),
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
