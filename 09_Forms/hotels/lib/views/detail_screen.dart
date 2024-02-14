import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotels/widgets/my_widgets.dart';
import 'package:hotels/getdata/get_data_dio.dart';
import 'package:hotels/models/hotel.dart';

class HotelDetailView extends StatefulWidget {
  const HotelDetailView({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  createState() => _HotelDetailViewState();
}

class _HotelDetailViewState extends State<HotelDetailView> {
  bool isLoading = false;
  late HotelDetail hotel;
  String? errString;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    try {
      hotel = await DioData.getDetailData(uuid: widget.uuid);
    } on DioException catch (e) {
      errString = e.response!.data['message'];

      log(e.response!.data['message']);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            !isLoading && errString == null ? Text(hotel.name) : const Text(''),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : errString != null
              ? Center(
                  child: Text(
                  'Ошибка доступа к данным!\n${errString!}',
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 245, 49, 35)),
                ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider.builder(
                        itemCount: hotel.photos.length,
                        // items: hotel.photos
                        //     .map((e) => Image.asset('assets/images/$e'))
                        //     .toList(),
                        options: CarouselOptions(
                            height: 300,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2),
                            enlargeCenterPage: true,
                            //                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                            viewportFraction: .7,
                            autoPlayInterval: const Duration(seconds: 4)),
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(2, 2),
                                        blurRadius: 8,
                                        spreadRadius: 2)
                                  ],
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/${hotel.photos[index]}'))));
                        }),
                    MyRichText(
                        caption: 'Страна', text: hotel.address['country']),
                    MyRichText(caption: 'Город', text: hotel.address['city']),
                    MyRichText(caption: 'Улица', text: hotel.address['street']),
                    MyRichText(caption: 'Рейтинг', text: hotel.rating),
                    const EmptyDivider(),
                    const Text('Сервисы',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    const EmptyDivider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ServicesWidget(
                            caption: 'Бесплатные',
                            services: hotel.services['free']),
                        const SizedBox(
                          width: 20,
                        ),
                        ServicesWidget(
                            caption: 'Платные',
                            services: hotel.services['paid']),
                      ],
                    ),
                  ],
                ),
    );
  }
}
