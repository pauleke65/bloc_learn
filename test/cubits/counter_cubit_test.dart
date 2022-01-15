import 'package:bloc_learn/business_logic/cubits/counter/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubitTest -', () {
    CounterCubit? counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit!.close();
    });

    test(
        'The initial state for the CounterCubit should be CounterState(counterValue: 0)',
        () {
      expect(counterCubit!.state, const CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'emits CounterState(counterValue:1, wasIncremented:true) when cubit.increment() is called.',
      build: () => counterCubit!,
      act: (cubit) => cubit.increment(),
      expect: () => const <CounterState>[
        CounterState(counterValue: 1, wasIncremented: true)
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'emits CounterState(counterValue:-1, wasIncremented:false) when cubit.decrement() is called.',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () => const <CounterState>[
        CounterState(counterValue: -1, wasIncremented: false)
      ],
    );
  });
}
