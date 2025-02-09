import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';

class SuiteCarousel extends StatefulWidget {
  const SuiteCarousel({super.key});

  @override
  State<SuiteCarousel> createState() => _SuiteCarouselState();
}

class _SuiteCarouselState extends State<SuiteCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Column(
          children: [
            Card(
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
                          imgList[itemIndex],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text('Suite ${itemIndex + 1}',
                        style: TextStyle(fontSize: 18)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wb_incandescent_rounded,
                            color: Palette.primary, size: 14),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Só mais ${itemIndex + 1} pelo app',
                            style: TextStyle(
                                color: Palette.primary, fontSize: 12)),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                )),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.white,
              elevation: 0.6,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Palette.backgroundColor,
                    ),
                    child: Icon(Icons.add, color: Palette.iconColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Palette.backgroundColor,
                    ),
                    child: Icon(Icons.add, color: Palette.iconColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Palette.backgroundColor,
                    ),
                    child: Icon(Icons.add, color: Palette.iconColor),
                  ),
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
                itemCount: _current + 1,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.white,
                    elevation: 0.6,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('3 horas',
                                style: TextStyle(
                                  color: Palette.textColor,
                                  fontSize: 22,
                                )),
                            Text('R\$ 50,00',
                                style: TextStyle(
                                  color: Palette.textColor,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Icon(Icons.arrow_forward_ios_rounded,
                            color: Palette.primary),
                      )
                    ]),
                  );
                })
          ],
        );
      },
      options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: false,
          enableInfiniteScroll: false,
          viewportFraction: 0.9,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
          height: 355.0 + 93 * (_current + 1)),
    );
  }
}
