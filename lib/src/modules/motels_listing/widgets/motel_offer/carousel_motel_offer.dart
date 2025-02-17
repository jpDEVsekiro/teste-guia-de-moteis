import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';
import 'package:guia_de_moteis/core/models/motel_model.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/motel_offer/carousel_motel_offer_card.dart';

class CarouselMotelOffer extends StatefulWidget {
  const CarouselMotelOffer({super.key, required this.motels});
  final List<MotelModel> motels;
  @override
  State<CarouselMotelOffer> createState() => _CarouselMotelOfferState();
}

class _CarouselMotelOfferState extends State<CarouselMotelOffer> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  List<Suites> get suites {
    List<Suites> suites = [];
    for (var motel in widget.motels) {
      suites.addAll(motel.suites?.where((suite) =>
              suite.period?.any((period) => period.discount != null) ??
              false) ??
          []);
    }
    return suites;
  }

  @override
  Widget build(BuildContext context) {
    if (suites.isEmpty) {
      return Container();
    }
    return Column(children: [
      CarouselSlider.builder(
        carouselController: _controller,
        itemCount: suites.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return CarouselMotelOfferCard(
            key: Key('carousel_motel_offer_card_$itemIndex'),
            suite: suites[itemIndex],
          );
        },
        options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 1,
            height: 170,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: suites.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: _current == entry.key ? 10.0 : 7.0,
              height: _current == entry.key ? 10.0 : 7.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.primary
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
