import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/controller/motels_listing_controller.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/app_bar/app_bar_listing_page.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/listing/filter_chip_app.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/listing/motel_card.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/motel_offer/carousel_motel_offer.dart';

class MotelsListing extends StatefulWidget {
  const MotelsListing({super.key});

  @override
  State<MotelsListing> createState() => _MotelsListingState();
}

class _MotelsListingState extends State<MotelsListing> {
  MotelsListingController controller = MotelsListingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.primary,
        appBar: AppBarListingPage(),
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
                        valueListenable: controller.motels,
                        builder: (context, value, child) {
                          return CarouselMotelOffer(
                            motels: value,
                          );
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    ValueListenableBuilder(
                        valueListenable: controller.motels,
                        builder: (context, value, child) {
                          return ValueListenableBuilder(
                              valueListenable: controller.filter,
                              builder: (context, value, child) {
                                return SizedBox(
                                  height: 37,
                                  child: ListView.separated(
                                    itemCount: controller.categoryItems.length,
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
                                      return FilterChipApp(
                                        label: controller
                                                .categoryItems[index].nome ??
                                            '',
                                        selected: controller.filter.value
                                            .contains(controller
                                                .categoryItems[index].nome),
                                        onTapFilterChip: () => controller
                                            .filterByCategory(controller
                                                    .categoryItems[index]
                                                    .nome ??
                                                ''),
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
                            valueListenable: controller.motels,
                            builder: (context, value, child) {
                              return ListView.builder(
                                itemCount: value.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return MotelCard(
                                    motelModel: value[index],
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
