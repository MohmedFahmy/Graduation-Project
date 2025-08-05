import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarInitial());
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(IndexChanged());
  }
}
