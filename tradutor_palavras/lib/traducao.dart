/// Retorna uma tradução da palavra para a chave de idioma informada.
String obterTraducao(Map<String, String> palavra, String idioma) {
  final traducao = palavra[idioma];
  if (traducao == null || traducao.trim().isEmpty) {
    throw ArgumentError.value(idioma, 'idioma', 'Idioma sem tradução');
  }
  return traducao;
}
