import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

// **ARCHIVO: cubit_counter_screen.dart**
// 
// ## Función del Archivo
// Define la pantalla que demuestra el patrón Cubit para gestión de estado.
// Muestra cómo usar Cubit de manera más simple que BLoC, sin necesidad de eventos.
//
// ## Para qué sirve
// Proporciona una interfaz visual que permite al usuario interactuar con el
// contador usando el patrón Cubit. Demuestra:
// - Cómo crear y proveer un Cubit
// - Cómo leer estado del Cubit
// - Cómo llamar métodos directamente (sin eventos)
// - Diferencia entre context.select y BlocBuilder
//
// ## Explicación Técnica
// 
// El archivo contiene DOS clases principales:
//
// ### Clase CubitCounterScreen
// 
// **Tipo**: StatelessWidget estándar
// 
// **Responsabilidad**: Crear y proveer el Cubit a toda la pantalla
// 
// **Implementación**:
// ```dart
// BlocProvider(
//   create: (_) => CounterCubit(),        // Instancia nueva del Cubit
//   child: const _CubitCounterView()      // Widget hijo que lo usa
// )
// ```
// 
// **BlocProvider**:
// - Widget que proporciona la instancia de CounterCubit a toda la pantalla
// - Usa el mismo sistema que para BLoC (ambos usan flutter_bloc)
// - Está disponible mediante context.read/watch en cualquier descendiente
//
// ### Clase _CubitCounterView
// 
// **Tipo**: StatelessWidget
// 
// **Nota**: Nombre privado (_CubitCounterView) - convención de privacidad
// 
// **Responsabilidad**: Construir la UI que interactúa con el Cubit
// 
// #### Método increaseCounterBy
// ```dart
// void increaseCounterBy( BuildContext context, [ int value = 1 ])
// ```
// 
// **Propósito**: Llamar directamente el método del Cubit sin eventos
// 
// **Funcionamiento**:
// - Obtiene el Cubit con `context.read<CounterCubit>()`
// - Llama directamente `increaseBy(value)` (no usa eventos como BLoC)
// - Es más directo que el patrón BLoC
// 
// **Parámetro**: value - cantidad a incrementar (por defecto 1)
//
// #### Estructura de UI
// 
// **AppBar**:
// - **Título**: Usa `context.select()` para mostrar transactionCount
// 
// `context.select()` optimiza:
// - Solo reconstruye cuando cambia `value.state.transactionCount`
// - Evita reconstrucciones innecesarias
// 
// - **Action Button (refresh)**:
//   - Llama `context.read<CounterCubit>().reset()`
//   - Usa read porque no necesita reconstrucción
//
// **Body - CenterChild**:
// - Usa **BlocBuilder** (alternativa a context.select)
// 
// **Diferencia BlocBuilder vs context.select**:
// 
// | Opción | Ventaja | Desventaja |
// |--------|---------|-----------|
// | `context.select()` | Más conciso, automático | Menos control |
// | `BlocBuilder` | Control explícito de reconstrucción | Verboso |
// 
// **BlocBuilder Específico**:
// ```dart
// BlocBuilder<CounterCubit, CounterState>(
//   builder: (context, state) { ... }
// )
// ```
// 
// Parámetro `buildWhen` (comentado):
// - `buildWhen: (previous, current) => current.counter != previous.counter`
// - Permite control manual: solo reconstruir si counter es diferente
// - Útil para optimizaciones muy específicas
//
// **Print Debug**:
// - `print('Estado cambió')` muestra cada reconstrucción en consola
// - Útil para entender cuándo se reconstruye el widget
//
// **FloatingActionButton**:
// - Columna de 3 botones con heroTags únicos:
//   - '+3': `increaseCounterBy(context, 3)`
//   - '+2': `increaseCounterBy(context, 2)`
//   - '+1': `increaseCounterBy(context)` (usa valor por defecto 1)
// 
// **SizedBox(height: 15)**: Espaciado entre botones
//
// #### Código Comentado
// 
// **Línea 24 comentada**:
// ```dart
// // final counterState = context.watch<CounterCubit>().state;
// ```
// 
// Muestra alternativa con `context.watch()`:
// - Obtiene y observa todo el estado
// - Reconstruye en CUALQUIER cambio de estado
// - Menos optimizado que select/BlocBuilder
//
// ### Flujo de Interacción
// 
// 1. Usuario toca botón "+3"
// 2. Se ejecuta `increaseCounterBy(context, 3)`
// 3. Se llama `context.read<CounterCubit>().increaseBy(3)`
// 4. Cubit emite nuevo estado: `counter + 3, transactionCount + 1`
// 5. BlocBuilder y context.select() se reconstruyen
// 6. UI muestra valores nuevos
// 7. Print debug: "Estado cambió" aparece en consola
//
// ### Comparación Cubit vs BLoC en esta pantalla
// 
// **Cubit (esta pantalla)**:
// - Métodos directos: `increaseBy()`, `reset()`
// - Sin eventos: más simple de seguir
// - Menos boilerplate
// 
// **BLoC (otra pantalla)**:
// - Eventos: `CounterIncreased`, `CounterReset`
// - Manejadores: `_onCounterIncreased`, `_onCounterReset`
// - Más control y trazabilidad
// - Mejor para aplicaciones complejas


class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  // Incrementa el contador por un valor específico.
  // Llama directamente al método del Cubit sin eventos.
  // 
  // Parámetros:
  // - [context]: BuildContext para acceder al Cubit
  // - [value]: Cantidad a incrementar (valor por defecto 1)
  void increaseCounterBy( BuildContext context, [ int value = 1 ]) {
    context.read<CounterCubit>().increaseBy(value);
  }


  @override
  Widget build(BuildContext context) {

    // Alternativa de obtener estado completo (menos optimizada):
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
        appBar: AppBar(
          title: context.select(( CounterCubit value) {
            return Text('Cubit Counter: ${ value.state.transactionCount }');
          }),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<CounterCubit>().reset();
                }, 
              icon: const Icon(Icons.refresh_outlined))
          ],
        ),
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            // Opcional: solo reconstruir cuando counter cambia (no transactionCount)
            // buildWhen: (previous, current) => current.counter != previous.counter,
            builder: (context, state) {
              print('Estado cambió');
              return Text('Counter value: ${ state.counter }');
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: '1', child: const Text('+3'), onPressed: () => increaseCounterBy(context, 3) ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
                heroTag: '2', child: const Text('+2'), onPressed: () => increaseCounterBy(context, 2) ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
                heroTag: '3', child: const Text('+1'), onPressed: () => increaseCounterBy(context) ),
          ],
        ));
  }
}
