import 'package:observe_core/model.dart';

main(List<String> args) {
  Event e = new Event<String>('sampledata', 0, 'data');
  e.decorations["action"] = new EventDecoration<String>(e, "action", "sample_act");
  e.decorations["result"] = new EventDecoration<String>(e, "result", "ok");

  print ("Event sample");
  print (e);

}
