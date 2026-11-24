import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tradutor_palavras/main.dart';

void main() {
  testWidgets('inicia mostrando a primeira palavra', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TradutorApp());

    expect(find.text('Casa'), findsOneWidget);
    expect(find.text('Palavra 1 de 10'), findsOneWidget);
  });

  testWidgets('mostra as traduções da palavra', (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());
    await tester.tap(find.text('Mostrar tradução'));
    await tester.pumpAndSettle();

    expect(find.text('Inglês: House'), findsOneWidget);
    expect(find.text('Espanhol: Casa'), findsOneWidget);
  });

  testWidgets('avança para a próxima palavra', (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());
    await tester.tap(find.text('Próxima'));
    await tester.pumpAndSettle();

    expect(find.text('Livro'), findsOneWidget);
    expect(find.text('Palavra 2 de 10'), findsOneWidget);
  });

  testWidgets('volta para a palavra anterior', (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());
    await tester.tap(find.text('Anterior'));
    await tester.pumpAndSettle();

    expect(find.text('Viagem'), findsOneWidget);
    expect(find.text('Palavra 10 de 10'), findsOneWidget);
  });

  testWidgets('permite rolagem quando a altura da tela é pequena', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(320, 380);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const TradutorApp());
    await tester.tap(find.text('Mostrar tradução'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
