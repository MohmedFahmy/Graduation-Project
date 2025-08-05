import '../data/model/ticket_model.dart';

sealed class GetTicketsState {}

final class GetTicketsInitial extends GetTicketsState {}

final class GetTicketsLoading extends GetTicketsState {}

final class GetTicketsSuccess extends GetTicketsState {
  final List<TicketModel> tickets;
  GetTicketsSuccess({required this.tickets});
}

final class SearchTicketsSuccess extends GetTicketsState {
  final List<TicketModel> searchTickets;
  SearchTicketsSuccess({required this.searchTickets});
}

final class SearchTicketsLoading extends GetTicketsState {}
