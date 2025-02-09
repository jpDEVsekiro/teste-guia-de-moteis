import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis/core/http/interface/i_http_repository.dart';
import 'package:guia_de_moteis/core/http/repository/http_repository.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/data/interface/i_motels_listing_repository.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/data/repository/motels_listing_repository.dart';
import 'package:guia_de_moteis/src/modules/motels_listing/motels_listing_page.dart';

void setup() {
  GetIt.I.registerSingleton<IHttpRepository>(HttpRepository());
  GetIt.I
      .registerSingleton<IMotelsListingRepository>(MoTelsListingRepository());
}

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MotelsListing(),
    );
  }
}
