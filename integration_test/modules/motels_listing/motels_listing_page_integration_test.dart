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
      await openMotelsListingTest(tester);
    });
    testWidgets('Tap favorite button', (tester) async {
      await tapFavoriteButton(tester);
    });
  });
}

Future<void> openMotelsListingTest(WidgetTester tester) async {
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
  expect(find.byKey(Key("carousel_motel_offer_[<'motel_card_0'>]")),
      findsOneWidget);
  expect(
      find.byKey(
          Key("suite_card_0_[<'carousel_motel_offer_[<'motel_card_0'>]'>]")),
      findsOneWidget);
  expect(
      find.byKey(
          Key("suite_card_1_[<'carousel_motel_offer_[<'motel_card_0'>]'>]")),
      findsOneWidget);
}

Future<void> tapFavoriteButton(WidgetTester tester) async {
  await openMotelsListingTest(tester);
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
