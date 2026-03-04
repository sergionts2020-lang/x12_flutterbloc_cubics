# CubitCounterScreen — Explicación funcional y técnica

## Resumen

`CubitCounterScreen` es una pantalla que crea y utiliza un `CounterCubit` para gestionar un contador. La UI muestra el valor actual del contador, un título con el número de transacciones y botones flotantes para incrementar el contador en +1, +2 o +3, además de un botón para reiniciar el contador.

## Uso funcional (qué hace)

- **Creación del Cubit:** al mostrarse, envuelve su vista con un `BlocProvider` que crea una instancia de `CounterCubit`.
- **Título dinámico:** la `AppBar` muestra `Cubit Counter: <transactionCount>` obtenido desde el estado del `CounterCubit`.
- **Valor mostrado:** el cuerpo centra un `Text` con `Counter value: <counter>` usando el estado recibido por `BlocBuilder`.
- **Acciones:** tres `FloatingActionButton` incrementan el contador (+3, +2, +1). El icono de refrescar en la barra invoca `reset()` sobre el cubit.

## Detalle técnico (cómo lo hace)

- **Proveedor de estado:** `CubitCounterScreen` incluye `BlocProvider(create: (_) => CounterCubit())` para inyectar el `CounterCubit` en el árbol de widgets.
- **Vista separada:** la UI se implementa en `_CubitCounterView`, un `StatelessWidget` que consume el cubit mediante `BuildContext`.
- **Método incrementador:** `increaseCounterBy(BuildContext context, [int value = 1])` usa `context.read<CounterCubit>().increaseBy(value)` para cambiar el estado.
- **Construcción reactiva:** el `body` usa `BlocBuilder<CounterCubit, CounterState>` para reconstruir el `Text` cada vez que el estado cambie. Hay un `print('Estado cambió')` en el `builder`, útil para depuración y para observar cuándo se re-renderiza el widget.
- **Selección eficiente del título:** en el `AppBar.title` se usa `context.select((CounterCubit value) => Text('Cubit Counter: ${ value.state.transactionCount }'))` para suscribirse únicamente al `transactionCount` y evitar reconstrucciones innecesarias del título.
- **Opciones de control fino:** hay un comentario en el `BlocBuilder` que sugiere que se podría usar `buildWhen` para controlar cuándo reconstruir basándose en cambios concretos de `previous` y `current`.
- **heroTag en FABs:** cada `FloatingActionButton` tiene un `heroTag` distinto (`'1'`, `'2'`, `'3'`) para evitar conflictos de animación.

## Suposiciones sobre `CounterCubit` y `CounterState`

- El `CounterCubit` expone métodos `increaseBy(int)` y `reset()` y mantiene un `state` con al menos los campos `counter` y `transactionCount`.
- El `CounterState` expone `counter` (valor actual) y `transactionCount` (conteo de operaciones/actualizaciones).

## Diferencias con la versión `Bloc` (comparación rápida)

- **API:** aquí se usa un `Cubit` (API basada en métodos) frente a la versión `Bloc` que podría usar eventos; en `Cubit` se llama directamente a métodos como `increaseBy` y `reset`.
- **Builder vs select:** la pantalla usa `BlocBuilder` para el cuerpo y `context.select` para el título. En la versión `Bloc` anterior se usó `context.select` tanto para el título como para el cuerpo; aquí se muestra cómo combinar ambos enfoques.
- **Depuración:** el `BlocBuilder` incluye un `print` para ver reconstrucciones — útil en ejemplos y formación, pero conviene quitarlo en producción.

## Recomendaciones

- Elimina el `print('Estado cambió')` en producción o reemplázalo por un logger configurado.
- Para evitar rebuilds innecesarios del `body`, considere usar `buildWhen` en `BlocBuilder` o `BlocSelector` para seleccionar únicamente `state.counter`.
- Si se desea una API completamente orientada a eventos, se puede migrar a `Bloc` y exponer eventos como `CounterIncreased` y `CounterReset`.

---

Archivo fuente: [lib/presentation/screens/cubit_counter_screen.dart](lib/presentation/screens/cubit_counter_screen.dart)
