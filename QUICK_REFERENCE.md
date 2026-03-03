# 🗂️ Guía Rápida de Referencia - FormsApp

## 📍 Índice Rápido de Ubicaciones

### 🏠 Archivo Principal
```
lib/main.dart → MaterialApp.router + GoRouter + AppTheme
```

### 🔀 Navegación (GoRouter)
```
lib/config/router/app_router.dart
├── / → HomeScreen
├── /cubits → CubitCounterScreen
└── /counter-bloc → BlocCounterScreen
```

### 🎨 Tema Visual
```
lib/config/theme/app_theme.dart
└── Material Design 3 + Deep Purple
```

---

## 📚 Documentación de Presentation

### 📁 Carpeta: `lib/presentation/blocs/`
Contiene toda la lógica de gestión de estado

#### BLoC (Patrón Completo con Eventos)
| Archivo | Documentación | Función |
|---------|--------------|---------|
| [counter_bloc.dart](lib/presentation/blocs/counter_bloc/counter_bloc.dart) | ✅ Incluida | Lógica principal BLoC, maneja eventos |
| [counter_event.dart](lib/presentation/blocs/counter_bloc/counter_event.dart) | ✅ Incluida | Define CounterIncreased y CounterReset |
| [counter_state.dart](lib/presentation/blocs/counter_bloc/counter_state.dart) | ✅ Incluida | Estado: counter=10, transactionCount |

#### Cubit (Patrón Simple, Métodos Directos)
| Archivo | Documentación | Función |
|---------|--------------|---------|
| [counter_cubit.dart](lib/presentation/blocs/counter_cubit/counter_cubit.dart) | ✅ Incluida | Lógica Cubit, métodos increaseBy y reset |
| [counter_state.dart](lib/presentation/blocs/counter_cubit/counter_state.dart) | ✅ Incluida | Estado: counter=0, transactionCount |

---

### 📁 Carpeta: `lib/presentation/screens/`
Contiene toda la interfaz de usuario

| Archivo | Documentación | Función |
|---------|--------------|---------|
| [home_screen.dart](lib/presentation/screens/home_screen.dart) | ✅ Incluida | Pantalla principal con menú de opciones |
| [bloc_counter_screen.dart](lib/presentation/screens/bloc_counter_screen.dart) | ✅ Incluida | Demostración del patrón BLoC |
| [cubit_counter_screen.dart](lib/presentation/screens/cubit_counter_screen.dart) | ✅ Incluida | Demostración del patrón Cubit |
| [screens.dart](lib/presentation/screens/screens.dart) | ✅ Incluida | Archivo barrel (índice de exports) |

---

## 🎯 Cheat Sheet: Cubit vs BLoC

### ¿Cuándo usar Cubit?
```
✅ Contadores simples
✅ Booleanos (visible/oculto)
✅ Selecciones en dropdowns
✅ Aplicaciones pequeñas
✅ Aprendizaje inicial
```

### ¿Cuándo usar BLoC?
```
✅ Autenticación
✅ Flujos complejos
✅ Múltiples eventos
✅ Aplicaciones medianas/grandes
✅ Equipos grandes
```

---

## 💻 Código Rápido - Patrones Comunes

### Usar Cubit en Widget
```dart
// Leer (ejecutar acción)
context.read<CounterCubit>().increaseBy(3);

// Observar (mostrar dato)
context.watch<CounterCubit>().state.counter

// Seleccionar (optimizar, solo propiedad específica)
context.select((CounterCubit c) => c.state.counter)
```

### Usar BLoC en Widget
```dart
// Leer (ejecutar acción)
context.read<CounterBloc>().increaseBy(3);

// Observar (mostrar dato)
context.watch<CounterBloc>().state.counter

// Seleccionar (optimizar)
context.select((CounterBloc b) => b.state.counter)
```

### Proveer BLoC/Cubit
```dart
BlocProvider(
  create: (_) => CounterCubit(),
  child: const _View()
)
```

### Reconstruir Selectivamente
```dart
// Opción 1: context.select (recomendado)
context.select((CounterCubit c) => c.state.counter)

// Opción 2: BlocBuilder con buildWhen
BlocBuilder<CounterCubit, CounterState>(
  buildWhen: (prev, curr) => prev.counter != curr.counter,
  builder: (context, state) => Text('${state.counter}'),
)
```

---

## 🚦 Flujos de Interacción

### Flujo Cubit
```
Usuario Tap → Context.read() → increaseBy() → emit() → Rebuild
```

### Flujo BLoC
```
Usuario Tap → Context.read() → increaseBy() → add(Event) → _onEvent() → emit() → Rebuild
```

---

## 📊 Comparación Rápida

