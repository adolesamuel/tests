// void main() {
//   final result = currencyParser(10000);

//   print(result);
//   var list1 = ['I', '💙', 'Flutter'];
//   final List list2 = list1;
//   list2[2] = 'Dart';

//   const list3 = ['I', '💙', 'Flutter'];

//   print(list2);
// }

// String currencyParser(int input) {
//   String data = input.toString();
//   String fdata = '';
//   int count = 0;
//   for (int i = data.length - 1; i >= 0; i--) {
//     fdata = data[i] + fdata;
//     count++;
//     if (count % 3 == 0 && i > 0) {
//       fdata = ",$fdata";
//     }
//   }

//   return '\$ $fdata.00';
// }

import 'dart:isolate';

import 'package:flutter/foundation.dart';

String currencyParser(int currency) {
  final data = currency.toString();

  String fData = '';

  int count = 0;

  for (int i = data.length - 1; i >= 0; i--) {
    fData = data[i] + fData;
    count++;
    if (count % 3 == 0 && i > 0) {
      fData = "," + fData;
    }
  }

  return '\$ $fData.00';
}

String playHideAndSeekTheLongVersionNoIsolate() {
  var counting = 0;
  for (var i = 1; i <= 10000000000; i++) {
    counting = i;
  }
  return '$counting! Ready or not, here I come!';
}

// void playHidAndSeekTheLongversionIsolate(SendPort sendport) {
//   var counting = 0;
//   for (var i = 1; i <= 10000000000; i++) {
//     counting = i;
//   }
//   sendport.send('$counting! Ready or not, here I come!');
// }

// void main() async {
//   final receivePort = ReceivePort();

//   final isolate = await Isolate.spawn(
//     playHidAndSeekTheLongversionIsolate,
//     receivePort.sendPort,
//   );

//   receivePort.listen((message) {
//     print(message);

//     receivePort.close();
//     isolate.kill();
//   });
// }

void playHidAndSeek(SendPort sendPort) {
  var counting = 0;
  for (var i = 1; i <= 10000000000; i++) {
    counting = 1;
  }
  sendPort.send('Counting done');
}

void main() async {
  final receivePort = ReceivePort();

  final isolate =
      await Isolate.spawn<SendPort>(playHidAndSeek, receivePort.sendPort);

  receivePort.listen((message) {
    print('message');

    receivePort.close();
    isolate.kill();
  });
}
