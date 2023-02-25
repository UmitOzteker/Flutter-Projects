import 'dart:async';

main() {
  myStreamFunction().listen((event) {
    print(event);
  });
  StreamController _myStreamController = StreamController();
  void functionForStreamController() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      var i;
      if(i==6){_myStreamController.addError("Bir Hata Oluştu");}
      _myStreamController.sink.add(i ++);
    }
    _myStreamController.close();
  }

  functionForStreamController();

  _myStreamController.stream.listen((event) {
    print(event * 10);
  }, onDone: () {
    print("Stream");
  },
  onError: (error){
 print(error);
  },cancelOnError: true
  );
}

Stream<int> myStreamFunction() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i + 1;
  }
}
