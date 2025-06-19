import 'package:challenge/src/data/repository/counter_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final multicounterRepository = Provider((ref) {
  return CounterRespositoryImp();
});
