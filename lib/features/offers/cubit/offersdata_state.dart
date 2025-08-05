part of 'offersdata_cubit.dart';

sealed class OffersdataState {}

final class OffersdataInitial extends OffersdataState {}

final class GetOffersDataLoading extends OffersdataState {}

final class GetOffersataSuccess extends OffersdataState {
  final List<OfferModel> offers;
  GetOffersataSuccess({required this.offers});
}
