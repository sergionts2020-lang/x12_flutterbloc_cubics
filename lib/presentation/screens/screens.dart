// **ARCHIVO: screens.dart**
// 
// ## Función del Archivo
// Archivo barrel (o índice) que centraliza y exporta todas las screens de la aplicación.
//
// ## Para qué sirve
// Proporciona un punto único de importación para todas las screens. En lugar de
// importar cada screen desde su archivo individual, cualquier otro archivo puede
// hacer un único import de este archivo.
//
// ## Explicación Técnica
// 
// ### Patrón Barrel (Index Pattern)
// 
// Este archivo implementa el patrón "barrel" o "index" común en Dart/Flutter:
// 
// **Ventajas**:
// - **Reducción de imports**: Un import en lugar de múltiples
// - **Organización**: Centraliza punto de entrada a un módulo
// - **Encapsulación**: Controla qué se expone públicamente
// - **Mantenibilidad**: Cambios en estructura interna no afectan importadores
//
// **Ejemplo de uso**:
// 
// **Sin barrel (múltiples imports)**:
// ```dart
// import 'package:forms_app/presentation/screens/home_screen.dart';
// import 'package:forms_app/presentation/screens/bloc_counter_screen.dart';
// import 'package:forms_app/presentation/screens/cubit_counter_screen.dart';
// ```
// 
// **Con barrel (un import)**:
// ```dart
// import 'package:forms_app/presentation/screens/screens.dart';
// ```
//
// ### Exports
// 
// Este archivo exporta:
// 
// 1. **BlocCounterScreen**
//    - Pantalla de demostración con patrón BLoC
//    - Ubicado en: `bloc_counter_screen.dart`
//    - Contiene: BlocCounterScreen + BlocCounterView
// 
// 2. **CubitCounterScreen**
//    - Pantalla de demostración con patrón Cubit
//    - Ubicado en: `cubit_counter_screen.dart`
//    - Contiene: CubitCounterScreen + _CubitCounterView
// 
// 3. **HomeScreen**
//    - Pantalla principal/menú de la aplicación
//    - Ubicado en: `home_screen.dart`
//    - Punto de entrada a las dos demostraciones
//
// ### Uso en la aplicación
// 
// Este archivo es importado en el router (`lib/config/router/app_router.dart`)
// para acceder a todas las screens de forma centralizada.


export 'bloc_counter_screen.dart';
export 'cubit_counter_screen.dart';
export 'home_screen.dart';