class NoteState {
  // used to save notes locally
  bool isChecked;
  String text;
  NoteState({this.isChecked = false, this.text});

  void changeState() {
    isChecked = !isChecked;
  }
}
