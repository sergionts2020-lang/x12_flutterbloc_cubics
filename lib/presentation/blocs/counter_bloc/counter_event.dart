part of 'counter_bloc.dart';

// *ARCHIVO: counter_event.dart*
// 
// ## Función del Archivo
// Define todos los eventos que pueden ocurrir en el BLoC del contador. Los eventos
// representan las acciones o intenciones del usuario que deben ser procesadas por el BLoC.
//
// ## Para qué sirve
// Centraliza la definición de eventos del patrón BLoC. Es parte fundamental de la
// arquitectura BLoC, permitiendo una clara separación entre UI (que dispara eventos)
// y la lógica de negocio (que los procesa).
//
// ## Explicación Técnica
//
// ### Clase abstracta CounterEvent
// Clase base abstracta para todos los eventos del contador. Proporciona:
// - Un tipo común para todos los eventos
// - Un constructor const para permitir instancias const en subclases
// - Facilita el manejo polimórfico de eventos
//
// ### Evento: CounterIncreased
// **Propósito**: Representa la acción de incrementar el contador
// 
// **Propiedades**:
// - `int value`: El valor a incrementar (puede ser positivo o negativo)
// 
// **Uso**:
// - Se dispara cuando el usuario presiona cualquiera de los botones +1, +2, +3
// - El BLoC recibe este evento y actualiza el contador
// - Es una clase const para permitir instancias inmutables
//
// ### Evento: CounterReset
// **Propósito**: Representa la acción de resetear el contador a 0
// 
// **Propiedades**:
// - No tiene parámetros, solo indica la intención de resetear
// 
// **Uso**:
// - Se dispara cuando el usuario presiona el botón de refresh en el AppBar
// - El BLoC recibe este evento y reinicia el contador


abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {}