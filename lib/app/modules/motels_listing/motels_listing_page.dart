import 'package:flutter/material.dart';
import 'package:guia_de_moteis/app/modules/motels_listing/widgets/app_bar_listing.dart';

class MotelsListing extends StatefulWidget {
  const MotelsListing({super.key});

  @override
  State<MotelsListing> createState() => _MotelsListingState();
}

class _MotelsListingState extends State<MotelsListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarListing(),
      body: const Center(
        child: Text('Motels Listing'),
      ),
    );
  }
}
