import 'package:flutter/material.dart';
import 'package:reagenda/widgets/user_tile.dart';

class UsersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.white),
              hintText: "Pesquisar",
              icon: Icon(Icons.search, color: Colors.white,),
              border: InputBorder.none,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index){
                return Container();//UserTile();
              },
              separatorBuilder: (context, index){
                return Divider();
              },
              itemCount: 5),
        ),
      ],
    );
  }
}
