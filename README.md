# Inicio de sesión

Esta es una aplicación de Flutter que permite a los usuarios registrarse e iniciar sesión utilizando un backend que maneja la autenticación con JWT.

## Integrantes

- Erick Lasluisa
- Francisco Quiroga
- Ariel Rivadeneira
- Augusto Salazar

## Instalación

1. Clona este repositorio:

   ```sh
   git clone https://github.com/ericklasluisa/login.git
   cd login
   ```

2. Instala las dependencias:

   ```sh
   flutter pub get
   ```

3. Ejecuta la aplicación:

   ```sh
   flutter run -d chrome --web-browser-flag "--disable-web-security"
   ```

   > **Nota:**
   > Es importante usar este comando para evitar problemas de CORS en el navegador.

## Estructura del Código

### `lib/main.dart`

Este archivo es el punto de entrada de la aplicación. Configura el tema y la pantalla inicial de la aplicación.

### `lib/screens/login_screen.dart`

Esta pantalla permite a los usuarios iniciar sesión. Utiliza `AuthService` para manejar la autenticación.

### `lib/screens/register_screen.dart`

Esta pantalla permite a los usuarios registrarse. También utiliza `AuthService` para manejar el registro.

### `lib/screens/home_screen.dart`

Esta pantalla muestra un mensaje de bienvenida y el token JWT del usuario después de iniciar sesión.

### `lib/services/auth_service.dart`

Este archivo contiene la lógica para interactuar con el backend de autenticación. Incluye métodos para iniciar sesión y registrarse.
