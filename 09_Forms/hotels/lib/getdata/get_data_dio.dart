import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hotels/models/hotel.dart';

class DioData {
  static getMainData() async {
    final response = await Dio()
        .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');

    return response.data
        .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
        .toList();
  }

  static getDetailData({required String uuid}) async {
    final response = await Dio().get('https://run.mocky.io/v3/$uuid');
    log(response.toString());
    return HotelDetail.fromJson(response.data);
  }
}
