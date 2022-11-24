import 'package:api_kullanimi/users_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DetailScreen.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<UserModel>> _userModel; //_getData()
  Map<String, dynamic> _user = {}; //_getDataWithId()

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _userModel = _getData();

    //_getDataWithId(5);
  }

  Future<List<UserModel>> _getData() async {
    //tüm verileri getirir
    List<UserModel> userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    return Future.value(userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Kişilerim'),
          elevation: 15,
          backgroundColor: Colors.red,
          shadowColor: Colors.black,
          leading: const Icon(Icons.account_box)),
      body: FutureBuilder<List<UserModel>>(
        future: _userModel,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<UserModel>? userList = snapshot.data;
              return ListView.builder(
                  itemCount: userList?.length,
                  itemBuilder: (context, index) {
                    final UserModel item = userList![index];
                    return Dismissible(
                      key: ValueKey(item),
                      onDismissed: (direction) async {
                        setState(() {
                          var silinen = userList.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('${silinen.name} silindi')));
                        });
                      },
                      background: Container(color: Colors.red),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: const Icon(Icons.account_circle_outlined,
                              color: Colors.red),
                          title: Text(userList[index].name.toString()),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(user: userList[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  });
            }
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
