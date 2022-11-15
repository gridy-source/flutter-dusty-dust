enum ItemCode {
  PM10, // 미세먼지지
  PM25, // 초미세먼지
  NO2, // 이산화질소
  O3, // 오존
  CO, // 일산화탄소
  SO2 // 이황산가스
}

class StatModel {
  final double daegu;
  final double chungnam;
  final double incheon;
  final double daejeon;
  final double gyeonbuk;
  final double sejong;
  final double gwangju;
  final double jeonbuk;
  final double gangwon;
  final double ulsan;
  final double jeonnam;
  final double seoul;
  final double busan;
  final double jeju;
  final double chungbuk;
  final double gyeongnam;
  final double gyeonggi;

  final DateTime dateTime;
  final ItemCode itemCode;

  // JSON 형태에서 데이터를 받아온다.
  StatModel.fromJson({required Map<String, dynamic> json})
      : daegu = double.parse(json['daegu'] ?? '0'),
        chungnam = double.parse(json['chungnam'] ?? '0'),
        incheon = double.parse(json['incheon'] ?? '0'),
        daejeon = double.parse(json['daejeon'] ?? '0'),
        gyeonbuk = double.parse(json['gyeonbuk'] ?? '0'),
        sejong = double.parse(json['sejong'] ?? '0'),
        gwangju = double.parse(json['gwangju'] ?? '0'),
        jeonbuk = double.parse(json['jeonbuk'] ?? '0'),
        gangwon = double.parse(json['gangwon'] ?? '0'),
        ulsan = double.parse(json['ulsan'] ?? '0'),
        jeonnam = double.parse(json['jeonnam'] ?? '0'),
        seoul = double.parse(json['seoul'] ?? '0'),
        busan = double.parse(json['busan'] ?? '0'),
        jeju = double.parse(json['jeju'] ?? '0'),
        chungbuk = double.parse(json['chungbuk'] ?? '0'),
        gyeongnam = double.parse(json['gyeongnam'] ?? '0'),
        gyeonggi = double.parse(json['gyeonggi'] ?? '0'),
        dateTime = DateTime.parse(json['dataTime']),
        itemCode = parseItemCode(json['itemCode']);

  static ItemCode parseItemCode(String raw) {
    if (raw == 'PM2.5') {
      return ItemCode.PM25;
    }
    return ItemCode.values.firstWhere((element) => element.name == raw);
  }

  double getLevelFromRegion(String region) {
    switch (region) {
      case '서울':
        return seoul;
      case '부산':
        return busan;
      case '대구':
        return daegu;
      case '인천':
        return incheon;
      case '광주':
        return gwangju;
      case '대전':
        return daejeon;
      case '울산':
        return ulsan;
      case '세종':
        return sejong;
      case '경기':
        return gyeonggi;
      case '강원':
        return gangwon;
      case '충북':
        return chungbuk;
      case '충남':
        return chungnam;
      case '전북':
        return jeonbuk;
      case '전남':
        return jeonnam;
      case '경북':
        return gyeonbuk;
      case '경남':
        return gyeongnam;
      case '제주':
        return jeju;
      default:
        throw Exception('알 수 없는 지역입니다.');
    }
  }
}
