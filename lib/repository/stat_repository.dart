import 'package:dio/dio.dart';
import 'package:dusty_dust/const/data.dart';
import 'package:dusty_dust/model/stat_model.dart';

class StatRepository {
  static fetchData() async {
    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey': serviceKey,
        'numOfRows': 30,
        'pageNo': 1,
        'itemCode': 'PM10',
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK',
        'returnType': 'json',
      },
    );

    return response.data['response']['body']['items']
        .map(
          (item) => StatModel.fromJson(json: item),
        )
        .toList();
  }
}
