import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';

class FilterChipApp extends StatelessWidget {
  const FilterChipApp(
      {super.key,
      required this.label,
      required this.selected,
      this.onTapFilterChip});
  final String label;
  final bool selected;
  final void Function()? onTapFilterChip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFilterChip,
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Palette.textColor,
                fontSize: 13,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: selected ? Palette.primary : Palette.secondary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? Palette.primary : Palette.dividerColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
