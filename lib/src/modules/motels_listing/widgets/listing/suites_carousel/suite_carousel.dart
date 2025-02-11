import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';
import 'package:guia_de_moteis/core/models/motel_model.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/listing/suites_carousel/period_card.dart';

class SuiteCarousel extends StatefulWidget {
  const SuiteCarousel({super.key, required this.suites});
  final List<Suites> suites;
  @override
  State<SuiteCarousel> createState() => _SuiteCarouselState();
}

class _SuiteCarouselState extends State<SuiteCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();
  List<Suites> get suites => widget.suites;

  @override
  Widget build(BuildContext context) {
    if (suites.isEmpty) return SizedBox();
    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: suites.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Column(
          children: [
            SizedBox(
              height: 275,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.white,
                  elevation: 0.6,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Image.network(
                            suites[itemIndex].photos?.first ?? '',
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return SizedBox(
                                height: 140,
                                width: 140,
                              );
                            },
                          ),
                        ),
                      ),
                      Text(suites[itemIndex].name ?? '',
                          style: TextStyle(fontSize: 16)),
                      if (suites[itemIndex].showQtyAvailable ?? false)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wb_incandescent_rounded,
                                color: Palette.primary, size: 14),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Só mais ${suites[itemIndex].qty} pelo app',
                                style: TextStyle(
                                    color: Palette.primary, fontSize: 12)),
                          ],
                        ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  )),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.white,
              elevation: 0.6,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: suites[itemIndex].categoryItems!.length > 4
                          ? 4
                          : suites[itemIndex].categoryItems!.length,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.width * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Palette.backgroundColor,
                            ),
                            child: Image.network(
                              suites[itemIndex].categoryItems?[index].icone ??
                                  '',
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text('Ver \n todos',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Palette.iconColor, fontSize: 10)),
                        SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Palette.iconColor,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: suites[itemIndex].period!.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return PeriodCard(period: suites[itemIndex].period![index]);
                })
          ],
        );
      },
      options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: false,
          enableInfiniteScroll: false,
          viewportFraction: 0.9,
          height: 390.0 + 93 * 3),
    );
  }
}
