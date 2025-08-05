part of 'booked_tickets_cubit.dart';

@immutable
sealed class BookedTicketsState {}

final class BookedTicketsInitial extends BookedTicketsState {}

final class BookedTicketsLoading extends BookedTicketsState {}

final class BookedTicketsSuccess extends BookedTicketsState {
  final List<BookedModel> tickets;
  BookedTicketsSuccess({required this.tickets});
}
