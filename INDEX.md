# 📍 Mapa de Documentación - FormsApp

## 🧭 Punto de Entrada Recomendado

### 👥 Por Tipo de Usuario

#### 👨‍💻 "Soy principiante en Flutter y BLoC"
1. Lee: [README.md](README.md) - Introducción general (10 min)
2. Lee: [QUICK_REFERENCE.md](QUICK_REFERENCE.md) - Cheat sheet y referencias (15 min)
3. Ejecuta: `flutter run` y juega con la app
4. Estudia: [DOCUMENTATION.md](DOCUMENTATION.md) - Profundizar (30 min)
5. Explora: Código comentado en archivos de `presentation/`

#### 🎯 "Necesito entender rápido Cubit vs BLoC"
1. Ve directamente a: [QUICK_REFERENCE.md](QUICK_REFERENCE.md) → Sección "Comparación Rápida"
2. Compara los dos archivos lado a lado:
   - [cubit_counter_screen.dart](lib/presentation/screens/cubit_counter_screen.dart)
   - [bloc_counter_screen.dart](lib/presentation/screens/bloc_counter_screen.dart)
3. Lee: [DOCUMENTATION.md](DOCUMENTATION.md) → Sección "Análisis Técnico Detallado"

#### 🏃 "Tengo 5 minutos, dame lo esencial"
1. Lee: [README.md](README.md) → Sección "Cubit vs BLoC - Comparación Rápida" (2 min)
2. Lee: [QUICK_REFERENCE.md](QUICK_REFERENCE.md) → Sección "Cheat Sheet" (3 min)

#### 🔍 "Necesito documentación de un archivo específico"
→ Usa la tabla de abajo: "Documentación de Archivos Específicos"

---

## 📚 Documentos Principales (en orden de lectura)

### 1. README.md (Este archivo - Punto de entrada)
**Lectura**: 15 minutos  
**Contenido**:
- ¿Qué es el proyecto?
- Inicio rápido  
- Documentación en 3 niveles
- Flujo visual de la app
- Estructura del proyecto
- Guía de aprendizaje paso a paso
- Comparación Cubit vs BLoC
- Conceptos clave

**Recomendado para**: Todos, especialmente principiantes

### 2. QUICK_REFERENCE.md
**Lectura**: 10 minutos  
**Contenido**:
- Índice rápido de ubicaciones
- Tabla de archivos con documentación
- Cuándo usar Cubit vs BLoC
- Código rápido - patrones comunes
- Flujos de interacción
- Comparación lado a lado
- Conceptos clave resumidos
- Checklist de entendimiento
- Cómo usar el proyecto

**Recomendado para**: Consulta rápida, referencia durante desarrollo

### 3. DOCUMENTATION.md
**Lectura**: 45 minutos  
**Contenido**:
- Documentación completa
- Arquitectura detallada
- Propósito educativo
- Flujos de datos
- Funcionalidades de la aplicación
- Análisis técnico profundo (Estado, Cubit, BLoC)
- Comparativa detallada
- Conceptos clave explicados
- Cómo usar la aplicación
- Descripción de archivos en presentation
- Configuración del proyecto
- Dependencias
- Flujo visual con mermaid
- Lecciones aprendidas
- Próximos pasos de aprendizaje

**Recomendado para**: Comprensión profunda, prepara para código real

---

## 📁 Documentación de Archivos Específicos (Inline en Código)

### 🏠 Entrada Principal
- **lib/main.dart**
  - ¿Dónde buscar?: Desde el editor abre el archivo
  - Contiene: Punto de entrada de la app, MaterialApp.router config

### 🔀 Configuración de Navegación
- **lib/config/router/app_router.dart**
  - ¿Dónde buscar?: Archivo mismo (comentado)
  - Contiene: Rutas de GoRouter, estructura de navegación

### 🎨 Tema Visual
- **lib/config/theme/app_theme.dart**
  - ¿Dónde buscar?: Archivo mismo  
  - Contiene: Material Design 3, colores, estilos

### 📊 Gestión de Estado

#### BLoC (Patrón Completo)

