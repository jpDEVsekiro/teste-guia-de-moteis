import 'package:flutter/material.dart';
import 'package:guia_de_moteis/app/design_system/palette.dart';
import 'package:guia_de_moteis/app/modules/motels_listing/widgets/app_bar_listing.dart';
import 'package:guia_de_moteis/app/modules/motels_listing/widgets/carousel_motel_offer.dart';
import 'package:guia_de_moteis/app/modules/motels_listing/widgets/filter_chip_app.dart';

class MotelsListing extends StatefulWidget {
  const MotelsListing({super.key});

  @override
  State<MotelsListing> createState() => _MotelsListingState();
}

class _MotelsListingState extends State<MotelsListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.primary,
        appBar: AppBarListing(),
        body: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Palette.backgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  CarouselMotelOffer(),
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
                ],
              )),
        ));
  }
}
