import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mume_music_player_app/dummy_data.dart';
import 'package:mume_music_player_app/screens/artist_screen.dart';
import 'package:mume_music_player_app/screens/home_screen/widgets/custom_header_list_view.dart';
import 'package:mume_music_player_app/screens/home_screen/widgets/custom_list_view.dart';

import '../../constants/color_constants.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              CupertinoIcons.music_note_2,
              color: primaryColor,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              "Mume",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  fontFamily: toronto),
            )
          ],
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              CupertinoIcons.search,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Column(
            children: [
              PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 3.0,
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
              const SizedBox(
                height: 20,
              ),
              const CustomHeaderListView(headerText: 'Recently Played'),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recentlyPlayed.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomListView(
                      imageUrl: recentlyPlayed[index].imageUrl,
                      musicName: recentlyPlayed[index].musicName,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomHeaderListView(headerText: 'Artists'),
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
                            const SizedBox(height: 8.0),
                            Text(
                              artist.artistName,
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const CustomHeaderListView(headerText: 'Most Played'),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recentlyPlayed.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomListView(
                      imageUrl: recentlyPlayed[index].imageUrl,
                      musicName: recentlyPlayed[index].musicName,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