| Archivo | Ubicación | Documentación | Función |
|---------|-----------|---------------|---------|
| **counter_bloc.dart** | [lib/presentation/blocs/counter_bloc/counter_bloc.dart](lib/presentation/blocs/counter_bloc/counter_bloc.dart) | ✅ Inline completa | Lógica principal: procesa eventos, emite estados |
| **counter_event.dart** | [lib/presentation/blocs/counter_bloc/counter_event.dart](lib/presentation/blocs/counter_bloc/counter_event.dart) | ✅ Inline completa | Define `CounterIncreased` y `CounterReset` |
| **counter_state.dart** | [lib/presentation/blocs/counter_bloc/counter_state.dart](lib/presentation/blocs/counter_bloc/counter_state.dart) | ✅ Inline completa | Estado: counter=10, transactionCount |

**¿Qué leer primero?**: counter_state.dart → counter_event.dart → counter_bloc.dart

#### Cubit (Patrón Simple)

| Archivo | Ubicación | Documentación | Función |
|---------|-----------|---------------|---------|
| **counter_cubit.dart** | [lib/presentation/blocs/counter_cubit/counter_cubit.dart](lib/presentation/blocs/counter_cubit/counter_cubit.dart) | ✅ Inline completa | Implementación: métodos directos, emit() |
| **counter_state.dart** | [lib/presentation/blocs/counter_cubit/counter_state.dart](lib/presentation/blocs/counter_cubit/counter_state.dart) | ✅ Inline completa | Estado: counter=0, transactionCount |

**¿Qué leer primero?**: counter_state.dart → counter_cubit.dart

### 🖼️ Pantallas (UI)

| Archivo | Ubicación | Documentación | Función |
|---------|-----------|---------------|---------|
| **home_screen.dart** | [lib/presentation/screens/home_screen.dart](lib/presentation/screens/home_screen.dart) | ✅ Inline completa | Pantalla principal con menú |
| **cubit_counter_screen.dart** | [lib/presentation/screens/cubit_counter_screen.dart](lib/presentation/screens/cubit_counter_screen.dart) | ✅ Inline completa | Demo Cubit con contexto |
| **bloc_counter_screen.dart** | [lib/presentation/screens/bloc_counter_screen.dart](lib/presentation/screens/bloc_counter_screen.dart) | ✅ Inline completa | Demo BLoC con contexto |
| **screens.dart** | [lib/presentation/screens/screens.dart](lib/presentation/screens/screens.dart) | ✅ Inline completa | Barrel file (índice de exports) |

**¿Qué leer primero?**: home_screen.dart → cubit_counter_screen.dart → bloc_counter_screen.dart

---

## 🎯 Búsqueda por Concepto

### ¿Dónde aprender sobre...?

#### **Diferencia entre BLoC y Cubit**
- README.md → Sección "Cubit vs BLoC"
- QUICK_REFERENCE.md → Sección "Cheat Sheet"
- DOCUMENTATION.md → Sección "Comparativa: Cubit vs BLoC"

#### **Cómo funciona el estado**
- DOCUMENTATION.md → Sección "Análisis Técnico Detallado → Estado"
- [lib/presentation/blocs/counter_bloc/counter_state.dart](lib/presentation/blocs/counter_bloc/counter_state.dart) (comentado)
- [lib/presentation/blocs/counter_cubit/counter_state.dart](lib/presentation/blocs/counter_cubit/counter_state.dart) (comentado)

#### **Qué son los eventos**
- [lib/presentation/blocs/counter_bloc/counter_event.dart](lib/presentation/blocs/counter_bloc/counter_event.dart) (comentado)
- DOCUMENTATION.md → Sección "BLoC Explicado → Componentes → Eventos"

#### **Cómo usar context.read/watch/select**
- DOCUMENTATION.md → Sección "Conceptos Clave Explicados"
- QUICK_REFERENCE.md → Sección "Código Rápido"
- [lib/presentation/screens/bloc_counter_screen.dart](lib/presentation/screens/bloc_counter_screen.dart) (línea comentada explica cada uno)

#### **Cómo crear un Cubit**
- [lib/presentation/blocs/counter_cubit/counter_cubit.dart](lib/presentation/blocs/counter_cubit/counter_cubit.dart) (comentado)
- DOCUMENTATION.md → Sección "Análisis Técnico → Cubit Explicado"

