# 🚀 Guía de Inicio Rápido - FormsApp

> El camino más corto para entender Flutter BLoC y Cubits

---

## ⏱️ 5 Minutos: Lo Esencial

### Paso 1: Ejecuta la App (1 min)
```bash
cd tu_proyecto
flutter pub get
flutter run
```

Verás 3 pantallas:
- 🏠 **HomeScreen**: Menú con 2 opciones
- 💠 **CubitCounterScreen**: Contador con Cubit
- 🔵 **BlocCounterScreen**: Contador con BLoC

### Paso 2: Entiende la Diferencia (4 min)

#### Cubit - Método Directo
```dart
// Lo llamas directamente
context.read<CounterCubit>().increaseBy(3);
```

#### BLoC - Con Evento
```dart
// Primero creas un evento
context.read<CounterBloc>().increaseBy(3);
// Internamente agrega: add(CounterIncreased(3))
```

**Resumen**: Cubit es más simple, BLoC es más control.

---

## 📚 30 Minutos: Aprendizaje Completo

### 1️⃣ Lectura: README.md (10 min)
👉 [Abre README.md](README.md)

**Secciones clave**:
- ¿Qué es?
- Inicio Rápido
- Estructura del Proyecto
- Cubit vs BLoC

### 2️⃣ Lectura: QUICK_REFERENCE.md (10 min)
👉 [Abre QUICK_REFERENCE.md](QUICK_REFERENCE.md)

**Secciones clave**:
- Cheat Sheet
- Código Rápido
- Flujos de Interacción
- Checklist

### 3️⃣ Código: Explora los Archivos (10 min)

**Opción A: Empieza por lo simple (Cubit)**
1. Abre: [counter_cubit.dart](lib/presentation/blocs/counter_cubit/counter_cubit.dart)
   - Lee comentarios
   - Entiende `increaseBy()` y `reset()`
   - Nota: usa `emit()`

2. Abre: [cubit_counter_screen.dart](lib/presentation/screens/cubit_counter_screen.dart)
   - Cómo se usa en UI
   - Cómo se llama desde botones
   - Métodos read/select

**Opción B: Luego ve a BLoC (más complejo)**
1. Abre: [counter_bloc.dart](lib/presentation/blocs/counter_bloc/counter_bloc.dart)
   - Lee eventos primero
   - Entiende manejadores
   - Compara con Cubit

2. Abre: [bloc_counter_screen.dart](lib/presentation/screens/bloc_counter_screen.dart)
   - Nota similitudes con Cubit
   - Diferencias sutiles

---

## 🎯 Códigos Quick-Copy para Usar

### Proveer un Cubit
```dart
BlocProvider(
  create: (_) => CounterCubit(),
  child: const MyWidget()
)
```

### Usar Cubit - Leer Valor
```dart
final counter = context.read<CounterCubit>().state.counter;
```

### Usar Cubit - Ejecutar Acción
```dart
context.read<CounterCubit>().increaseBy(3);
```

### Usar Cubit - Observar Cambios (optimizado)
```dart
context.select((CounterCubit c) => c.state.counter)
```

### Usar Cubit - Reconstruir Widget
```dart
BlocBuilder<CounterCubit, CounterState>(
  builder: (context, state) {
    return Text('${state.counter}');
  }
)
```

---

## 📊 Diagrama Rápido

### Flujo Cubit (Simple)
```
Usuario presiona botón
        ↓
  context.read()
        ↓
Cubit.increaseBy(3)
        ↓
  emit(newState)
        ↓
Widget rebuild ✨
```

### Flujo BLoC (Complejo)
```
Usuario presiona botón
        ↓
  context.read()
        ↓
Bloc.increaseBy(3) → add(Event)
        ↓
_onCounterIncreased()
        ↓
  emit(newState)
        ↓
Widget rebuild ✨
```

---

## 🧭 Navegación de Documentos

```
EMPIEZA AQUÍ
    ↓
📄 README.md (Introducción)
    ↓
    ├─→ 📋 QUICK_REFERENCE.md
    │   (Referencia rápida)
    │
    ├─→ 📁 lib/presentation/ (Código)
    │   ├─ blocs/counter_cubit/
    │   ├─ blocs/counter_bloc/
    │   └─ screens/
    │
    └─→ 📖 DOCUMENTATION.md
        (Profundización)
```

---

## ✅ Checklist: ¿Entiendes lo Básico?

Responde sí/no:

1. ¿Puedes ejecutar la app y ver 3 pantallas? **_______**
2. ¿Sabes la diferencia entre Cubit y BLoC? **_______**
3. ¿Entiendes qué es `emit()`? **_______**
4. ¿Sabes cuándo usar `context.read()` vs `context.select()`? **_______**
5. ¿Entiendes qué hace `copyWith()`? **_______**

Si contestaste que **SÍ a todas** → ¡Felicidades! ¡Entiendes lo básico!

Si contestaste que **NO a alguna** → Revisa esa sección en los documentos.

---

## 🔍 Comparación Lado a Lado

### Archivo Cubit
[counter_cubit.dart](lib/presentation/blocs/counter_cubit/counter_cubit.dart)

```dart
class CounterCubit extends Cubit<CounterState> {
  void increaseBy(int value) {
    emit(state.copyWith(
      counter: state.counter + value
    ));
  }
}
```

### Archivo BLoC
[counter_bloc.dart](lib/presentation/blocs/counter_bloc/counter_bloc.dart)

```dart
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreased>(_onCounterIncreased);
  }
  
  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value
    ));
  }
}
```

**Diferencias clave**:
- Cubit: Método directo
- BLoC: Evento + Manejador

---

## 🎬 Pasos para Profundizar

