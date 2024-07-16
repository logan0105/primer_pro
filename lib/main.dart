import 'package:flutter/material.dart';

void main() {
  runApp(HamburguesasApp());
}

class HamburguesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamburguesas App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Lógica de autenticación
                String email = _emailController.text;
                String password = _passwordController.text;

                // Aquí puedes agregar tu lógica de autenticación.
                // Por ahora, solo navega a la página de inicio si el email y la contraseña no están vacíos.
                if (email.isNotEmpty && password.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HamburguesasHomePage()),
                  );
                } else {
                  // Mostrar un mensaje de error
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text('Por favor ingrese su correo electrónico y contraseña.'),
                      );
                    },
                  );
                }
              },
              child: const Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

class HamburguesasHomePage extends StatelessWidget {
  final List<Hamburguesa> hamburguesas = [
    Hamburguesa(
      nombre: 'Hamburguesa Clásica',
      descripcion: 'Deliciosa hamburguesa clásica con queso, lechuga y tomate.',
      imagen: 'assets/clasica.jpg',
    ),
    Hamburguesa(
      nombre: 'Hamburguesa BBQ',
      descripcion: 'Hamburguesa con salsa BBQ, cebolla caramelizada y bacon.',
      imagen: 'assets/bbq.jpg',
    ),
    Hamburguesa(
      nombre: 'Hamburguesa Vegana',
      descripcion: 'Hamburguesa vegana con aguacate, lechuga y tomate.',
      imagen: 'assets/vegana.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamburguesas'),
      ),
      body: ListView.builder(
        itemCount: hamburguesas.length,
        itemBuilder: (context, index) {
          final hamburguesa = hamburguesas[index];
          return Card(
            child: ListTile(
              leading: Image.asset(hamburguesa.imagen),
              title: Text(hamburguesa.nombre),
              subtitle: Text(hamburguesa.descripcion),
            ),
          );
        },
      ),
    );
  }
}

class Hamburguesa {
  final String nombre;
  final String descripcion;
  final String imagen;

  Hamburguesa({
    required this.nombre,
    required this.descripcion,
    required this.imagen,
  });
}