#### **Cómo crear un BLoC**
- [lib/presentation/blocs/counter_bloc/counter_bloc.dart](lib/presentation/blocs/counter_bloc/counter_bloc.dart) (comentado)
- DOCUMENTATION.md → Sección "Análisis Técnico → BLoC Explicado"

#### **Navegación con GoRouter**
- [lib/config/router/app_router.dart](lib/config/router/app_router.dart)
- [lib/presentation/screens/home_screen.dart](lib/presentation/screens/home_screen.dart) (comentado)

#### **Patrón immutabilidad y copyWith**
- DOCUMENTATION.md → Sección "Estado"
- [lib/presentation/blocs/counter_cubit/counter_state.dart](lib/presentation/blocs/counter_cubit/counter_state.dart) (comentado)

#### **Equatable y comparación de objetos**
- DOCUMENTATION.md → Sección "Conceptos Clave Explicados → Equatable"
- README.md → Sección "Conceptos Clave Explicados"

---

## 🎓 Rutas de Aprendizaje Personalizadas

### Ruta 1: "Principiante Absoluto"
```
1. Ejecuta: flutter run (5 min)
2. Lee: README.md (15 min)
3. Lee: QUICK_REFERENCE.md (10 min)
4. Abre código de home_screen.dart, lee comentarios (5 min)
5. Abre código de counter_cubit.dart, lee comentarios (10 min)
6. Abre código de cubit_counter_screen.dart, lee comentarios (10 min)
7. Abre código de counter_bloc.dart, lee comentarios (10 min)
8. Lee: DOCUMENTATION.md (30 min)
Total: ~95 minutos
```

### Ruta 2: "Conozco Flutter, necesito aprender state management"
```
1. Lee: README.md → Skip "Inicio Rápido" (10 min)
2. Lee: QUICK_REFERENCE.md (10 min)
3. Abre código en este orden:
   - counter_cubit.dart (5 min)
   - counter_bloc.dart (8 min)
   - cubit_counter_screen.dart (5 min)
   - bloc_counter_screen.dart (5 min)
4. Lee: DOCUMENTATION.md → Sección "Comparativa" (10 min)
Total: ~53 minutos
```

### Ruta 3: "Tengo experiencia, dame lo esencial"
```
1. QUICK_REFERENCE.md → Sección "Cubit vs BLoC" (2 min)
2. Abre lado a lado counter_cubit.dart y counter_bloc.dart (10 min)
3. Abre lado a lado cubit_counter_screen.dart y bloc_counter_screen.dart (10 min)
4. Consulta DOCUMENTATION.md si necesitas refresco
Total: ~22 minutos
```

---

## 🔍 Mapa Visual del Proyecto

```
📱 FormsApp
│
├─ 📄 README.md ᐱ Inicio aquí - Introducción
├─ 📋 QUICK_REFERENCE.md ᐱ Referencia rápida
├─ 📖 DOCUMENTATION.md ᐱ Profundización
├─ 🗺️ INDEX.md (este archivo) ᐱ Navegación
│
├─ 📁 lib/
│   │
│   ├─ 🎬 main.dart
│   │
│   ├─ 📁 config/
│   │   ├─ router/ (GoRouter - navegación)
│   │   └─ theme/ (Material Design - estilos)
│   │
│   └─ 📁 presentation/
│       │
│       ├─ 📁 blocs/
│       │   ├─ 📁 counter_bloc/     (🔵 Patrón BLoC Completo)
│       │   │   ├─ counter_bloc.dart ✅ Doc inline
│       │   │   ├─ counter_event.dart ✅ Doc inline
│       │   │   └─ counter_state.dart ✅ Doc inline
│       │   │
│       │   └─ 📁 counter_cubit/    (💠 Patrón Cubit Simple)
│       │       ├─ counter_cubit.dart ✅ Doc inline
│       │       └─ counter_state.dart ✅ Doc inline
│       │
│       └─ 📁 screens/              (🖼️ UI)
│           ├─ home_screen.dart ✅ Doc inline
│           ├─ bloc_counter_screen.dart ✅ Doc inline
│           ├─ cubit_counter_screen.dart ✅ Doc inline
│           └─ screens.dart ✅ Doc inline
│
└─ 📄 pubspec.yaml (Dependencias)
```

---

## ✅ Checklist de Documentación

