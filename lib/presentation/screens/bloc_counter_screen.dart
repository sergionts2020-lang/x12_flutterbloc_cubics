import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

// **ARCHIVO: bloc_counter_screen.dart**
// 
// ## Función del Archivo
// Define la pantalla que demuestra el patrón BLoC para gestión de estado.
// Muestra cómo usar BLoC con eventos para incrementar un contador.
//
// ## Para qué sirve
// Proporciona una interfaz visual que permite al usuario interactuar con el
// contador usando el patrón BLoC. Es una demostración práctica de:
// - Cómo crear y proveer un BLoC
// - Cómo leer estado del BLoC
// - Cómo disparar eventos
// - Cómo usar context.select para optimización
//
// ## Explicación Técnica
// 
// El archivo contiene DOS clases principales:
//
// ### Clase BlocCounterScreen
// 
// **Tipo**: StatelessWidget estándar
// 
// **Responsabilidad**: Crear y proveer el BLoC a toda la pantalla
// 
// **Implementación**:
// ```dart
// BlocProvider(
//   create: (_) => CounterBloc(),  // Instancia nueva cada vez
//   child: const BlocCounterView()  // Widget hijo que usa el BLoC
// )
// ```
// 
// **BlocProvider**:
// - Widget que proporciona una instancia de CounterBloc a su subtree
// - `create`: Factory que crea la instancia (se llama una sola vez)
// - El BLoC está disponible en todo el árbol descendiente usando context.read/watch
//
// ### Clase BlocCounterView
// 
// **Tipo**: StatelessWidget
// 
// **Responsabilidad**: Construir la UI interactiva que usa el BLoC
// 
// #### Método increaseCounterBy
// ```dart
// void increaseCounterBy( BuildContext context, [ int value = 1 ])
// ```
// 
// **Propósito**: Método auxiliar que dispara un evento en el BLoC
// 
// **Funcionamiento**:
// - Usa `context.read<CounterBloc>()` para obtener la instancia del BLoC
// - Llama al método `increaseBy(value)` que internamente agrega un evento
// - Parámetro opcional `value` con valor por defecto de 1
// 
// **Nota**: El código comentado muestra la forma alternativa
// (directamente agregando un evento con `.add()`)
//
// #### Estructura de UI
// 
// **AppBar**:
// - **Título**: Usa `context.select()` para mostrar el contador de transacciones
// 
// `context.select()` es una optimización:
// - Solo reconstruye cuando la propiedad especificada cambia
// - Aquí solo se reconstruye cuando `blocs.state.transactionCount` cambia
// - Más eficiente que `context.watch()` que reconstruye en cualquier cambio
// 
// - **Action Button (refresh)**: 
//   - Icono de recarga que resetea el contador
//   - Usa `context.read()` directamente (no necesita reconstrucción)
//
// **Body**:
// - **Center + Text**: 
//   - Muestra el valor actual del contador
//   - Usa `context.select()` para reconstruir solo cuando counter cambia
//
// **FloatingActionButton**:
// - Columna de 3 botones flotantes:
//   - Botón '+3': Incrementa 3 unidades (heroTag '1')
//   - Botón '+2': Incrementa 2 unidades (heroTag '2')  
//   - Botón '+1': Incrementa 1 unidad (heroTag '3')
// 
// **heroTag**: Identificador único para cada FAB
// - Necesario cuando hay múltiples FABs en la misma pantalla
// - Evita conflictos de animación
//
// #### Diferencia entre context.read y context.select
// 
// | Método | Cuándo reconstruye | Uso |
// |--------|-------------------|-----|
// | `context.read()` | Nunca | Acciones puntuales (botones, etc) |
// | `context.watch()` | Cualquier cambio en el estado | Mostrar datos (texto, listas) |
// | `context.select()` | Solo cambio específico | Optimizar - mostrar datos específicos |
//
// ### Flujo de Interacción
// 
// 1. Usuario toca botón '+3'
// 2. Se ejecuta `increaseCounterBy(context, 3)`
// 3. Se llama `context.read<CounterBloc>().increaseBy(3)`
// 4. CounterBloc agrega evento `CounterIncreased(3)`
// 5. BLoC maneja el evento y emite nuevo estado
// 6. Widgets que usan `context.select()` se reconstruyen
// 7. UI se actualiza con nuevo contador


class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCounterView()
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  // Incrementa el contador por un valor específico.
  // Dispara un evento en el BLoC desde la UI.
  // 
  // Parámetros:
  // - [context]: BuildContext para acceder al BLoC
  // - [value]: Cantidad a incrementar (valor por defecto 1)
  void increaseCounterBy( BuildContext context, [ int value = 1 ]) {
    // Alternativa comentada: agregar evento directamente
    // context.read<CounterBloc>()
    //   .add( CounterIncreased(value) );
    
    // Opción preferida: usar método del BLoC
    context.read<CounterBloc>()
      .increaseBy(value);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc bloc) => Text('Bloc Counter ${ bloc.state.transactionCount }')
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().resetCounter(), 
            icon: const Icon( Icons.refresh_outlined )
          )
        ],
      ),
      body: Center(
        child: context.select(
          ( CounterBloc counterBloc) => Text('Counter value: ${ counterBloc.state.counter }')
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => increaseCounterBy(context, 3)
          ),
          const SizedBox(height: 15,),

          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increaseCounterBy(context, 2)
          ),
          const SizedBox(height: 15,),

          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => increaseCounterBy(context)
          ),

        ],
      )
    );
  }
}