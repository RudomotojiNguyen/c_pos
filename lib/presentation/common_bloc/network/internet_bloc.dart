import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  InternetBloc(this._connectivity) : super(InternetInitial()) {
    on<InternetCheckRequested>(_onCheckInternet);
    on<InternetStatusChanged>(_onStatusChanged);

    // Lắng nghe thay đổi kết nối
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        for (var result in results) {
          add(InternetStatusChanged(result));
        }
      },
    );
  }

  Future<void> _onCheckInternet(
      InternetCheckRequested event, Emitter<InternetState> emit) async {
    final List<ConnectivityResult> results = await _connectivity.checkConnectivity();

    // Xử lý từng phần tử trong danh sách
    for (var result in results) {
      add(InternetStatusChanged(result));
    }
  }

  void _onStatusChanged(
      InternetStatusChanged event, Emitter<InternetState> emit) {
    if (event.result == ConnectivityResult.none) {
      emit(InternetDisconnected());
    } else {
      emit(InternetConnected(event.result));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
