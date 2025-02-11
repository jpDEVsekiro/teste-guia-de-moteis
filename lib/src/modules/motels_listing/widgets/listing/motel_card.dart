import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';
import 'package:guia_de_moteis/core/models/motel_model.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/listing/suites_carousel/suite_carousel.dart';

class MotelCard extends StatelessWidget {
  const MotelCard(
      {super.key,
      required this.motelModel,
      required this.onTapFavorite,
      required this.filters});
  final MotelModel motelModel;
  final List<String> filters;
  final void Function()? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(motelModel.logo ?? ''),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      motelModel.name ?? 'Motel Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      motelModel.neighborhood ?? 'Motel Address',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: Palette.reviewColor,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: Icon(
                                  Icons.star,
                                  color: Palette.reviewColor,
                                  size: 12,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Text(
                                  motelModel.averageRating.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${motelModel.qtyRating} Avaliações',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: onTapFavorite,
                  child: Icon(
                    motelModel.favorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SuiteCarousel(
            suites: motelModel.filterSuites(filters),
          ),
        ],
      ),
    );
  }
}
