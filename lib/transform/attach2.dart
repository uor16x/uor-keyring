String attach(String input, String attachment, bool after) {
  return after ? '$input$attachment' : '$attachment$input';
}
