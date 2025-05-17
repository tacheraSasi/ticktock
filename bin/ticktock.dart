import 'dart:io';
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
