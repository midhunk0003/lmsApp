import 'package:flutter/material.dart';
import 'package:lms/core/failure.dart';
import 'package:lms/presentation/widgets/diloges/success_and_failure_diloge_widget.dart';

class AppDialogHelper {
  static void showFailureDialog<T extends ChangeNotifier>({
    required BuildContext context,
    required dynamic failure,
    required T provider,
  }) {
    if (failure == null) return;

    // Skip network failure if needed
    if (failure is NetworkFailure) {
      return;
    }

    if (failure is ClientFailure ||
        failure is ServerFailure ||
        failure is OtherFailureNon200 ||
        failure is AuthFailure ||
        failure is LoginFailure) {
      showDialog(
        context: context,
        builder: (_) {
          return FailureAndSuccessDialogWidget<T>(
            image: "assets/images/failuremsg.png",
            heading: "Failed",
            title: failure.message,
            provider: provider,
          );
        },
      );
    }
  }

  static void showSuccessDialog<T extends ChangeNotifier>({
    required BuildContext context,
    required String message,
    required T provider,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return FailureAndSuccessDialogWidget<T>(
          image: "assets/images/successmesg.png",
          heading: "Success",
          title: message,
          provider: provider,
        );
      },
    );
  }
}
