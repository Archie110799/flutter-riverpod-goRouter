import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';

class PairingListNotifier extends StateNotifier<PairingListState> {
  final Ref ref;

  PairingListNotifier(this.ref)
      : super(PairingListState(
          isDisable: true,
        ));

  static final provider =
      StateNotifierProvider.autoDispose<PairingListNotifier, PairingListState>(
    (ref) => PairingListNotifier(ref),
  );

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Your code to interact with the widget
    });
  }

  void handleDeletePairing() {
    // Implement your delete pairing logic here
  }

  void handleScanDevices(BuildContext context) {
    // context.go(AppRouter.SCAN_DEVICE_PATH);
  }

  void handleRouteToSTDevices(BuildContext context) {
    // context.go(AppRouter.MEASUREMENT_DEVICE_MANAGEMENT_PATH);
  }

  void onClickTab(bool disabled) {
    print('onClickTab ${disabled}');
    state = state.copyWith(isDisable: disabled);
  }
}

class PairingListState {
  PairingListState({
    required this.isDisable,
  });

  bool isDisable;

  PairingListState copyWith({
    bool? isDisable,
  }) {
    return PairingListState(
      isDisable: isDisable ?? this.isDisable,
    );
  }
}
