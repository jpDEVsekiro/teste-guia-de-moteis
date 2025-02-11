import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';

class FilterChipApp extends StatelessWidget {
  const FilterChipApp(
      {super.key,
      required this.label,
      required this.selected,
      this.onTapFilterChip,
      this.icon,
      this.height = 37});
  final String label;
  final bool selected;
  final void Function()? onTapFilterChip;
  final Widget? icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFilterChip,
      child: Container(
        height: height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                if (icon != null) ...[icon!, SizedBox(width: 5)],
                Text(
                  label,
                  style: TextStyle(
                    color: selected ? Colors.white : Palette.textColor,
                    fontSize: 13,
                  ),
                ),
              ],
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
