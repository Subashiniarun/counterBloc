import 'dart:async';
enum CounterTypes{
 increment,
 decrement,
 reset,
}
class CounterBloc{
 late int counter;
 final _myStreamController = StreamController<int>();

 //getter
 StreamSink<int> get counterSink => _myStreamController.sink;
 Stream<int> get counterStream => _myStreamController.stream;


 final _eventStreamController = StreamController<CounterTypes>();
 StreamSink<CounterTypes> get eventCounterSink => _eventStreamController.sink;
 Stream<CounterTypes> get eventCounterStream => _eventStreamController.stream;

 CounterBloc(){
   counter = 0;
   eventCounterStream.listen((event) {
     if(event == CounterTypes.increment){
      counter++;
     }else  if(event == CounterTypes.decrement){
       counter--;
     }else  if(event == CounterTypes.reset){
       counter = 0;
     }
     counterSink.add(counter);
   });
 }
}