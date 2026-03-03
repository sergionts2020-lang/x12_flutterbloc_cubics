# 📱 FormsApp - Aprendiendo BLoC y Cubits en Flutter

> Una aplicación educativa completa que demuestra los patrones **BLoC** y **Cubit** para gestión de estado en Flutter.

---

## 🎯 ¿Qué es Este Proyecto?

**FormsApp** es un proyecto de enseñanza que muestra dos formas de gestionar estado en Flutter:

1. **Cubit** - Gestión de estado simple y directa (recomendado para aprender primero)
2. **BLoC** - Gestión de estado avanzada con eventos (para aplicaciones complejas)

Implementa un simple **contador** bajo ambos patrones para que puedas **comparar** y **entender** las diferencias.

---

## 🚀 Inicio Rápido

### Requisitos
- Flutter SDK >= 2.19.2
- Visual Studio Code o Android Studio (opcional)

### Instalación y Ejecución

```bash
# 1. Obtener dependencias
flutter pub get

# 2. Ejecutar la aplicación
flutter run
```

### Verás
1. **HomeScreen**: Menú principal con 2 opciones
2. **CubitCounterScreen**: Demostración del patrón Cubit
3. **BlocCounterScreen**: Demostración del patrón BLoC

---

## 📚 Documentación

Este proyecto tiene **3 niveles de documentación**:

### 1️⃣ **Para Comenzar Rápido** 
📄 [**QUICK_REFERENCE.md**](QUICK_REFERENCE.md) ← **EMPIEZA AQUÍ**
- Índice de ubicaciones
- Cheat sheet de patrones
- Código común
- Comparaciones rápidas
- Checklist de entendimiento

### 2️⃣ **Documentación Completa**
📖 [**DOCUMENTATION.md**](DOCUMENTATION.md) 
- Arquitectura general
- Conceptos detallados
- Comparativa BLoC vs Cubit
- Flujos de datos
- Lecciones aprendidas

### 3️⃣ **Documentación en Código**
✅ Cada archivo de `lib/presentation/` contiene comentarios detallados:

**Gestión de Estado (BLoC)**
- [lib/presentation/blocs/counter_bloc/counter_bloc.dart](lib/presentation/blocs/counter_bloc/counter_bloc.dart)
- [lib/presentation/blocs/counter_bloc/counter_event.dart](lib/presentation/blocs/counter_bloc/counter_event.dart)
- [lib/presentation/blocs/counter_bloc/counter_state.dart](lib/presentation/blocs/counter_bloc/counter_state.dart)

**Gestión de Estado (Cubit)**
- [lib/presentation/blocs/counter_cubit/counter_cubit.dart](lib/presentation/blocs/counter_cubit/counter_cubit.dart)
- [lib/presentation/blocs/counter_cubit/counter_state.dart](lib/presentation/blocs/counter_cubit/counter_state.dart)

**Pantallas (UI)**
- [lib/presentation/screens/home_screen.dart](lib/presentation/screens/home_screen.dart)
- [lib/presentation/screens/bloc_counter_screen.dart](lib/presentation/screens/bloc_counter_screen.dart)
- [lib/presentation/screens/cubit_counter_screen.dart](lib/presentation/screens/cubit_counter_screen.dart)
- [lib/presentation/screens/screens.dart](lib/presentation/screens/screens.dart)

---

## 🎮 Cómo Funciona la App

### Flujo Visual

```
🏠 HomeScreen
├─ "Cubits" ──────────────────→ 💠 CubitCounterScreen
│                                ├─ contador = 5
│                                ├─ [+3] [+2] [+1]
│                                └─ [🔄] Reset
│
└─ "BLoC" ───────────────────→ 🔵 BlocCounterScreen
                                ├─ contador = 10
                                ├─ [+3] [+2] [+1]
                                └─ [🔄] Reset
```

### Interacción en BLoC

```
Usuario presiona "+3"
    ↓
context.read<CounterBloc>().increaseBy(3)
    ↓
Agrega evento: CounterIncreased(3)
    ↓
BLoC procesa: _onCounterIncreased()
    ↓
Emite estado nuevo: counter += 3
    ↓
❇️ UI se actualiza
```

### Interacción en Cubit

```
Usuario presiona "+3"
    ↓
context.read<CounterCubit>().increaseBy(3)
    ↓
Emite estado nuevo: counter += 3
    ↓
❇️ UI se actualiza
```

