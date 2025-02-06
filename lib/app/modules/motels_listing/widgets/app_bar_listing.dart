import 'package:flutter/material.dart';

class AppBarListing extends StatelessWidget implements PreferredSizeWidget {
  const AppBarListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.red,
      child: Row(
        children: [
          const Text(
            'Motels Listing',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}
