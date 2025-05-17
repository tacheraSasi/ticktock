import 'dart:convert';
import 'dart:io';
import 'utils/utlis.dart';
const runCmd  = "dart run ticktock.dart";
const sessionFile = 'ticktock.json';

void main(List<String> arguments) async {
  // print(arguments);
  if(arguments.isEmpty){
    print("⏱️ Usage: $runCmd <start|stop|status|clear>");
    exit(0);
  }

  final command = arguments[0];

  switch (command) {
    case 'start':
      await startSession();   
      break;
    case 'stop':
      await stopSession();
      break;
    case 'status':
      await showStatus();
      break;
    default:
      print("❌ Unknown command: $command");
  }
}

Future<void> startSession()async{
  final file = File(sessionFile);
  if(await file.exists()){
    final data = jsonDecode(await file.readAsStringSync());
    if(and(data['start'] != null, data['end'] == null)){
      print("⚠️ Session already started at: ${data['start']}");
      return;
    }
  }

  final startTime = DateTime.now().toIso8601String();
  await file.writeAsString(jsonEncode({'start':startTime,'end':null}));
  print("✅ Session started at $startTime");
}

Future<void> stopSession()async{

}
Future<void> showStatus()async{

}

