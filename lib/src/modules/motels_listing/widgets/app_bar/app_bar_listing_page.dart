import 'package:flutter/material.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/app_bar/custom_switch.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/widgets/app_bar/dotted_menu_button.dart';
import 'package:guia_de_moteis/core/design_system/palette.dart';

class AppBarListingPage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Palette.primary,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                size: 26,
                Icons.menu_rounded,
                color: Palette.secondary,
              ),
              Spacer(),
              CustomSwitch(
                value: true,
                onChanged: (value) {
                  print(value);
                },
              ),
              Spacer(),
              Icon(
                size: 26,
                Icons.search_rounded,
                color: Palette.secondary,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          SizedBox(
            width: 54,
            child: DottedMenuButton(
              child: Text('abc', style: TextStyle(color: Palette.secondary)),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(134);
}
