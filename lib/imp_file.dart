import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
class ImpFile extends StatefulWidget {
  const ImpFile({ Key? key }) : super(key: key);

  @override
  State<ImpFile> createState() => _ImpFileState();
}

class _ImpFileState extends State<ImpFile> {
  List _items=[];
  bool isPressed=false;
  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/data.json");
  // var response= await DefaultAssetBundle.of(context).loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Json file'),
        ),
        body: Padding(padding: const EdgeInsets.all(10),
        
        child: Column(          
          children: [
             ElevatedButton(
              child: const Text('Load Data'),
              onPressed: readJson),
             _items.isNotEmpty
                ? Flexible(
                    child: ListView.builder(
                          itemCount: _items.length,
                          itemBuilder: (context, index) {                          
                            return Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                leading: Text(_items[index]["id"]),
                                title: Text(_items[index]["name"]),
                                subtitle: Text(_items[index]["description"]),
                              ),
                            );
                          },
                        ),
                  )
                
                  
                : Container(),
              
              
          ],
        ),
        ),
        ),
    );
  }
}