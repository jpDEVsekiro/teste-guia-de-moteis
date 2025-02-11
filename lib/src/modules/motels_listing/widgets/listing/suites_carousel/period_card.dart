import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';
import 'package:guia_de_moteis/core/models/motel_model.dart';

class PeriodCard extends StatelessWidget {
  const PeriodCard({super.key, required this.period});
  final Period period;

  @override
  Widget build(BuildContext context) {
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
              Row(
                children: [
                  Text(period.formatedTime ?? '',
                      style: TextStyle(
                        color: Palette.textColor,
                        fontSize: 20,
                      )),
                  if (period.discount != null)
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Palette.primary,
                        ),
                      ),
                      child: Text(
                        '${period.discountPercentageValue}% off',
                        style: TextStyle(
                          color: Palette.primary,
                          fontSize: 10,
                        ),
                      ),
                    )
                ],
              ),
              Row(
                children: [
                  if (period.discount != null)
                    Text(period.formatedValue + '  ',
                        style: TextStyle(
                          color: Palette.iconColor,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Palette.iconColor,
                          fontSize: 16,
                        )),
                  Text(period.formatedTotalValue,
                      style: TextStyle(
                        color: Palette.textColor,
                        fontSize: 16,
                      )),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Icon(Icons.arrow_forward_ios_rounded, color: Palette.primary),
        )
      ]),
    );
  }
}
