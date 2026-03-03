import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// **ARCHIVO: home_screen.dart**
// 
// ## Función del Archivo
// Define la pantalla principal de la aplicación que actúa como punto de entrada.
// Esta pantalla permite al usuario elegir entre dos opciones educativas:
// usar Cubit o BLoC para gestionar estado.
//
// ## Para qué sirve
// Proporciona una navegación clara entre las dos demostraciones principales:
// 1. Ejemplo con Cubit (patrón simple)
// 2. Ejemplo con BLoC (patrón completo)
//
// ## Explicación Técnica
// 
// ### Clase HomeScreen
// Estateless widget que representa la pantalla principal sin lógica interna de estado.
// No requiere BLoC ni Cubit porque solo navega entre pantallas.
//
// **Responsabilidades**:
// - Mostrar opciones de navegación
// - Navegar al usuario según su selección
// - Presentar información clara sobre qué es cada patrón
//
// ### Estructura Visual
// 
// **Body (ListView)**:
// Es un ListView para permitir scroll si el contenido crece.
// Contiene ListTiles como opciones navegables.
//
// **ListTile 1: Cubits**
// - **Título**: 'Cubits'
// - **Subtítulo**: 'Gestor de estado simple'
// - **Ícono**: Arrow forward (indica navegación)
// - **onTap**: Navega a '/cubits' usando `context.push()`
// 
// go_router proporciona el método `push()` que:
// - Navega a la ruta especificada
// - Mantiene la pila de navegación (puede volver atrás)
//
// **ListTile 2: BLoC**
// - **Título**: 'BLoC'
// - **Subtítulo**: 'Gestor de estado compuesto'
// - **Ícono**: Arrow forward (indica navegación)
// - **onTap**: Navega a '/counter-bloc' usando `context.push()`
//
// **Divider**:
// Una línea divisora entre las opciones para mejor separación visual.
// Usa Padding para los márgenes horizontales.
//
// ### Integración con GoRouter
// Esta pantalla funciona con la configuración de rutas definida en
// [lib/config/router/app_router.dart]
// 
// Las rutas son:
// - '/' → HomeScreen (actual)
// - '/cubits' → CubitCounterScreen
// - '/counter-bloc' → BlocCounterScreen


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon( Icons.arrow_forward_ios_rounded ),
            onTap: () => context.push('/cubits'),
          ),

          ListTile(
            title: const Text('BLoC'),
            subtitle: const Text('Gestor de estado compuesto'),
            trailing: const Icon( Icons.arrow_forward_ios_rounded ),
            onTap: () => context.push('/counter-bloc'),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
        
        ],


      ),
    );
  }
}