---

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                               🎬 Punto de entrada
│
├── config/
│   ├── router/app_router.dart             🔀 Rutas (GoRouter)
│   └── theme/app_theme.dart               🎨 Tema Material
│
└── presentation/
    ├── blocs/                             📊 Gestión de estado
    │   ├── counter_bloc/                  (Patrón BLoC)
    │   │   ├── counter_bloc.dart
    │   │   ├── counter_event.dart
    │   │   └── counter_state.dart
    │   │
    │   └── counter_cubit/                 (Patrón Cubit)
    │       ├── counter_cubit.dart
    │       └── counter_state.dart
    │
    └── screens/                            🖼️ Interfaz de usuario
        ├── home_screen.dart
        ├── bloc_counter_screen.dart
        ├── cubit_counter_screen.dart
        └── screens.dart (barrel)
```

---

## 🧭 Guía de Aprendizaje

### Paso 1: Entiende HomeScreen ⏱️ 5 min
```dart
// lib/presentation/screens/home_screen.dart
// - Pantalla simple sin estado
// - Dos opciones navegables
// - Usa GoRouter para cambiar pantalla
```
👉 [Ver código comentado](lib/presentation/screens/home_screen.dart)

### Paso 2: Aprende Cubit ⏱️ 15 min
```dart
// lib/presentation/blocs/counter_cubit/counter_cubit.dart
// - Métodos DIRECTOS: increaseBy(), reset()
// - SIN eventos intermedios
// - Usa emit() para cambiar estado
// - Estructura simple
```
👉 [Ver código comentado](lib/presentation/blocs/counter_cubit/counter_cubit.dart)

### Paso 3: Explora CubitCounterScreen ⏱️ 15 min
```dart
// lib/presentation/screens/cubit_counter_screen.dart
// - Cómo usar Cubit en UI
// - context.read() para leer
// - context.select() para optimizar
// - BlocBuilder para reconstruir
```
👉 [Ver código comentado](lib/presentation/screens/cubit_counter_screen.dart)

### Paso 4: Aprende BLoC ⏱️ 20 min
```dart
// lib/presentation/blocs/counter_bloc/counter_bloc.dart
// - Patrón CON eventos
// - Separación: Event → Handler → State
// - Más boilerplate pero más control
// - Ideal para lógica compleja
```
👉 [Ver código comentado](lib/presentation/blocs/counter_bloc/counter_bloc.dart)

### Paso 5: Explora BlocCounterScreen ⏱️ 15 min
```dart
// lib/presentation/screens/bloc_counter_screen.dart
// - Cómo usar BLoC en UI (similar a Cubit)
// - Diferencias sutiles en acceso
// - Técnicas de optimización
```
👉 [Ver código comentado](lib/presentation/screens/bloc_counter_screen.dart)

### Paso 6: Lee la Documentación Completa ⏱️ 30 min
👉 [DOCUMENTATION.md](DOCUMENTATION.md) - Análisis profundo de todo

---

## 📊 Cubit vs BLoC - Comparación Rápida

| Aspecto | Cubit | BLoC |
|---------|-------|------|
| **Complejidad** | Baja | Media-Alta |
| **Boilerplate** | 🟢 Bajo | 🔴 Alto |
| **Escalabilidad** | Media | 🟢 Muy Alta |
| **Tiempo de aprendizaje** | 🟢 Rápido | Lento |
| **Casos simples** | 🟢 Ideal | Excesivo |
| **Casos complejos** | Limitado | 🟢 Ideal |
| **Testing** | Bueno | 🟢 Excelente |
| **Métodos directos** | 🟢 Sí | No (eventos) |
| **Requiere eventos** | No | 🟢 Sí |

---

## 💡 Conceptos Clave Explicados

### 🧩 Equatable
Permite comparar objetos por valores, no por referencia. Necesario para que Flutter sepa cuándo un state cambió.

```dart
class CounterState extends Equatable {
  final int counter;
  @override
  List<Object> get props => [counter];
}
```

### 📦 copyWith()
Crea una copia **inmutable** del estado con cambios específicos.

```dart
final newState = state.copyWith(counter: state.counter + 3);
// El resto de propiedades se mantienen igual
```

### 🎯 context.read()
Obtiene la instancia **sin escuchar** cambios. Para acciones.

```dart
context.read<CounterCubit>().increaseBy(3);  // Botón presionado
```

### 👀 context.select()
Obtiene una **propiedad específica** y **observa solo esa**.

```dart
context.select((CounterCubit c) => c.state.counter)
// Se reconstruye solo si counter cambia
```

### 🔄 BlocBuilder
Widget que se **reconstruye cuando el estado cambia**.

```dart
BlocBuilder<CounterCubit, CounterState>(
  builder: (context, state) => Text('${state.counter}')
)
```

---

## 🎓 Flujo de Datos Visual

### Cubit
```
┌─────────────────┐
│   User Tap      │
└────────┬────────┘
         │
    context.read()
         │
         ↓
