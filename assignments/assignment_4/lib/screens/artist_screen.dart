import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mume_music_player_app/constants/color_constants.dart';

class ArtistScreen extends StatefulWidget {
  final String imageUrl;
  final String artistName;
  final List songs;

  const ArtistScreen(
      {Key? key,
      required this.imageUrl,
      required this.artistName,
      required this.songs})
      : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Set the custom icon here
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              CupertinoIcons.search,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: 20.0, top: 10, left: 10, bottom: 10),
            child: Icon(
              CupertinoIcons.ellipsis_circle,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.asset(
                widget.imageUrl,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.artistName,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontFamily: montreal,
                  letterSpacing: 2),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('1 Album  |  20 Songs  |  01:25:43 mins'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.songs.shuffle();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                    elevation: 8.0,
                    shadowColor: primaryColor.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.shuffle),
                      SizedBox(width: 8.0),
                      Text(
                        "Shuffle",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.play_arrow,
                            size: 10.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        "Play",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Songs',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: ''),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: widget.songs.length,
                itemBuilder: (BuildContext context, int index) {
                  final song = widget.songs[index];
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            song.imageUrl,
                            width: 64.0,
                            height: 64.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.musicName,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(widget.artistName),
                            ],
                          ),
                        ),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.play_arrow,
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