```
CUBIT               │   BLOC
────────────────────┼──────────────────────
Métodos directos    │   Con eventos
Simple              │   Complejo
Menos boilerplate   │   Más boilerplate
Cubit<State>        │   Bloc<Event, State>
1 sentido de flujo  │   Multi-evento
Inicio: counter=5   │   Inicio: counter=10
_CubitCounterView   │   BlocCounterView
```

---

## 🎓 Conceptos Clave

### Equatable
```dart
// Permite comparar por valores, no por referencia
class CounterState extends Equatable {
  @override
  List<Object> get props => [counter, transactionCount];
}

// state1 == state2 ✅ si values son iguales
```

### copyWith()
```dart
// Crear copia inmutable con cambios
final newState = state.copyWith(
  counter: state.counter + 3,
  // transactionCount se hereda del original
);
```

### context.select()
```dart
// Obtener y observar SOLO una propiedad
context.select((Cubit c) => c.state.counter)
// Se reconstruye solo si counter cambia
```

### context.read()
```dart
// Obtener sin observar
context.read<CounterCubit>().increaseBy(3);
// Para acciones, no para mostrar datos
```

---

## 🔍 Estados en la App

### Estado Inicial Cubit
```
CounterState(
  counter: 5,
  transactionCount: 0
)
```

### Estado Inicial BLoC
```
CounterState(
  counter: 10,
  transactionCount: 0
)
```

### Cambio de Estado Ejemplo (Cubit)
```
Inicial: counter=5, transactionCount=0
Usuario toca +3
Nuevo:   counter=8, transactionCount=1
```

---

## 🐛 Debugging

### Ver cambios de estado (console)
En cubit_counter_screen.dart hay:
```dart
print('Estado cambió');  // Aparece cada rebuild
```

### Inspeccionar BLoC en DevTools
```
Flutter DevTools → Debugger → ver events y states
```

---

## 📱 Estados Visuales de la App

```
HomeScreen (inicial)
├── "Cubits" → CubitCounterScreen
│   ├── Initial: counter=5, transactions=0
│   └── After +3: counter=8, transactions=1
│
└── "BLoC" → BlocCounterScreen
    ├── Initial: counter=10, transactions=0
    └── After +3: counter=13, transactions=1
```

---

## ✅ Checklist de Entendimiento

Para considerar que entiendes el proyecto, deberías poder:

- [ ] Explicar la diferencia entre BLoC y Cubit
- [ ] Navegar entre las 3 pantallas
- [ ] Entender cómo se actualiza el estado
- [ ] Saber cuándo usar context.read vs context.select
- [ ] Explicar qué es un evento en BLoC
- [ ] Entender qué es copyWith() y por qué existe
- [ ] Poder crear un nuevo BLoC desde cero
- [ ] Poder crear un nuevo Cubit desde cero
- [ ] Entender el patrón barrel (screens.dart)
- [ ] Saber qué hace GoRouter

---

## 🔗 Enlaces Directos a Documentación

**🎯 Documentación General Completa**  
→ [DOCUMENTATION.md](DOCUMENTATION.md) - Explicación detallada de TODO

**📦 Gestión de Estado**
- [BLoC Completo](lib/presentation/blocs/counter_bloc/counter_bloc.dart)
- [Eventos BLoC](lib/presentation/blocs/counter_bloc/counter_event.dart)
- [Estado BLoC](lib/presentation/blocs/counter_bloc/counter_state.dart)
- [Cubit](lib/presentation/blocs/counter_cubit/counter_cubit.dart)
- [Estado Cubit](lib/presentation/blocs/counter_cubit/counter_state.dart)

**🖼️ Interfaz de Usuario**
- [Pantalla Principal](lib/presentation/screens/home_screen.dart)
- [contador con BLoC](lib/presentation/screens/bloc_counter_screen.dart)
- [Contador con Cubit](lib/presentation/screens/cubit_counter_screen.dart)

**⚙️ Configuración**
- [Router](lib/config/router/app_router.dart)
- [Tema](lib/config/theme/app_theme.dart)
- [Punto de entrada](lib/main.dart)

---

## 🎬 Cómo Usar Este Proyecto

### 1. Lee primero
→ [DOCUMENTATION.md](DOCUMENTATION.md) - Comprensión general

### 2. Explora el código
→ Abre cada archivo en order alfabético, lee sus docs

### 3. Experimenta
→ Modifica valores, agrega prints, cambia comportamientos

### 4. Compara
→ Abre lado a lado bloc_counter_screen vs cubit_counter_screen

### 5. Practica
→ Escribe tu propio Cubit/BLoC + pantalla

---

**Última actualización**: Marzo 2026  
**Proyecto**: FormsApp - Flutter BLoC & Cubits  
**Versión**: 0.1.0
