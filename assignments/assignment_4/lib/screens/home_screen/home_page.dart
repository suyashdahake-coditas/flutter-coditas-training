import 'package:flutter/material.dart';
import 'package:mume_music_player_app/dummyData.dart';
import 'package:mume_music_player_app/screens/artist_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: const [
                Tab(text: 'Suggested'),
                Tab(text: 'Songs'),
                Tab(text: 'Artist'),
                Tab(text: 'Albums'),
                Tab(text: 'Favorites'),
              ],
            ),
          ),
          Container(
            height: 2.0,
            color: Colors.grey[300], // set unselected indicator color
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recently Played',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: ''),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentlyPlayed.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 115.0,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 115.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage(recentlyPlayed[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        recentlyPlayed[index].musicName,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Artists',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: ''),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artistsList.length,
              itemBuilder: (BuildContext context, int index) {
                final artist = artistsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArtistScreen(
                              songs: artist.songs,
                              imageUrl: artist.imageUrl,
                              artistName: artist.artistName)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55.0,
                          backgroundImage: AssetImage(artist.imageUrl),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          artist.artistName,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
