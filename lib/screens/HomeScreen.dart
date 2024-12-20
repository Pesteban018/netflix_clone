import 'package:flutter/material.dart';
import 'package:netflix_demo/screens/ProfileScreen.dart';
import '../data/data.dart';
import 'DetailScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void _onSelected(BuildContext context, int item) {
  AppUser currentUser = AppUser(
    name: 'Nombre de Usuario',
    email: 'usuario@correo.com',
    profileImageUrl: 'assets/neflixPPjpg',
  );

  switch (item) {
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(user: currentUser)),
      );
      break;
    case 2:
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      break;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Container(
          height: 40,
          child: Image.asset('assets/netflixLogo.png'),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            icon: Container(
              padding: EdgeInsets.all(10),
              height: 40,
              child: Image.asset('assets/neflixPP.jpg'),
            ),
            onSelected: (item) => _onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Perfil 1')),
              PopupMenuItem<int>(value: 1, child: Text('Perfil 2')),
              PopupMenuItem<int>(value: 2, child: Text('Logout')),
            ],
          ),
        ],
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: mainList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        MovieOrSeries movieOrSeries = mainList[index];
                        return GestureDetector(
                          child: Container(
                            height: 150,
                            width: 220,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(movieOrSeries.coverUrl),
                                )),
                          ),
                          onTap: () {},
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Continue watching',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: continueWatching.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        MovieOrSeries movieOrSeries = continueWatching[index];
                        return GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Stack(
                              children: [
                                Container(
                                  height: 300,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            AssetImage(movieOrSeries.coverUrl),
                                      )),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      color: Color.fromARGB(77, 0, 0, 0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'play',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.play_circle_filled,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  bottom: 35,
                                  right: 0,
                                  left: 0,
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 4,
                                  ),
                                ),
                                const Positioned(
                                  bottom: 35,
                                  right: 40,
                                  left: 0,
                                  child: Divider(
                                    color: Colors.red,
                                    thickness: 4,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'My List',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: myList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        MovieOrSeries movieOrSeries = myList[index];
                        return GestureDetector(
                          child: Container(
                            height: 300,
                            width: 150,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(movieOrSeries.coverUrl),
                                )),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  movieOrSeries: movieOrSeries,
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
