import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme_bloc/counter/bloc/counter_bloc.dart';
import 'package:flutter_theme_bloc/simple_bloc_delegate.dart';
import 'package:flutter_theme_bloc/theme/bloc/theme_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Theme with Flutter Bloc',
            theme: theme,
            home: CounterPage(),
          );
        },
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Theme with Flutter Bloc'),
            ),
            body: Center(
              child: Container(
                child: Text('$count'),
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      // context.bloc<CounterBloc>().add(CounterEvent.increment);
                      BlocProvider.of<CounterBloc>(context)
                          .add(CounterEvent.increment);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: FloatingActionButton(
                    child: Icon(Icons.remove),
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () =>
                        context.bloc<CounterBloc>().add(CounterEvent.decrement),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.update,
                      color: Colors.white,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      // context.bloc<ThemeBloc>().add(ThemeEvent.toggle);
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeEvent.toggle);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
