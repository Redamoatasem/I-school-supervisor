import 'package:flutter/material.dart';

import '../shared/constant.dart';
class Notifications extends StatelessWidget {
  const Notifications({super.key});
  static const String routeName = 'notification';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: secondryColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back,color: Colors.white,),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text('Notification',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              centerTitle: true,
            ),
            body: Padding(padding: EdgeInsets.all(5,),child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/first_photo.png'),
                    Column(
                      children: [
                        Text('The School Administration',style: TextStyle(color: Colors.white,fontSize: 17.5,),),
                        Text('It will reach the child within 3 minutes                     ',style: TextStyle(color: Colors.white,fontSize: 8.9,),),
                      ],
                    ),
                    Text(' 1m ago.',style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Image.asset('assets/second_photo.png'),
                    Column(
                      children: [
                        Text('The School Administration',style: TextStyle(color: Colors.white,fontSize: 17.5,),),
                        Text('It will reach the child within 3 minutes                     ',style: TextStyle(color: Colors.white,fontSize: 8.9,),),
                      ],
                    ),
                    Text('  1m ago.',style: TextStyle(color: Colors.grey),)
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Image.asset('assets/third_photo.png'),
                    Column(
                      children: [
                        Text('The School Administration',style: TextStyle(color: Colors.white,fontSize: 17.5,),),
                        Text('It will reach the child within 3 minutes                     ',style: TextStyle(color: Colors.white,fontSize: 8.9,),),
                      ],
                    ),
                    Text('  1m ago.',style: TextStyle(color: Colors.grey),)
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Image.asset('assets/forth_photo.png'),
                    Column(
                      children: [
                        Text('The School Administration',style: TextStyle(color: Colors.white,fontSize: 17.5,),),
                        Text('It will reach the child within 3 minutes                     ',style: TextStyle(color: Colors.white,fontSize: 8.9,),),
                      ],
                    ),
                    Text('  10 Hrs ago.',style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Image.asset('assets/fifth_photo.png'),
                    Column(
                      children: [
                        Text('The School Administration',style: TextStyle(color: Colors.white,fontSize: 17.5,),),
                        Text('It will reach the child within 3 minutes                     ',style: TextStyle(color: Colors.white,fontSize: 8.9,),),
                      ],
                    ),
                    Text('  15 Hrs ago.',style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ],
            ),),
          ),
        ],
      ),
    );
  }
}
