import 'package:challenge/src/domain/model/counter_model.dart';
import 'package:challenge/src/features/multicounter/repository/multicounter_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final multicounterProvider =
    StateNotifierProvider<MultiCounterNotifier, List<CounterModel>>(
      (ref) => MultiCounterNotifier(ref),
    );

class MultiCounterNotifier extends StateNotifier<List<CounterModel>> {
  final Ref ref;
  MultiCounterNotifier(this.ref) : super([]) {
    _load();
  }

  Future<void> _load() async {
    state = await ref.read(multicounterRepository).loadAllCounters();
  }

  void addCounter() async {
    state = await ref.read(multicounterRepository).add(counters: state);
  }

  void increment(String uid) async {
    state = await ref.read(multicounterRepository).increment(uid: uid);
  }

  void decrement(String uid) async {
    state = await ref.read(multicounterRepository).decrement(uid: uid);
  }

  void remove(String uid) async {
    state = await ref.read(multicounterRepository).remove(uid: uid);
  }
}
