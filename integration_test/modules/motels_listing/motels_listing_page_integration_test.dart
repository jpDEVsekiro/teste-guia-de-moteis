import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:guia_de_moteis/main.dart' as app;
import 'package:guia_de_moteis/src/modules/motels_listing/motels_listing_page.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Motels listing page integration test', () {
    setUp(() async {
      await GetIt.I.reset();
      await IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets('Open Motels listing test', (tester) async {
      await openMotelsListingPageTest(tester);
    });
    testWidgets('Tap favorite button', (tester) async {
      await tapFavoriteButton(tester);
    });
    testWidgets('Carousel motel offer test', (tester) async {
      await carouselMotelOfferTest(tester);
    });
    testWidgets('Tap filter chip', (tester) async {
      await tapFilterChip(tester);
    });
    testWidgets('Motel list test', (tester) async {
      await motelListTest(tester);
    });
  });
}

Future<void> openMotelsListingPageTest(WidgetTester tester) async {
  app.main();
  await tester.pumpAndSettle();
  expect(find.byType(MotelsListingPage), findsOneWidget);
  expect(find.byKey(Key('app_bar_listing_page')), findsOneWidget);
  expect(find.byKey(Key('carousel_motel_offer')), findsOneWidget);
  expect(find.byKey(Key('list_view_motels')), findsOneWidget);
  await Future.delayed(Duration(seconds: 2));
  await tester.pumpAndSettle();
  expect(find.byKey(Key('list_view_filters')), findsOneWidget);
  expect(find.byKey(Key('filter_chip_filters')), findsOneWidget);
  expect(find.byKey(Key('filter_chip_0')), findsOneWidget);
  expect(find.byKey(Key('filter_chip_1')), findsOneWidget);
  await Future.delayed(Duration(seconds: 2));
  await tester.pumpAndSettle();
  expect(find.byKey(Key('motel_card_0')), findsOneWidget);
  expect(find.byKey(Key("favorite_button_[<'motel_card_0'>]")), findsOneWidget);
  expect(find.byKey(Key("suite_carousel_[<'motel_card_0'>]")), findsOneWidget);
  expect(
      find.byKey(Key("suite_card_0_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  expect(
      find.byKey(Key("suite_card_1_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
}

Future<void> tapFavoriteButton(WidgetTester tester) async {
  await openMotelsListingPageTest(tester);
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key("favorite_button_[<'motel_card_0'>]")));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 2));
  expect(find.byKey(Key("favorite_button_[<'motel_card_0'>]")), findsOneWidget);
  expect(find.byKey(Key("true_favorite_[<'motel_card_0'>]")), findsOneWidget);
  await tester.tap(find.byKey(Key("favorite_button_[<'motel_card_0'>]")));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 2));
  expect(find.byKey(Key("favorite_button_[<'motel_card_0'>]")), findsOneWidget);
  expect(find.byKey(Key("false_favorite_[<'motel_card_0'>]")), findsOneWidget);
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 2));
}

Future<void> carouselMotelOfferTest(WidgetTester tester) async {
  await openMotelsListingPageTest(tester);
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(find.byKey(Key('carousel_motel_offer_card_0')), findsOneWidget);
  await tester.drag(find.byKey(Key('carousel_motel_offer')), Offset(-300, 0));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(find.byKey(Key('carousel_motel_offer_card_1')), findsOneWidget);
  await tester.drag(find.byKey(Key('carousel_motel_offer')), Offset(-300, 0));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(find.byKey(Key('carousel_motel_offer_card_2')), findsOneWidget);
  await tester.drag(find.byKey(Key('carousel_motel_offer')), Offset(-300, 0));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(find.byKey(Key('carousel_motel_offer_card_3')), findsOneWidget);
  await tester.drag(find.byKey(Key('carousel_motel_offer')), Offset(-300, 0));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(find.byKey(Key('carousel_motel_offer_card_4')), findsOneWidget);
}

Future<void> tapFilterChip(WidgetTester tester) async {
  await openMotelsListingPageTest(tester);
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key('filter_chip_0')));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(find.byKey(Key('filter_chip_0')), findsOneWidget);
  expect(find.byKey(Key('filters_counter_1')), findsOneWidget);
  await tester.tap(find.byKey(Key('filter_chip_1')));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(find.byKey(Key('filter_chip_1')), findsOneWidget);
  expect(find.byKey(Key('filters_counter_2')), findsOneWidget);
  await tester.tap(find.byKey(Key('filter_chip_0')));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(find.byKey(Key('filter_chip_0')), findsOneWidget);
  expect(find.byKey(Key('filters_counter_1')), findsOneWidget);
  await tester.tap(find.byKey(Key('filter_chip_1')));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(find.byKey(Key('filter_chip_1')), findsOneWidget);
  expect(find.byKey(Key('filters_counter_0')), findsNothing);
}

Future<void> motelListTest(WidgetTester tester) async {
  await openMotelsListingPageTest(tester);
  await tester.pumpAndSettle();
  await tester.drag(find.byKey(Key('list_view_motels')), Offset(0, -350));
  await tester.pumpAndSettle();
  expect(find.byKey(Key('motel_card_0')), findsOneWidget);
  expect(
      find.byKey(Key("suite_card_0_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  expect(
      find.byKey(Key("suite_card_1_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  await Future.delayed(Duration(seconds: 1));
  await tester.drag(
      find.byKey(Key("suite_carousel_[<'motel_card_0'>]")), Offset(-300, 0));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(
      find.byKey(Key("suite_card_1_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  expect(
      find.byKey(Key("suite_card_2_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  await Future.delayed(Duration(seconds: 1));
  await tester.drag(
      find.byKey(Key("suite_carousel_[<'motel_card_0'>]")), Offset(-300, 0));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(
      find.byKey(Key("suite_card_2_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  expect(
      find.byKey(Key("suite_card_3_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  await Future.delayed(Duration(seconds: 1));
  await tester.drag(
      find.byKey(Key("suite_carousel_[<'motel_card_0'>]")), Offset(300, 0));
  await tester.pumpAndSettle();
  await Future.delayed(Duration(seconds: 1));
  expect(
      find.byKey(Key("suite_card_2_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  expect(
      find.byKey(Key("suite_card_1_[<'suite_carousel_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  await Future.delayed(Duration(seconds: 1));
}
