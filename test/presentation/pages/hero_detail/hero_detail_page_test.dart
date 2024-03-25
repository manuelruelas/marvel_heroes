import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:marvel_heroes/domain/entity/character.dart';
import 'package:marvel_heroes/presentation/pages/hero_detail/hero_detail_page.dart';

void main() {
  testWidgets(
    'MyWidget should display character data correctly',
    (WidgetTester tester) async {
      // Configura los argumentos necesarios
      final character = Character(
        id: 1,
        name: 'Test Character',
        thumbnailUrl: 'https://via.placeholder.com/150',
      );

      // Pump el widget con los argumentos necesarios
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: '/',
          getPages: [
            GetPage(
              name: '/',
              page: () => const HeroDetailPage(),
              arguments: character,
            ),
          ],
        ),
      );
      tester.pumpAndSettle();
    },
  );
}
