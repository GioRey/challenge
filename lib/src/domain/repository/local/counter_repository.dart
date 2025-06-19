import 'package:challenge/src/domain/model/counter_model.dart';

abstract class CounterRepository {
  /// Carga todos los contadores almacenados localmente.
  ///
  /// Devuelve una lista de [CounterModel] con los contadores actuales.
  Future<List<CounterModel>> loadAllCounters();

  /// Agrega nuevos contadores a la lista existente.
  ///
  /// Parámetros:
  /// - [counters]: Lista de contadores a agregar.
  ///
  /// Devuelve la lista actualizada de contadores.
  Future<List<CounterModel>> add({required List<CounterModel> counters});

  /// Guarda una nueva lista de contadores, reemplazando la anterior.
  ///
  /// Parámetros:
  /// - [counters]: Lista completa de contadores a guardar.
  ///
  /// Devuelve la lista actualizada de contadores.
  Future<List<CounterModel>> save({required List<CounterModel> counters});

  /// Incrementa el valor del contador con el ID especificado.
  ///
  /// Parámetros:
  /// - [uid]: ID único del contador a incrementar.
  ///
  /// Devuelve la lista actualizada de contadores.
  Future<List<CounterModel>> increment({required String uid});

  /// Decrementa el valor del contador con el ID especificado.
  ///
  /// Parámetros:
  /// - [uid]: ID único del contador a decrementar.
  ///
  /// Devuelve la lista actualizada de contadores.
  Future<List<CounterModel>> decrement({required String uid});

  /// Elimina el contador con el ID especificado de la lista.
  ///
  /// Parámetros:
  /// - [uid]: ID único del contador a eliminar.
  ///
  /// Devuelve la lista actualizada de contadores.
  Future<List<CounterModel>> remove({required String uid});
}
