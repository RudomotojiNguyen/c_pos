import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/address_model.dart';
import '../../../../../data/repository/address_repositories.dart';
import '../../../../mixins/logger_helper.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final LoggerHelper _logger = LoggerHelper();

  final AddressRepositories addressRepositories;

  AddressBloc({required this.addressRepositories}) : super(AddressInitial()) {
    on<GetCitiesEvent>(_onGetCities);
    on<GetDistrictsEvent>(_onGetDistricts);
    on<GetWardsEvent>(_onGetWards);
  }

  FutureOr<void> _onGetCities(
      GetCitiesEvent event, Emitter<AddressState> emit) async {
    try {
      final cities = await _getCities();
      emit(GetCitiesSuccess(state: state, cities: cities));
    } catch (e) {
      _logger.logError(message: 'GetCitiesEvent', obj: e);
    }
  }

  FutureOr<void> _onGetDistricts(
      GetDistrictsEvent event, Emitter<AddressState> emit) async {
    try {
      final districts = await _getDistricts(event.cityId.toString());
      emit(GetDistrictsSuccess(state: state, districts: districts));
    } catch (e) {
      _logger.logError(message: 'GetDistrictsEvent', obj: e);
    }
  }

  FutureOr<void> _onGetWards(
      GetWardsEvent event, Emitter<AddressState> emit) async {
    try {
      final wards = await _getWards(event.districtId.toString());
      emit(GetWardsSuccess(state: state, wards: wards));
    } catch (e) {
      _logger.logError(message: 'GetWardsEvent', obj: e);
    }
  }

  ///
  /// METHOS
  ///
  Future<List<CityModel>> _getCities() async {
    final cities = await addressRepositories.getCity();
    return cities;
  }

  Future<CityModel?> getCityById(int id) async {
    if (state.cities.isEmpty) {
      final cities = await _getCities();
      return cities.firstWhere((element) => element.id == id);
    }
    return state.cities.firstWhere((element) => element.id == id);
  }

  Future<List<DistrictModel>> _getDistricts(String cityId) async {
    final districts = await addressRepositories.getDistrict(cityId.toString());
    return districts;
  }

  Future<DistrictModel?> getDistrictById(
      {required int districtId, required int cityId}) async {
    if (state.districts.isEmpty) {
      final districts = await _getDistricts(cityId.toString());
      return districts.firstWhere((element) => element.id == districtId);
    }
    return state.districts.firstWhere((element) => element.id == districtId);
  }

  Future<List<WardModel>> _getWards(String districtId) async {
    final wards = await addressRepositories.getWard(districtId.toString());
    return wards;
  }

  Future<WardModel?> getWardById(
      {required int wardId, required int districtId}) async {
    if (state.wards.isEmpty) {
      final wards = await _getWards(districtId.toString());
      return wards.firstWhere((element) => element.id == wardId);
    }
    return state.wards.firstWhere((element) => element.id == wardId);
  }
}
