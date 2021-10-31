import 'package:demo_app/model/json_model.dart';
import 'package:demo_app/services/data_reo.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/provider_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late List data;
  DataRepository? dataRepository;
  late List<JsonModel> data;
  bool isLOading = true;
  @override
  void initState() {
    dataRepository = DataRepository();
    loadData();
    super.initState();
  }

  void loadData() async {
    data = await dataRepository!.getData();
    print(data.length);
    if (data != null) {
      isLOading = false;
      setState(() {});
    }
  }

  // Widget _build() {
  //   return FutureBuilder(
  //     future: DefaultAssetBundle.of(context).loadString('assets/items.json'),
  //     builder: (context, snapshot) {
  //       var myData = jsonDecode(snapshot.data.toString());
  //       return ListView.builder(
  //         itemCount: myData == null ? 0 : myData.length,
  //         itemBuilder: (BuildContext context, int index) {
  //           return Card(
  //             child: Text(myData[index]['firstName']),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
  Widget _build() {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
              height: 160,
              child: Column(
                children: [
                  Container(
                      height: 170,
                      width: 180,
                      child: Image.network(
                        data[index].image,
                        fit: BoxFit.cover,
                      )),
                  Text(
                    data[index].id + " " + data[index].firstName,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(providerState.uid),
      ),
      body: data != null ? _build() : CircularProgressIndicator(),
    );
  }
}
