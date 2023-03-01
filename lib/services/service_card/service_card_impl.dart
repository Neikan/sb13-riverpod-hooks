// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:mtg_riverpod_hooks/consts/urls.dart';
import 'package:mtg_riverpod_hooks/services/service_card/service_card.dart';
import 'package:mtg_riverpod_hooks/services/service_http.dart';

@LazySingleton(as: ServiceCard)
class ServiceCardImpl implements ServiceCard {
  @override
  Future<Response<dynamic>> getCard(String id) async =>
      await ServiceHttp.instance.get('$urlCards/$id');
}
