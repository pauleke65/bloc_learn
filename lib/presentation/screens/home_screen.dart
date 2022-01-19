import '../../business_logic/cubits/counter/counter_cubit.dart';
import '../../business_logic/cubits/internet/cubit/internet_cubit.dart';
import '../../utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.title = '', this.color = Colors.black})
      : super(key: key);

  final String title;
  final Color? color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Decremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'BRR, NEGATIVE ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      'YAAAY ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      'HMM, NUMBER 5',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: Text(widget.title),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.bloc<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: Text('${widget.title} #2'),
                    onPressed: () {
                      // BlocProvider.of<CounterCubit>(context).increment();
                      context.read<CounterCubit>().increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //         builder: (_) => BlocProvider.value(
                  //               value: BlocProvider.of<CounterCubit>(context),
                  //               child: const SecondScreen(
                  //                 color: Colors.redAccent,
                  //                 title: "Second Screen",
                  //               ),
                  //             )));
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text("Go To Second Screen"),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     CupertinoPageRoute(
                  //         builder: (_) => BlocProvider.value(
                  //               value: BlocProvider.of<CounterCubit>(context),
                  //               child: const SecondScreen(
                  //                 color: Colors.redAccent,
                  //                 title: "Second Screen",
                  //               ),
                  //             )));
                  Navigator.pushNamed(context, '/third');
                },
                child: const Text("Go To Third Screen"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
