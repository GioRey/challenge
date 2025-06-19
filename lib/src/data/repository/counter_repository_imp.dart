import 'dart:convert';

import 'package:challenge/src/data/repository/local/preferences/preferences.dart';
import 'package:challenge/src/domain/model/counter_model.dart';
import 'package:challenge/src/domain/repository/local/counter_repository.dart';
import 'package:uuid/uuid.dart';

class CounterRespositoryImp implements CounterRepository {
  static const _key = 'counters';

  @override
  Future<List<CounterModel>> loadAllCounters() async {
    final jsonStr = Preferences.preferences.getString(_key);
    if (jsonStr == null) return [];
    final List list = jsonDecode(jsonStr);
    var l = list.map((c) {
      var d = jsonEncode(c);
      return CounterModel.fromJson(json.decode(d));
    }).toList();
    return l;
  }

  @override
  Future<List<CounterModel>> add({required List<CounterModel> counters}) async {
    final uuid = Uuid();
    counters.add(CounterModel(uid: uuid.v4(), count: 0));
    return await save(counters: counters);
  }

  @override
  Future<List<CounterModel>> save({
    required List<CounterModel> counters,
  }) async {
    final jsonList = counters.map((c) => c.toJson()).toList();
    await Preferences.preferences.setString(_key, jsonEncode(jsonList));
    return await loadAllCounters();
  }

  @override
  Future<List<CounterModel>> decrement({required String uid}) async {
    final counters = await loadAllCounters();
    final updated = counters.map((c) {
      if (c.uid == uid) {
        if (c.count! > 0) {
          return c.copyWith(count: c.count! - 1);
        }
      }
      return c;
    }).toList();

    return await save(counters: updated);
  }

  @override
  Future<List<CounterModel>> increment({required String uid}) async {
    final counters = await loadAllCounters();
    final updated = counters.map((c) {
      if (c.uid == uid) {
        return c.copyWith(count: c.count! + 1);
      }
      return c;
    }).toList();

    return await save(counters: updated);
  }

  @override
  Future<List<CounterModel>> remove({required String uid}) async {
    final counters = await loadAllCounters();

    final updated = counters.where((c) => c.uid != uid).toList();
    return await save(counters: updated);
  }
}
