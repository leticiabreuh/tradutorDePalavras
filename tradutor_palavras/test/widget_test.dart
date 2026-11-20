import 'package:flutter_test/flutter_test.dart';
import 'package:tradutor_palavras/main.dart';

void main() {
  testWidgets('Deve iniciar mostrando a primeira palavra',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());

    expect(find.text('Casa'), findsOneWidget);
    expect(find.text('Palavra 1 de 10'), findsOneWidget);
  });

  testWidgets('Deve mostrar as traduções da palavra',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.text('Mostrar tradução'));
    await tester.pumpAndSettle();

    expect(find.text('Inglês: House'), findsOneWidget);
    expect(find.text('Espanhol: Casa'), findsOneWidget);
  });

  testWidgets('Deve avançar para a próxima palavra',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.text('Próxima'));
    await tester.pumpAndSettle();

    expect(find.text('Livro'), findsOneWidget);
    expect(find.text('Palavra 2 de 10'), findsOneWidget);
  });

  testWidgets('Deve voltar para a palavra anterior',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TradutorApp());

    await tester.tap(find.text('Anterior'));
    await tester.pumpAndSettle();

    expect(find.text('Viagem'), findsOneWidget);
    expect(find.text('Palavra 10 de 10'), findsOneWidget);
  });
}