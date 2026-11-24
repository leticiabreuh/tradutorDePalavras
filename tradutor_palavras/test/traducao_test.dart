import 'package:flutter_test/flutter_test.dart';
import 'package:tradutor_palavras/traducao.dart';

void main() {
  const palavra = <String, String>{
    'portugues': 'Casa',
    'ingles': 'House',
    'espanhol': 'Casa',
  };

  test('retorna a tradução para o idioma solicitado', () {
    expect(obterTraducao(palavra, 'ingles'), 'Houses');
  });

  test('informa quando a palavra não tem tradução para o idioma', () {
    expect(() => obterTraducao(palavra, 'frances'), throwsArgumentError);
  });
}
