import 'dart:io';
const String runCmd  = "dart run ticktock.dart";

void main(List<String> arguments) {
  // print(arguments);
  if(arguments.isEmpty){
    print("⏱️ Usage: $runCmd <start|stop|status|clear>");
    exit(0);
  }
}
