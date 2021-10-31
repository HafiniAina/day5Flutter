// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;
// import 'dart:convert';

// void main(List<String> arguments) {
//   final channel = IOWebSocketChannel.connect(
//       'wss://ws.binaryws.com/websockets/v3?app_id=1089');

//   channel.stream.listen((tick) {
//     final decodedMessage = jsonDecode(tick);


//     final name = decodedMessage ['tick']['symbol'];
//     final price = decodedMessage ['tick']['quote'];

//     final serverTimeAsEpoch = decodedMessage['tick']['epoch'];

//     final serverTime =
//         DateTime.fromMillisecondsSinceEpoch(serverTimeAsEpoch * 1000);
//     // print(serverTime);
//     // To disconnect from the websocket use : channel.sink.close();
//         print("Name $name  Price $price   Time $serverTime");
//       //  channel.sink.close();
//   });

//   channel.sink.add('{ "ticks": "R_50", "subscribe": 1 }');
// }





// ignore_for_file: unused_import
import 'dart:io';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

void main(List<String> arguments) {
  final channel = IOWebSocketChannel.connect(
      'wss://ws.binaryws.com/websockets/v3?app_id=1089');

  channel.stream.listen((tick) {
    final decodedMessage = jsonDecode(tick); //convert to readable json

    final name = decodedMessage['tick']['symbol'];
    final price = decodedMessage['tick']['quote'];
    final serverTimeAsEpoch = decodedMessage['tick']['epoch'];
    final serverTime =
        DateTime.fromMillisecondsSinceEpoch(serverTimeAsEpoch * 1000);
    print("Name: $name Price: $price Time: $serverTime");
  });

  print("Type down your desired symbol to check~ :");
  String? symbol = stdin.readLineSync();

  channel.sink.add('{ "ticks": "$symbol", "subscribe": 1}'); //request
}