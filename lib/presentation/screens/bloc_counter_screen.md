# BlocCounterScreen — Explicación funcional y técnica

## Resumen

`BlocCounterScreen` es una pantalla que provee y consume un `CounterBloc` para mostrar y modificar un contador. La UI es mínima: muestra el valor actual del contador y un título con el número de transacciones; además expone botones flotantes para incrementar el contador en +1, +2 o +3 y un botón para reiniciarlo.

## Uso funcional (qué hace)

- **Creación del Bloc:** al mostrarse, envuelve su vista con un `BlocProvider` que crea una instancia de `CounterBloc`.
- **Título dinámico:** la barra de la app muestra `Bloc Counter <transactionCount>`, donde `<transactionCount>` proviene del estado del `CounterBloc`.
- **Valor mostrado:** el cuerpo centra un `Text` con `Counter value: <counter>` usando el valor actual del estado.
- **Acciones:** tres botones flotantes incrementan el contador (+3, +2, +1). El icono de refrescar reinicia el contador.

## Detalle técnico (cómo lo hace)

- **Proveedor de estado:** el widget `BlocCounterScreen` contiene un `BlocProvider(create: (_) => CounterBloc())`, que inyecta el `CounterBloc` en el árbol de widgets para sus hijos.
- **Vista separada:** la UI real se implementa en `BlocCounterView`, un `StatelessWidget` que consume el `CounterBloc` mediante `BuildContext`.
- **Método incrementador:** `increaseCounterBy(BuildContext context, [int value = 1])` lee el bloc con `context.read<CounterBloc>()` y llama a `increaseBy(value)`. Hay una línea comentada que sugiere una versión basada en eventos (`add(CounterIncreased(value))`), lo que indica que el `CounterBloc` también podría exponerse como un Bloc clásico con eventos, pero aquí se usan métodos directamente sobre la instancia.
- **Selección eficiente de estado:** el código usa `context.select(...)` en dos lugares para evitar reconstrucciones innecesarias:
  - en el `AppBar.title` se selecciona `bloc.state.transactionCount` para reconstruir solo cuando cambie ese campo;
  - en el `body` se selecciona `counterBloc.state.counter` para actualizar únicamente el texto del contador cuando cambie el `counter`.
  `context.select` es parte de `flutter_bloc` y permite suscribirse a fragmentos concretos del estado.
- **Interacciones y heroTags:** los tres `FloatingActionButton` tienen `heroTag` distintos (`'1'`, `'2'`, `'3'`) para evitar conflictos con animaciones compartidas y cada uno llama a `increaseCounterBy` con el incremento correspondiente.
- **Reset:** el `IconButton` en `AppBar.actions` invoca `context.read<CounterBloc>().resetCounter()` para restaurar el estado inicial.

## Suposiciones sobre `CounterBloc`

- El `CounterBloc` expone métodos `increaseBy(int)`, `resetCounter()` y un `state` que contiene al menos los campos `counter` y `transactionCount`.
- La ruta de import en el código indica `package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart` para la implementación del bloc.

## Recomendaciones y notas

- Si el proyecto desea seguir un patrón puramente orientado a eventos, use `context.read<CounterBloc>().add(...)` y defina eventos en el bloc. Si prefiere una API de métodos (más directa), mantenga `increaseBy` y `resetCounter` como helpers en la implementación del bloc.
- Para una granularidad aún mayor de reconstrucciones se puede usar `BlocSelector<CounterBloc, CounterState, int>` en lugar de `context.select` si se desea más claridad en la jerarquía de widgets.
- El componente es sencillo y apropiado para ejemplos o pantallas de prueba; en pantallas más complejas conviene extraer los botones y la visualización del estado en widgets separados para facilitar pruebas y reutilización.

---

Archivo fuente: [lib/presentation/screens/bloc_counter_screen.dart](lib/presentation/screens/bloc_counter_screen.dart)
