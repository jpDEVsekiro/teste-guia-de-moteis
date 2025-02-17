import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/controller/motels_listing_controller.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/app_bar/app_bar_listing_page.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/listing/filter_chip_app.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/listing/motel_card.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/motel_offer/carousel_motel_offer.dart';

class MotelsListingPage extends StatefulWidget {
  const MotelsListingPage({super.key});

  @override
  State<MotelsListingPage> createState() => _MotelsListingPageState();
}

class _MotelsListingPageState extends State<MotelsListingPage> {
  MotelsListingController controller = MotelsListingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.primary,
        appBar: AppBarListingPage(
          key: Key('app_bar_listing_page'),
        ),
        body: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Palette.backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    ValueListenableBuilder(
                        valueListenable: controller.allMotels,
                        builder: (context, value, child) {
                          return CarouselMotelOffer(
                            motels: value,
                            key: Key('carousel_motel_offer'),
                          );
                        }),
                    ValueListenableBuilder(
                        valueListenable: controller.allMotels,
                        builder: (context, value, child) {
                          return ValueListenableBuilder(
                              valueListenable: controller.filters,
                              builder: (context, value, child) {
                                if (controller.allMotels.value.isEmpty)
                                  return SizedBox();
                                return Container(
                                  height: 47,
                                  child: ListView.separated(
                                    key: Key('list_view_filters'),
                                    itemCount:
                                        controller.allCategoryItems.length + 1,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        width: 10,
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      if (index == 0) {
                                        return Stack(children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: FilterChipApp(
                                              key: Key('filter_chip_filters'),
                                              label: 'Filtros',
                                              selected: false,
                                              height: 37,
                                              icon: Icon(
                                                Icons.filter_list,
                                                color: Palette.textColor,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                          if (controller
                                              .filters.value.isNotEmpty)
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.zero,
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Palette.primary,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Text(
                                                  controller
                                                      .filters.value.length
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ]);
                                      }
                                      index -= 1;
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: FilterChipApp(
                                          key: Key('filter_chip_$index'),
                                          label: controller
                                                  .allCategoryItems[index]
                                                  .nome ??
                                              '',
                                          selected: controller.filters.value
                                              .contains(controller
                                                  .allCategoryItems[index]
                                                  .nome),
                                          onTapFilterChip: () => controller
                                              .filterByCategory(controller
                                                      .allCategoryItems[index]
                                                      .nome ??
                                                  ''),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              });
                        }),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(
                      color: Palette.dividerColor,
                      height: 1,
                    ),
                    Column(
                      children: [
                        ValueListenableBuilder(
                            valueListenable: controller.filterMotels,
                            builder: (context, value, child) {
                              return ListView.builder(
                                key: Key('list_view_motels'),
                                itemCount: value.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return MotelCard(
                                    key: Key('motel_card_$index'),
                                    motelModel: value[index],
                                    filters: controller.filters.value,
                                    onTapFavorite: () =>
                                        controller.onTapFavorite(index),
                                  );
                                },
                              );
                            }),
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
