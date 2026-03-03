import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

/// **ARCHIVO: counter_cubit.dart**
/// 
/// ## Función del Archivo
/// Define la lógica de gestión de estado del contador usando el patrón Cubit.
/// Cubit es una versión simplificada de BLoC que no requiere eventos separados.
///
/// ## Para qué sirve
/// Proporciona una forma más directa y simple de gestionar el estado comparado con BLoC.
/// El patrón Cubit es ideal para:
/// - Aplicaciones simples con lógica de estado poco compleja
/// - Prototipado rápido
/// - Casos donde no se necesita separación estricta entre eventos
/// - UI que llama directamente métodos de la lógica de negocio
///
/// ## Explicación Técnica
/// 
/// ### Clase CounterCubit
/// Hereda de Cubit<CounterState>, lo que significa que:
/// - Maneja un estado de tipo [CounterState]
/// - Emite nuevos estados cuando los datos cambian
/// - Es más simple que BLoC porque no tiene una capa de eventos
///
/// **Diferencia BLoC vs Cubit**:
/// - **BLoC**: Eventos → Manejador de eventos → Estado nuevo
/// - **Cubit**: Método directo → Estado nuevo (sin capa de eventos)
///
/// ### Constructor
/// Inicializa el Cubit con un estado inicial de CounterState(counter: 5, transactionCount: 0)
/// - Nota: El Cubit inicia el contador en 5 (diferente al BLoC que inicia en 10)
///
/// ### Método increaseBy(int value)
/// **Propósito**: Incrementar el contador por un valor específico
/// 
/// **Funcionamiento**:
/// - Recibe directamente el valor a incrementar
/// - Emite un nuevo estado con:
///   - El contador aumentado: `state.counter + value`
///   - El contador de transacciones incrementado en 1
/// - No requiere crear un evento intermedio como en BLoC
///
/// **Parámetros**:
/// - `value`: Cantidad a incrementar (puede ser positivo o negativo)
///
/// ### Método reset()
/// **Propósito**: Resetear el contador a 0
/// 
/// **Funcionamiento**:
/// - Emite un nuevo estado con el contador en 0
/// - Las transacciones no se reinician
///
/// ### Emisión de Estados
/// Ambos métodos usan `emit()` para notificar a los listeners sobre cambios de estado.
/// Este método es la forma estándar en Cubit para cambiar el estado.

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super( const CounterState( counter: 5 ) );

  /// Incrementa el contador por el valor especificado.
  /// También registra la transacción incrementando transactionCount.
  /// 
  /// Parámetros:
  /// - [value]: Cantidad a incrementar (puede ser cualquier entero)
  void increaseBy( int value ) {
    emit( state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  /// Resetea el contador a 0 pero mantiene el contador de transacciones.
  void reset() {
    emit( state.copyWith(
      counter: 0,
    ));
  }

}
