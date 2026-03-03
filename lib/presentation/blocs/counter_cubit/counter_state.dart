part of 'counter_cubit.dart';

/// **ARCHIVO: counter_state.dart (Cubit)**
/// 
/// ## Función del Archivo
/// Define el estado del contador para el patrón Cubit. Aunque comparte el mismo nombre
/// que el archivo en counter_bloc, este es específico para el Cubit y tiene características
/// similares pero se usa de manera diferente.
///
/// ## Para qué sirve
/// Proporciona un objeto inmutable que captura el estado actual del contador en un
/// momento específico. Es emitido por CounterCubit cada vez que el estado cambia.
///
/// ## Explicación Técnica
///
/// ### Clase CounterState
/// Extiende [Equatable] para permitir comparación de igualdad basada en sus propiedades.
///
/// **Propiedades**:
/// - `int counter`: El valor actual del contador (valor inicial = 0)
///   - En el BLoC versión inicia en 10, aquí inicia en 0
/// - `int transactionCount`: Número total de veces que se ha modificado el estado (inicial = 0)
///
/// ### Constructor
/// Acepta dos parámetros opcionales con valores por defecto:
/// - `counter = 0`: Inicia en 0
/// - `transactionCount = 0`: Inicia sin transacciones
///
/// **Nota**: Aunque el Cubit se inicializa en counter: 5, el CounterState tiene
/// valor por defecto 0, que se sobrescribe en el constructor del Cubit.
///
/// ### Método copyWith
/// **Propósito**: Crear una nueva instancia del estado con propiedades actualizadas
/// 
/// **Características**:
/// - Parámetros opcionales (null si no se especifican)
/// - Retorna un nuevo CounterState con valores actualizados o los anteriores si no se especifican
/// - Mantiene la inmutabilidad del estado
/// 
/// **Nota importante**: A diferencia del BLoC, este método NO tiene tipo de retorno
/// explícito en la declaración (está implicit por Dart). 
/// Funcional: `copyWith(counter: 15) => CounterState(counter: 15, transactionCount: 0)`
///
/// ### Implementación de Equatable
/// La propiedad `props` incluye todas las propiedades para comparación:
/// - [counter, transactionCount]
/// 
/// Dos estados son iguales si ambas propiedades coinciden, permitiendo que
/// BlocBuilder solo reconstruya widgets cuando el estado realmente cambia.


class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0, 
    this.transactionCount = 0
  });

  copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  
  @override
  List<Object> get props => [ counter, transactionCount ];

}
