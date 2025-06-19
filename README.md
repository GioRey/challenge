
# Flutter Multicounter App (challenge)

Este proyecto está estructurado usando los principios de **Clean Architecture** junto con el manejo de estado utilizando **Riverpod**, **Shared_preferences** para la persistencia de datos y **uuid** para generar cadenas unicas. 

El objetivo es mantener un código desacoplado, escalable y fácilmente testeable. (se omitio prueb unitaria) 

## [Abrir video completo](https://github.com/GioRey/challenge/raw/refs/heads/main/demo_video/demo.mov)
## 🎦 Imagen demo

<img src="demo_video/demo.gif" width="300" height="auto"/>

## 📁 Estructura de Carpetas

```plaintext
lib/
└── src/
    ├── data/
    │   └── repository/
    │       └── local/
    │       │   └── preferences/
    │       │       └── preferences.dart
    │       │
    │       └── counter_repository_imp.dart
    │
    ├── domain/
    │   ├── model/
    │   │    └── counter_model.dart
    │   │
    │   └── repository/
    │       └── local/
    │           └── counter_repository.dart
    │
    │
    ├── features/
    │   └── multicounter/
    │       ├── multicounter_page/
    │       │   └── multicounter_page.dart
    │       │   
    │       ├── provider/
    │       │   └── multicounter_provider.dart
    │       │
    │       ├── repository/
    │       │   └── multicounter_repository.dart
    │       │    
    │       └── widget/
    │           └── card_counter.dart
    │           
    │
    └── main.
``` 
Funciones utilizadas.
```dart
/// Carga todos los contadores almacenados localmente.
Future<List<CounterModel>> loadAllCounters();

/// Agrega nuevos contadores a la lista existente.
Future<List<CounterModel>> add({required List<CounterModel> counters});

/// Guarda una nueva lista de contadores, reemplazando la anterior.
Future<List<CounterModel>> save({required List<CounterModel> counters});

/// Incrementa el valor del contador con el ID especificado.
Future<List<CounterModel>> increment({required String uid});

/// Decrementa el valor del contador con el ID especificado.
Future<List<CounterModel>> decrement({required String uid});

/// Elimina el contador con el ID especificado de la lista.
Future<List<CounterModel>> remove({required String uid});
```

