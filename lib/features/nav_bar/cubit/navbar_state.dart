part of 'navbar_cubit.dart';

@immutable
sealed class NavbarState {}

final class NavbarInitial extends NavbarState {}
final class IndexChanged extends NavbarState {}
