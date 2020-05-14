import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyConsumer<T extends ChangeNotifier> extends StatelessWidget {

//  final Widget child;
  final T provide;
  final Widget Function(BuildContext context, T value, Widget child) builder;
  MyConsumer(this.provide,this.builder);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provide,
      child: Consumer<T>(
        builder: builder,
      ),
    );
  }
}

class MySelector<Tp extends ChangeNotifier,Td> extends StatelessWidget {
  final Tp provide;
  final Widget Function(BuildContext context, Td value, Widget child) builder;
  final Td Function(BuildContext, Tp) selector;
  MySelector(this.provide,this.builder,this.selector);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provide,
      child: Selector<Tp,Td>(
        selector: selector,
        builder: builder,
      ),
    );
  }
}
