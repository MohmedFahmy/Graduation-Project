import '../data/model/ShipmentModel.dart';

sealed class ShipmentsState {}

final class ShipmentsInitial extends ShipmentsState {}

final class ShipmentsLoaded extends ShipmentsState {}

final class ShipmentsSuccess extends ShipmentsState {
  final List<ShipmentModel> shipments;
  ShipmentsSuccess({required this.shipments});
}
