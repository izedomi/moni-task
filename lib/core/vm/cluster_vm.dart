import 'dart:convert';

import 'package:moni/core/constants/app_constants.dart';
import 'package:moni/core/enums/viewstate.dart';
import 'package:moni/core/models/cluster.dart';
import 'package:moni/core/models/service_response.dart';
import 'package:moni/core/services/api_service.dart';
import 'package:moni/core/vm/base_vm.dart';

class ClusterVM extends BaseViewModel {
  final ApiService _apiService = ApiService();

  late Cluster _cluster;
  Cluster get cluster => _cluster;

  String? _statusMessage;
  String? get statusMessage => _statusMessage;

  ServiceResponse? _serviceResponse;
  ServiceResponse? get serviceResponse => _serviceResponse;

  ViewState _viewState = ViewState.busy;
  ViewState get viewState => _viewState;
  void setViewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  Future<void> getClusters() async {
    String url = baseUrl + "/loans";

    //show loader
    if (_viewState != ViewState.busy) {
      setViewState(ViewState.busy);
    }

    try {
      //make api call
      _serviceResponse = await _apiService.get(url: url);

      //api call has error, notify listeners
      if (_serviceResponse!.hasError) {
        _statusMessage = _serviceResponse!.message;
        setViewState(ViewState.error);
      }

      //create cluster instance
      _cluster = clusterFromJson(json.encode(_serviceResponse!.data));
      setViewState(ViewState.retrieved);
    } catch (e) {
      //error occurred, notify listeners
      if (_serviceResponse!.hasError) {
        _statusMessage = "Action couldn't be completed. Please try again later";
        setViewState(ViewState.error);
      }
    }
  }

  String getRate(double rate) {
    int rateInInteger = (rate * 100).toInt();
    return "$rateInInteger%";
  }

  String getMembersCount() {
    return (_cluster.activeAgents.length +
            _cluster.inactiveAgents.length +
            _cluster.overdueAgents.length +
            _cluster.dueAgents.length)
        .toString();
  }
}
