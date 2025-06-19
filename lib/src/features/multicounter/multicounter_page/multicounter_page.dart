import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:challenge/src/features/multicounter/widgets/widgets.dart';
import 'package:challenge/src/features/multicounter/provider/multicounter_provider.dart';

class MultiCounterPage extends ConsumerWidget {
  const MultiCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counters = ref.watch(multicounterProvider);
    final controller = ref.read(multicounterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Contadores')),
      body: counters.isEmpty
          ? NoCounters()
          : ListView.builder(
              itemCount: counters.length,
              itemBuilder: (context, index) {
                final counter = counters[index];

                return CardCounter(counter: counter);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addCounter(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
