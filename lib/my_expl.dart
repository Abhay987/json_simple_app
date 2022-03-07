import 'package:flutter/material.dart';
import 'dart:convert';
class JsnFile extends StatelessWidget {
  const JsnFile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/file.json'),
          builder: (context,snapshot){
            var mydata=json.decode(snapshot.data.toString());
            if(mydata==null)
            {
               return const Center(
              child: Text('Loading',style: TextStyle(fontSize: 30)),
            );
            }
            else{            
               return Center(
                 child: Text(mydata["name"],style: const TextStyle(fontSize: 30)),
               );
             
            }
            
          }
        ),
      ),
    );
  }
}