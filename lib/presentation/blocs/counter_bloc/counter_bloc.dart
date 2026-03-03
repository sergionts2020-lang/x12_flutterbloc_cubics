import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// * ARCHIVO: counter_bloc.dart *
// Este archivo contiene el BLoC encargado de gestionar el estado
// del contador de la aplicación.
// BLoC = Business Logic Component
// Patrón avanzado de gestión de estado que separa:
//   - Eventos: acciones que ocurren (inputs)
//   - Estados: representación de datos en un momento dado
//   - Transiciones: lógica que convierte eventos en estados
//
// * ¿Para qué sirve? *
// Gestionar el contador de forma escalable y testeable.
// Ideal cuando existen múltiples eventos o lógica compleja.
// Comparado con Cubit, ofrece más estructura y trazabilidad.
//
// * Contenido técnico *
// Clase CounterBloc
// Hereda de Bloc<CounterEvent, CounterState>.
// Recibe eventos ([CounterEvent]) y emite estados ([CounterState]).
//
// Constructor
// Inicializa con estado inicial (counter=10).
// Registra handlers de eventos:
//   - on<CounterIncreased>(_onCounterIncreased)
//   - on<CounterReset>(_onCounterReset)
//
// Métodos privados (handlers)
// _onCounterIncreased: incrementa contador y transactionCount.
// _onCounterReset: reinicia contador a 0.
//
// Métodos públicos (helpers)
// increaseBy([int value = 1]) -> añade evento CounterIncreased.
// resetCounter() -> añade evento CounterReset.
//
// * Observaciones *
// Los estados son inmutables; se usa copyWith() para modificarlos.
// Se utiliza Equatable para comparar estados por valor.
//



class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterState()) {
    
    on<CounterIncreased>( _onCounterIncreased );
    on<CounterReset>( _onCounterReset );

  }

  // Handler para el evento CounterIncreased
  // Este método no se llama directamente desde la UI.
  // Es invocado por el BLoC cuando se añade el evento correspondiente.
  // PARAMETERS:
  //   - event.value : valor que se desea sumar al contador
  //   - emit        : función usada para emitir el nuevo estado
  // ACTIONS:
  //   1. Usa copyWith para mantener inmutabilidad
  //   2. Incrementa transactionCount para llevar registro
  void _onCounterIncreased( CounterIncreased event, Emitter<CounterState> emit ) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCount: state.transactionCount + 1
    ));
  }

  // Handler para el evento CounterReset
  // Resetea únicamente el valor del contador a 0.
  // No modifica transactionCount (podría mantenerse para auditoría).
  void _onCounterReset( CounterReset event, Emitter<CounterState> emit ) {
    emit(state.copyWith(
      counter: 0,
    ));
  }

  // Método público
  // Solicita un incremento del contador añadiendo un evento.
  // El parámetro es opcional; si se omite, se suma 1.
  void increaseBy([int value = 1]){
    add( CounterIncreased(value) );    
  }

  // Método público
  // Pone el contador a cero enviando el evento correspondiente.
  // Útil para botones de 'refresh' o reinicio rápido.
  void resetCounter(){
    add( CounterReset() );
  }

}
