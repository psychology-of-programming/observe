// TOOD: Support serialisation and deserialisation to/from JSON

class Session {
  final String id;

  final List<Event> events = [];
  final Map<String, SessionDecoration> decorations = {};

  Session(this.id);

  eventsForDecorationName(String decorationName) {
    return events.where((e) => e.decorations.containsKey(decorationName));
  }

  eventDecorationsForName(String decorationName) {
    List<EventDecoration> decorations = [];

    for (Event e in events) {
      if (e.decorations.containsKey(decorationName)) {
        decorations.add(e.decorations[decorationName]);
      }
    }
    return decorations.iterator;
  }

  get allEventNames {
    Set names = new Set();
    for (Event e in events) {
      names.add(e.name);
    }
    return names;
  }

  get allDecorations {
    Set names = new Set();
    for (Event e in events) {
      names.addAll(e.decorations.keys);
    }
    return names;
  }
}

class Event<T> {
  final String name;
  final int time;
  final Map<String, EventDecoration> decorations = {};
  final T data;
  Event(this.name, this.time, this.data);

  toString() => "Event: $time, $name, \n\t${decorations.values.join("\n\t")}, $data";
}

class SessionDecoration<T> {
  final Session owner;
  final String name;
  final T value;
  SessionDecoration(this.owner, this.name, this.value);

  toString() => "SessionDecoration: $owner, $name, $value";
}

class EventDecoration<T> {
  final Event owner;
  final List providence;
  final String name;
  final T value;
  EventDecoration(this.owner, this.name, this.value, [this.providence]);

  toString() => "EventDecoration: $name, $value";
}
