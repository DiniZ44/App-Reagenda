import 'package:flutter/material.dart';
import 'package:reagenda/screens/users_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.yellowAccent.withAlpha(120),
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: Colors.white54)
          )
        ),
        child: BottomNavigationBar(
          currentIndex: _page,
          onTap: (p) {
          _pageController.animateToPage(
              p,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.recent_actors),
              title: Text ("Agenda"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text ("Clientes"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text ("Serviços"),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (p){
            setState(() {
              _page = p;
            });
          },
          children: <Widget>[
            UsersScreen(),
            Container(color: Colors.green,),
            Container(color: Colors.teal,),

          ],
        ),
      ),
    );
  }
}