┌─────────────────────────┐
│  CounterCubit.method()  │
└─────────┬───────────────┘
          │
      emit(state)
          │
          ↓
┌──────────────────────────┐
│  Widget reconstruced     │
│  counter = 8             │
└──────────────────────────┘
```

### BLoC
```
┌─────────────────┐
│   User Tap      │
└────────┬────────┘
         │
    context.read()
         │
         ↓
┌──────────────────────────┐
│  CounterBloc.add(Event)  │
└─────────┬────────────────┘
          │
    on<CounterIncreased>
          │
          ↓
┌──────────────────────────┐
│  _onCounterIncreased()   │
└─────────┬────────────────┘
          │
      emit(state)
          │
          ↓
┌──────────────────────────┐
│  Widget reconstruced     │
│  counter = 13            │
└──────────────────────────┘
```

---

## 🔗 Referencias Útiles

### Dentro del Proyecto
- 📄 [QUICK_REFERENCE.md](QUICK_REFERENCE.md) - Referencia rápida y cheat sheet
- 📖 [DOCUMENTATION.md](DOCUMENTATION.md) - Documentación completa
- 🧩 Documentación inline en cada archivo de `presentation/`

### Recursos Externos
- [flutter_bloc Package](https://pub.dev/packages/flutter_bloc)
- [BLoC Library Docs](https://bloclibrary.dev/)
- [GoRouter Package](https://pub.dev/packages/go_router)

---

## ✅ Checklist de Entendimiento

Después de estudiar este proyecto, deberías poder:

- [ ] Explicar la diferencia entre BLoC y Cubit
- [ ] Navegar entre las 3 pantallas
- [ ] Entender cómo se actualizan los estados
- [ ] Saber cuándo usar `context.read()` vs `context.select()`
- [ ] Explicar qué es un evento en BLoC y por qué existe
- [ ] Entender inmutabilidad y el método `copyWith()`
- [ ] Crear un nuevo Cubit desde cero
- [ ] Crear un nuevo BLoC desde cero
- [ ] Entender qué hace un "barrel file" (screens.dart)
- [ ] Saber cómo GoRouter maneja la navegación

---

## 🚀 Próximos Pasos

### Para Consolidar Aprendizaje
1. Modifica valores iniciales del contador
2. Agrega un nuevo estado (ej: "lastUpdated")
3. Implementa un método "multiplicar" en Cubit y BLoC
4. Escribe pruebas unitarias para el Cubit

### Para Aplicar a Casos Reales
1. Estudia cómo agregar `BlocListener` para efectos
2. Implementa formularios con múltiples BLoCs
3. Aprende sobre `MultiBlocProvider`
4. Estudia patrones avanzados: Repository Pattern, Provider pattern

---

## 📝 Notas del Proyecto

- **Versión**: 0.1.0
- **Flutter SDK**: >=2.19.2 <3.0.0
- **Dependencias principales**: flutter_bloc: 8.1.2, go_router: 6.2.0, equatable: 2.0.5
- **Propósito**: Material educativo para aprender state management en Flutter
- **Dificultad**: Intermedia (requiere conceptos básicos de Flutter)

---

## 📧 Preguntas Frecuentes

### ¿Cuál debería usar: Cubit o BLoC?
**Usa Cubit si**: tu lógica es simple (formularios, booleans, contadores)  
**Usa BLoC si**: tu lógica es compleja (auth flows, múltiples eventos interdependientes)

### ¿Por qué hay dos archivos counter_state.dart?
Porque cada patrón (BLoC y Cubit) tiene su propio estado. Pueden ser diferentes o iguales.

### ¿Qué es Equatable?
Widget que permite comparar objetos por sus valores (properties) en lugar de por referencia.

### ¿Por qué usar copyWith()?
Para mantener **inmutabilidad**. En lugar de modificar el estado, creas uno nuevo.

### ¿Cuál es la diferencia entre context.read y context.select?
- `read()`: obtiene sin escuchar (para acciones)
- `select()`: obtiene y escucha una propiedad específica (para mostrar datos)

---

## 🎉 Conclusión

Este proyecto es tu **puerta de entrada** a la gestión de estado profesional en Flutter.

**Próximo paso**: 👉 Abre [QUICK_REFERENCE.md](QUICK_REFERENCE.md) para empezar

¡Happy coding! 🚀
