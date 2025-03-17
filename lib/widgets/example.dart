import 'package:flutter/material.dart';

class WrapperWidget extends StatelessWidget {
  WrapperWidget({super.key});

  final CounterNotifier counterNotifier = CounterNotifier();

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      notifier: counterNotifier,
      child: BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CounterNotifier? notifier = CounterProvider.of(context);
    return Scaffold(
      body: Center(
        child: Text("${notifier?.count ?? 0}"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        notifier?.increment();
      }),
    );
  }
}

class CounterNotifier extends ChangeNotifier {
  int _counter = 0;

  int get count => _counter;

  void increment() {
    _counter++;

    print("object");
    notifyListeners();
    //Он работает но на него никто не подписан
  }
}

class CounterProvider extends InheritedNotifier<CounterNotifier> {
  CounterProvider({required child, required CounterNotifier notifier})
      : super(child: child, notifier: notifier);

  static CounterNotifier? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterProvider>()
        ?.notifier;
  }
}
