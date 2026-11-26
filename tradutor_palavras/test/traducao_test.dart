import 'package:flutter_test/flutter_test.dart';
import 'package:tradutor_palavras/traducao.dart';

void main() {
  const palavra = <String, String>{
    'portugues': 'Casa',
    'ingles': 'House',
    'espanhol': 'Casa',
  };

  test('retorna a tradução para o idioma solicitado', () {
    expect(obterTraducao(palavra, 'ingles'), 'House');
  });

  test('informa quando a palavra não tem tradução para o idioma', () {
    expect(() => obterTraducao(palavra, 'frances'), throwsArgumentError);
  });

  test('informa quando a tradução está vazia', () {
    const palavraComTraducaoVazia = <String, String>{'frances': ''};

    expect(
      () => obterTraducao(palavraComTraducaoVazia, 'frances'),
      throwsArgumentError,
    );
  });

  test('informa quando a tradução contém apenas espaços', () {
    const palavraComTraducaoEmBranco = <String, String>{'frances': '   '};

    expect(
      () => obterTraducao(palavraComTraducaoEmBranco, 'frances'),
      throwsArgumentError,
    );
  });
}
