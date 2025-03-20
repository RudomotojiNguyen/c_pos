import 'package:flutter/material.dart';

mixin LoadingStateMixin<T extends StatefulWidget> on State<T> {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  /// Hàm này giúp cập nhật trạng thái loading từ Bloc
  void updateLoadingState(bool value) {
    if (isLoading.value != value) {
      isLoading.value = value;
    }
  }

  // Future<void> withLoading(Future<void> Function() callback) async {
  //   if (isLoading.value) return;
  //   isLoading.value = true; // 🚀 Đã có Bloc quản lý nên có thể bỏ finally
  //   await callback();
  // }

  void withLoading(Function callback, {Function()? warnProcessing}) {
    if (isLoading.value) {
      warnProcessing?.call();
      return;
    }

    updateLoadingState(true);

    try {
      var result = callback();

      // 🔥 Nếu là Future, đợi nó hoàn thành trước khi tắt loading
      if (result is Future) {
        result.then((_) {
          if (mounted) updateLoadingState(false);
        }).catchError((error) {
          if (mounted) updateLoadingState(false);
          throw error; // Để không nuốt lỗi
        });
      } else {
        // 🔥 Nếu không phải Future ➡️ widget sử dụng tự gọi hàm updateLoadingState để tắt
      }
    } catch (e) {
      if (mounted) updateLoadingState(false);
      rethrow; // Để lỗi không bị mất
    }
  }

  @override
  void dispose() {
    isLoading.dispose();
    super.dispose();
  }
}
