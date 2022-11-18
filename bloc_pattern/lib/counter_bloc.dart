import 'dart:async';
enum CounterAction { Increment, Decrement, Reset }

class CounterBloc{
  int counter = 0;
  final _stateStreamController = StreamController<int>();
  //sink's for input
  StreamSink<int> get counterSink => _stateStreamController.sink;
  //stream is used for displaying output/result
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  //sink's for input
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  //stream is used for displaying output/result
  Stream<CounterAction> get _eventStream => _eventStreamController.stream;

  CounterBloc(){
    counter = 0;
    _eventStream.listen((event) {
      if(event == CounterAction.Increment)
        counter++;
      else if (event == CounterAction.Decrement)
        counter--;
      else if(event == CounterAction.Reset)
        counter = 0;
      
      counterSink.add(counter);

    });
  }
  void dispose(){
    _stateStreamController.close();
    _eventStreamController.close();
  }
}