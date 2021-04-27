class NoteState {
  bool isChecked;
  String text;
  NoteState({this.isChecked = false, this.text});

  void changeState() {
    isChecked = !isChecked;
  }
}
