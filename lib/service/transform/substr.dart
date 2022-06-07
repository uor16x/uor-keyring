String substr(String input, int from, int to) {
  if (input.isEmpty) {
    throw Exception('Input is empty');
  }
  if (from > input.length - 1) {
    throw Exception('From is larger than the input length');
  }
  if (to > input.length - 1) {
    throw Exception('To is larger than the input length');
  }
  return input.substring(from, to);
}
