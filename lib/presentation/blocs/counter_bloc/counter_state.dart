part of 'counter_bloc.dart';

// **ARCHIVO: counter_state.dart**
// 
// ## Función del Archivo
// Define el estado del BLoC del contador. El estado representa la situación actual
// de los datos que maneja el BLoC en un momento específico.
//
// ## Para qué sirve
// Proporciona un objeto inmutable que representa el estado del contador. Este objeto
// es emitido por el BLoC cuando el estado cambia, permitiendo que los widgets se
// actualicen reactivamente.
//
// ## Explicación Técnica
//
// ### Clase CounterState
// Extiende [Equatable] para permitir comparación de igualdad basada en propiedades.
//
// **Propiedades**:
// - `int counter`: El valor actual del contador (valor inicial = 10)
// - `int transactionCount`: El número de transacciones/cambios realizados (valor inicial = 0)
//
// **Por qué son importantes:**
// - **counter**: Es el dato principal que se muestra en la UI
// - **transactionCount**: Rastrea cuántas veces se ha modificado el estado, útil para
//   debugging y analytics
//
// ### Constructor
// Acepta dos parámetros opcionales con valores por defecto:
// - `counter = 10`: Inicia con valor 10
// - `transactionCount = 0`: Inicia sin transacciones
//
// ### Método copyWith
// **Propósito**: Crear una nueva instancia de CounterState con algunos valores modificados
// 
// **Funcionalidad**:
// - Recibe parámetros opcionales (null si no se especifican)
// - Crea un nuevo CounterState con valores actualizado o iguales a los anteriores
// - Patrón típico en Flutter para mantener inmutabilidad
// 
// **Ejemplo de uso**:
// ```dart
// // Si state.counter = 10 y queremos aumentar a 11
// state.copyWith(counter: state.counter + 1)
// // Resultado: CounterState(counter: 11, transactionCount: <sin cambios>)
// ```
//
// ### Implementación de Equatable
// La lista `props` contiene todas las propiedades usadas para comparar igualdad.
// Dos CounterState son iguales si:
// - Tienen el mismo valor en `counter`
// - Tienen el mismo valor en `transactionCount`
//
// Esto permite que BlocBuilder solo reconstruya widgets cuando el estado realmente
// cambia, optimizando el rendimiento.


class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 10, 
    this.transactionCount = 0
  });

  CounterState copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  
  @override
  List<Object> get props => [counter, transactionCount];
}


