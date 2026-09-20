import 'package:flutter/material.dart';

void main() {
  runApp(const TradutorApp());
}

class TradutorApp extends StatelessWidget {
  const TradutorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tradutor de Palavras',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7C3AED),
        ),
        useMaterial3: true,
      ),
      home: const TelaTradutor(),
    );
  }
}

class TelaTradutor extends StatefulWidget {
  const TelaTradutor({super.key});

  @override
  State<TelaTradutor> createState() {
    return _TelaTradutorState();
  }
}

class _TelaTradutorState extends State<TelaTradutor> {
  final List<Map<String, String>> palavras = [
    {
      'portugues': 'Casa',
      'ingles': 'House',
      'espanhol': 'Casa',
    },
    {
      'portugues': 'Livro',
      'ingles': 'Book',
      'espanhol': 'Libro',
    },
    {
      'portugues': 'Cachorro',
      'ingles': 'Dog',
      'espanhol': 'Perro',
    },
    {
      'portugues': 'Água',
      'ingles': 'Water',
      'espanhol': 'Agua',
    },
    {
      'portugues': 'Escola',
      'ingles': 'School',
      'espanhol': 'Escuela',
    },
    {
      'portugues': 'Amigo',
      'ingles': 'Friend',
      'espanhol': 'Amigo',
    },
    {
      'portugues': 'Comida',
      'ingles': 'Food',
      'espanhol': 'Comida',
    },
    {
      'portugues': 'Janela',
      'ingles': 'Window',
      'espanhol': 'Ventana',
    },
    {
      'portugues': 'Coração',
      'ingles': 'Heart',
      'espanhol': 'Corazón',
    },
    {
      'portugues': 'Viagem',
      'ingles': 'Travel',
      'espanhol': 'Viaje',
    },
  ];

  int indiceAtual = 0;
  bool mostrarTraducoes = false;

  void mostrarTraducao() {
    setState(() {
      mostrarTraducoes = true;
    });
  }

  void proximaPalavra() {
    setState(() {
      indiceAtual = (indiceAtual + 1) % palavras.length;
      mostrarTraducoes = false;
    });
  }

  void palavraAnterior() {
    setState(() {
      indiceAtual =
          (indiceAtual - 1 + palavras.length) % palavras.length;
      mostrarTraducoes = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final palavraAtual = palavras[indiceAtual];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tradutor de Palavras'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFCE7F3),
              Color(0xFFEDE9FE),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Português',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                palavraAtual['portugues']!,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C1D95),
                ),
              ),
              const SizedBox(height: 30),
              if (mostrarTraducoes)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Inglês: ${palavraAtual['ingles']}',
                          style: const TextStyle(fontSize: 22),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Espanhol: ${palavraAtual['espanhol']}',
                          style: const TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 35),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: palavraAnterior,
                    child: const Text('Anterior'),
                  ),
                  ElevatedButton(
                    onPressed: mostrarTraducao,
                    child: const Text('Mostrar tradução'),
                  ),
                  ElevatedButton(
                    onPressed: proximaPalavra,
                    child: const Text('Próxima'),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                'Palavra ${indiceAtual + 1} de ${palavras.length}',
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}