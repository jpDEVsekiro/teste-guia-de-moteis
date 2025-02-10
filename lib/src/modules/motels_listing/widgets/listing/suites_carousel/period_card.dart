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
              Text(period.formatedTime ?? '',
                  style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 22,
                  )),
              Text(period.formatedTotalValue,
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
          child: Icon(Icons.arrow_forward_ios_rounded, color: Palette.primary),
        )
      ]),
    );
  }
}
