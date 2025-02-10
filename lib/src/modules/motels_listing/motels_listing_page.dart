import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';
import 'package:guia_de_moteis/core/models/motel_model.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/app_bar/app_bar_listing_page.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/listing/filter_chip_app.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/listing/motel_card.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/motel_offer/carousel_motel_offer.dart';

import 'data/interface/i_motels_listing_repository.dart';

class MotelsListing extends StatefulWidget {
  const MotelsListing({super.key});

  @override
  State<MotelsListing> createState() => _MotelsListingState();
}

class _MotelsListingState extends State<MotelsListing> {
  List<MotelModel> motels = [];

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
                    CarouselMotelOffer(
                      motels: motels,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 37,
                      child: ListView.separated(
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                        itemBuilder: (context, index) {
                          return FilterChipApp(
                            label: 'Motel $index',
                            selected: false,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider(
                      color: Palette.dividerColor,
                      height: 1,
                    ),
                    Column(
                      children: [
                        ListView.builder(
                          itemCount: motels.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MotelCard(
                              motelModel: motels[index],
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ));
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    final motelsListingRepository = GetIt.I<IMotelsListingRepository>();
    motels = await motelsListingRepository.getMotels();
    print('Motel: ${motels[0].name}');
    setState(() {});
  }
}