### Paso 1: Entiende el Estado
```dart
// Ambos usan esto
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;
  
  CounterState copyWith({...}) { ... }
}
```
👉 Lee: [counter_state.dart](lib/presentation/blocs/counter_cubit/counter_state.dart)

### Paso 2: Aprende Cubit
```dart
class CounterCubit extends Cubit<CounterState> {
  void increaseBy(int value) { ... }
  void reset() { ... }
}
```
👉 Lee: [counter_cubit.dart](lib/presentation/blocs/counter_cubit/counter_cubit.dart)

### Paso 3: Aprende BLoC - Eventos
```dart
abstract class CounterEvent { }
class CounterIncreased extends CounterEvent {
  final int value;
}
```
👉 Lee: [counter_event.dart](lib/presentation/blocs/counter_bloc/counter_event.dart)

### Paso 4: Aprende BLoC - Manejadores
```dart
on<CounterIncreased>(_onCounterIncreased);
void _onCounterIncreased(...) { ... }
```
👉 Lee: [counter_bloc.dart](lib/presentation/blocs/counter_bloc/counter_bloc.dart)

### Paso 5: Usa en UI
```dart
context.read<CounterCubit>().increaseBy(3);
context.select((CounterCubit c) => c.state.counter);
```
👉 Lee: [cubit_counter_screen.dart](lib/presentation/screens/cubit_counter_screen.dart)

---

## 🎓 Vocabulario Clave

| Término | Qué Es | Ejemplo |
|---------|--------|---------|
| **State** | El dato actual | `counter = 8` |
| **Event** | Una acción que pasó | `CounterIncreased(3)` |
| **emit()** | Enviar nuevo estado | `emit(newState)` |
| **copyWith()** | Crear copia con cambios | `state.copyWith(counter: 11)` |
| **context.read()** | Obtener sin escuchar | `context.read<Cubit>()` |
| **context.select()** | Obtener una propiedad | `context.select(c => c.state.x)` |
| **BlocBuilder** | Widget que se reconstruye | Ver ejemplo arriba |

---

## 🚀 Próximos Desafíos

### Desafío 1: Modificar el Contador
**Dificultad**: ✅ Fácil

Cambia el valor inicial:
- Cubit: Ve a `counter_cubit.dart`, línea constructor
- BLoC: Ve a `counter_bloc.dart`, línea constructor

### Desafío 2: Agregar un Método
**Dificultad**: ⭐ Fácil

Agrega `doubleCounter()` a CounterCubit que multiplica por 2

### Desafío 3: Crear Nuevo Cubit
**Dificultad**: ⭐⭐ Medio

Crea `FavoritesCubit` que gestione una lista de favoritos

### Desafío 4: Crear Nuevo BLoC
**Dificultad**: ⭐⭐⭐ Difícil

Crea `ToggleBLoC` con eventos `Toggle` y `Reset`

---

## 🎯 Recursos Externos

### Documentación Oficial
- [Flutter BLoC Library](https://bloclibrary.dev/)
- [GoRouter](https://pub.dev/packages/go_router)
- [Equatable](https://pub.dev/packages/equatable)

### Conceptos
- Manejo de estado en Flutter
- Patrones arquitectónicos
- Inmutabilidad en Dart

---

## 📞 Obtén Ayuda

### "No entiendo Cubit"
👉 Lee: [QUICK_REFERENCE.md](QUICK_REFERENCE.md#cheat-sheet-cubit-vs-bloc)

### "No entiendo BLoC"
👉 Lee: [DOCUMENTATION.md](DOCUMENTATION.md#análisis-técnico-detallado)

### "No sé dónde buscar"
👉 Lee: [INDEX.md](INDEX.md)

### "Quiero ver todo"
👉 Lee: [DOCUMENTATION.md](DOCUMENTATION.md)

---

## ⏰ Cronograma Sugerido

### Día 1 (45 min)
- [ ] Ejecuta app (5 min)
- [ ] Lee README.md (15 min)
- [ ] Lee QUICK_REFERENCE.md (10 min)
- [ ] Juega con la app (15 min)

### Día 2 (60 min)
- [ ] Lee code comentado:
  - [ ] counter_cubit.dart (10 min)
  - [ ] cubit_counter_screen.dart (10 min)
  - [ ] counter_bloc.dart (15 min)
  - [ ] bloc_counter_screen.dart (15 min)
  - [ ] home_screen.dart (10 min)

### Día 3 (45 min)
- [ ] Lee DOCUMENTATION.md (30 min)
- [ ] Resuelve desafíos (15 min)

**Total**: 2.5 horas para dominar lo básico

---

## 🎉 ¡Listo para Comenzar!

### Opción 1: Si tienes 5 minutos
```
→ Ejecuta la app
→ Juega con los botones
→ Lee QUICK_REFERENCE.md
```

### Opción 2: Si tienes 30 minutos
```
→ Lee README.md
→ Lee QUICK_REFERENCE.md
→ Abre código comentado
```

### Opción 3: Si tienes 2 horas
```
→ Lee todo
→ Estudia código
→ Intenta desafíos
```

---

## 📋 Checklist Final

- [ ] He ejecutado la app sin errores
- [ ] Entiendo qué es un Estado
- [ ] Entiendo qué es un Evento (BLoC)
- [ ] Entiendo la diferencia Cubit vs BLoC
- [ ] Puedo leer código comentado
- [ ] He leído la documentación
- [ ] He completado al menos 1 desafío
- [ ] Puedo explicar en mis palabras

---

**¡Bienvenido al mundo de State Management en Flutter!** 🚀

Próximo paso: 👉 Abre [README.md](README.md) o ejecuta `flutter run`

---

**Última actualización**: Marzo 2026  
**Tiempo de lectura estimado**: 30-120 minutos según tu ritmo
