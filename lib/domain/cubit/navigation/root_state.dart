abstract class RootState {
  late int index;
}

class RootStateChanged extends RootState {
  RootStateChanged(int index) {
    super.index = index;
  }
}