- [x] README.md - Entrada principal
- [x] QUICK_REFERENCE.md - Referencia rápida
- [x] DOCUMENTATION.md - Documentación completa
- [x] INDEX.md - Mapa de navegación (este archivo)
- [x] counter_bloc.dart - Con documentación inline
- [x] counter_event.dart - Con documentación inline
- [x] counter_state.dart (bloc) - Con documentación inline
- [x] counter_cubit.dart - Con documentación inline
- [x] counter_state.dart (cubit) - Con documentación inline
- [x] home_screen.dart - Con documentación inline
- [x] bloc_counter_screen.dart - Con documentación inline
- [x] cubit_counter_screen.dart - Con documentación inline
- [x] screens.dart - Con documentación inline

---

## 🎯 Búsqueda Rápida por Tema

### Estado Management
- [DOCUMENTATION.md](DOCUMENTATION.md#análisis-técnico-detallado)
- [QUICK_REFERENCE.md](QUICK_REFERENCE.md#cheat-sheet-cubit-vs-bloc)

### Navegación (GoRouter)
- [README.md](README.md#estructura-del-proyecto)
- [lib/config/router/app_router.dart](lib/config/router/app_router.dart)

### Testing
- [DOCUMENTATION.md](DOCUMENTATION.md#conceptos-clave-explicados)

### Arquitectura
- [DOCUMENTATION.md](DOCUMENTATION.md#arquitectura-general-del-proyecto)
- [README.md](README.md#estructura-del-proyecto)

### Aprendizaje Paso a Paso
- [README.md](README.md#guía-de-aprendizaje)

---

## 💬 Preguntas Frecuentes - Dónde Buscar

| Pregunta | Dónde Buscar |
|----------|--------------|
| ¿Por dónde empiezo? | README.md → "Punto de Entrada Recomendado" |
| ¿Cuál es mejor Cubit o BLoC? | README.md → Tabla de comparación |
| ¿Cómo se usa context.select()? | QUICK_REFERENCE.md → "Código Rápido" |
| ¿Qué es Equatable? | README.md → "Conceptos Clave" |
| ¿Quiero entender BLoC profundamente? | DOCUMENTATION.md → "BLoC Explicado" |
| ¿Necesito un código de ejemplo? | QUICK_REFERENCE.md → "Código Rápido" |
| ¿Dónde está la documentación de X archivo? | INDEX.md → "Documentación de Archivos Específicos" |

---

## 🎓 Certificación Implícita: Checklist Final

Cuando hayas completado la documentación, deberías poder:

- [ ] Ejecutar la app y navegar entre pantallas
- [ ] Explicar la diferencia entre BLoC y Cubit en 3 frases
- [ ] Señalar en código dónde se emite un nuevo estado
- [ ] Entender por qué `copyWith()` es importante
- [ ] Usar `context.read()`, `context.select()` y `BlocBuilder<>` correctamente
- [ ] Crear un Cubit nuevo desde cero
- [ ] Crear un BLoC nuevo desde cero (con eventos)
- [ ] Explicar qué es Equatable y por qué existe
- [ ] Saber cuándo usar Cubit vs BLoC
- [ ] Entender la arquitectura general del proyecto

---

## 📞 Resumen de Contacto de Información

| Necesito... | Voy a... |
|-------------|----------|
| Inicio rápido | [README.md](README.md) |
| Referencia | [QUICK_REFERENCE.md](QUICK_REFERENCE.md) |
| Profundidad | [DOCUMENTATION.md](DOCUMENTATION.md) |
| Navegar docs | [INDEX.md](INDEX.md) (aquí) |
| Ver código de Cubit | [counter_cubit.dart](lib/presentation/blocs/counter_cubit/counter_cubit.dart) |
| Ver código de BLoC | [counter_bloc.dart](lib/presentation/blocs/counter_bloc/counter_bloc.dart) |
| Ver pantalla Cubit | [cubit_counter_screen.dart](lib/presentation/screens/cubit_counter_screen.dart) |
| Ver pantalla BLoC | [bloc_counter_screen.dart](lib/presentation/screens/bloc_counter_screen.dart) |

---

**Última actualización**: Marzo 2026  
**Proyecto**: FormsApp - Flutter BLoC & Cubits  
**Versión**: 0.1.0

✨ **Happy Learning!** ✨
