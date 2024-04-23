import 'dart:convert';
import 'package:apidata3/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ApiState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ApiState();
  }
}

class _ApiState extends State<ApiState> {

  List<Userclass> datauserList = [];

  Future<List<Userclass>> getDatauser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> a in data) {
        datauserList.add(Userclass.fromJson(a));
      }
      return datauserList;
    } else {
      return datauserList;
    }
  }

  late String valuess ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Id Card ")),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getDatauser(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                    itemCount: datauserList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Text('Body DESCRIPIONS  \n' + datauserList[index].body.toString()),
                              Text( 'name : '+   snapshot.data![index].name.toString()),
                              Text( 'username : '+   snapshot.data![index].username.toString()),
                              Text( 'email : '+   snapshot.data![index].email.toString()),
                              Text( 'adress : '+   snapshot.data![index].address.toString()),

                              // ReusbaleRow( 'name : '+   snapshot.data![index].name.toString()),


                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
