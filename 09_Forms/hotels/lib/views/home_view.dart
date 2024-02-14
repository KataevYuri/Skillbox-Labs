import 'package:flutter/material.dart';
import 'package:hotels/getdata/get_data_dio.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/views/detail_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<HotelPreview> hotels;
  bool isLoading = false;
  TypeView typeView = TypeView.typeViewList;

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    hotels = await DioData.getMainData();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API. Список отелей'),
        actions: [
          IconButton(
              onPressed: () => setState(() {
                    typeView = TypeView.typeViewList;
                  }),
              icon: const Icon(Icons.list)),
          IconButton(
              onPressed: () => setState(() {
                    typeView = TypeView.typeViewGrid;
                  }),
              icon: const Icon(Icons.grid_view)),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : typeView == TypeView.typeViewList
              ? ListView.builder(
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Card(
                        semanticContainer: true,
                        shadowColor: Colors.black,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white60,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                'assets/images/${hotels[index].poster}',
                                //height: 200,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(hotels[index].name),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HotelDetailView(
                                                          uuid: hotels[index]
                                                              .uuid)));
                                        },
                                        child: const Text('Подробнее'))
                                  ],
                                ),
                              )
                            ]),
                      ),
                    );
                  })
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2),
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Card(
                        shadowColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white60,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Image.asset(
                                'assets/images/${hotels[index].poster}',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(hotels[index].name,
                                    style: const TextStyle(fontSize: 12))),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HotelDetailView(
                                                    uuid: hotels[index].uuid)));
                                  },
                                  child: const Text(
                                    'Подробнее',
                                    style: TextStyle(fontSize: 10),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
    );
  }
}

enum TypeView { typeViewGrid, typeViewList }
