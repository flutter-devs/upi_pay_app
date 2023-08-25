import 'package:easy_upi_payment/easy_upi_payment.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/local_storage/app_storage.dart';

class MainStateNotifier extends StateNotifier<MainState> {
  MainStateNotifier(this.ref) : super(MainState.initial);

  TransactionDetailModel? transactionDetailModel;

  final Ref ref;

  Future<void> startPayment(EasyUpiPaymentModel model) async {
    state = MainState.loading;
    try {
      savePaymentData(model);
      //
      final res = await EasyUpiPaymentPlatform.instance.startPayment(model);
      if (res != null) {
        transactionDetailModel = res;
        state = MainState.success;
      } else {
        state = MainState.error;
      }
    } on EasyUpiPaymentException {
      state = MainState.error;
    }
  }

  void savePaymentData(EasyUpiPaymentModel model) {
    ref.read(appStorageProvider)
      ..putName(model.payeeName)
      ..putUpiId(model.payeeVpa)
      ..putAmount(model.amount.toString());

    if (model.description != null) {
      ref.read(appStorageProvider).putDescription(model.description!);
    }
  }
}

final mainStateProvider =
    StateNotifierProvider.autoDispose<MainStateNotifier, MainState>(
  (ref) {
    return MainStateNotifier(ref);
  },
);

enum MainState {
  initial,
  loading,
  success,
  error,
}
