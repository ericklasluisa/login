import 'package:flutter/material.dart';
import 'package:login/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _message = '';

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _register() async {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    if (!_isEmailValid(email)) {
      setState(() {
        _message = 'Error: Ingresa un correo válido';
      });
      return;
    }

    final success =
        await AuthService.register(firstName, lastName, email, password);
    if (success) {
      setState(() {
        _message = 'Registro exitoso. Por favor, inicia sesión.';
      });
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context); // Regresar a la pantalla de inicio de sesión
      });
    } else {
      setState(() {
        _message = 'Error: No se pudo registrar el usuario';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Apellido'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Registrar'),
            ),
            SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(
                  color:
                      _message.contains('exitoso') ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
