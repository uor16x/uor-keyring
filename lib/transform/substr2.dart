String substr(String input, int from, int to) {
  if (input.isEmpty) {
    throw Exception('Input is empty');
  }
  if (to < from) {
    // if to is less than from - swap them
    int oldFrom = from;
    from = to;
    to = oldFrom;
  }
  if (to > input.length - 1) {
    // if to is bigger than length - repeat the input until its possible to take the range
    int timesRepeated = (to / input.length).floor() + 1;
    input = List.filled(timesRepeated, input).join();
  }

  return input.substring(from, to);
}
