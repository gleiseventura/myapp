import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Layout Responsivo',
      home: const LayoutResponsivo(),
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
    );
  }
}

class LayoutResponsivo extends StatelessWidget {
  const LayoutResponsivo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Layout Flutter Web'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Layout para telas pequenas (mobile)
            return _buildMobileLayout();
          } else {
            // Layout para telas grandes (tablet/desktop)
            return _buildDesktopLayout();
          }
        },
      ),
    );
  }

  // Layout para telas pequenas (mobile)
  Widget _buildMobileLayout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bem-vindo ao Flutter Web!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print('Botão clicado!');
            },
            child: const Text('Clique aqui'),
          ),
        ],
      ),
    );
  }

  // Layout para telas grandes (desktop)
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Container(
          width: 200,
          color: Colors.blue[100],
          child: ListView(
            children: const [
              ListTile(
                title: Text('Início'),
                leading: Icon(Icons.home),
              ),
              ListTile(
                title: Text('Sobre'),
                leading: Icon(Icons.info),
              ),
              ListTile(
                title: Text('Configurações'),
                leading: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bem-vindo ao Flutter Web!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('Botão clicado!');
                  },
                  child: const Text('Clique aqui'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

