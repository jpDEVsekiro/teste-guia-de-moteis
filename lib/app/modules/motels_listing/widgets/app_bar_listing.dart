import 'package:flutter/material.dart';
import 'package:guia_de_moteis/app/design_system/palette.dart';
import 'package:guia_de_moteis/app/modules/motels_listing/widgets/custom_switch.dart';
import 'package:guia_de_moteis/app/modules/motels_listing/widgets/dotted_menu_button.dart';

class AppBarListing extends StatelessWidget implements PreferredSizeWidget {
  const AppBarListing({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DottedMenuButton(
                child: Text('abc', style: TextStyle(color: Palette.secondary)),
              ),
              SizedBox(
                width: 40,
              ),
              DottedMenuButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.shield_moon_rounded,
                      color: Palette.secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('11 fev - 12 fev',
                        style: TextStyle(color: Palette.secondary)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(134);
}
