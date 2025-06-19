import 'package:challenge/src/domain/model/counter_model.dart';
import 'package:challenge/src/features/multicounter/provider/multicounter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardCounter extends ConsumerWidget {
  const CardCounter({super.key, required this.counter});

  final CounterModel counter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(multicounterProvider.notifier);
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) =>
              ScaleTransition(scale: anim, child: child),
          child: Text(
            'Valor: ${counter.count}',
            textAlign: TextAlign.left,
            key: ValueKey(counter.count),
            style: const TextStyle(fontSize: 24),
          ),
        ),
        subtitle: Text('UID: ${counter.uid?.substring(0, 8)} ...'),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => controller.decrement(counter.uid!),
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () => controller.increment(counter.uid!),
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => controller.remove(counter.uid!),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
