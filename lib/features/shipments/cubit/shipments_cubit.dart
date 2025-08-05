import 'package:bloc/bloc.dart';
import 'package:graduation_app/features/shipments/cubit/shipments_state.dart';
import 'package:graduation_app/features/shipments/data/shipments_data.dart';

class ShipmentsCubit extends Cubit<ShipmentsState> {
  ShipmentsCubit() : super(ShipmentsInitial());

  final ShipmentsData shipmentsData = ShipmentsData();

  Future<void> fetchShipments({required String userNumber}) async {
    emit(ShipmentsLoaded());

    try {
      final shipments =
          await shipmentsData.getMyShipments(userNumber: userNumber);
      emit(ShipmentsSuccess(shipments: shipments));
    } catch (e) {
      print("Failed to fetch shipments: ");
    }
  }
}
