import 'package:flutter/material.dart';
import 'package:mume_music_player_app/constants.dart';

class ArtistScreen extends StatelessWidget {
  final imageUrl;
  final artistName;
  final songs;

  const ArtistScreen(
      {Key? key, required this.imageUrl, required this.artistName, this.songs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.asset(
                imageUrl,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              artistName,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600,fontFamily: 'Montreal Serial',letterSpacing: 2),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('1 Album | 20 Songs | 01:25:43 mins'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
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
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform play action
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                    elevation: 0,
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFFFF3E8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.play_arrow,
                            size: 10.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
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
            SizedBox(
              height: 10,
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (BuildContext context, int index) {
                  final song = songs[index];
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
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.musicName,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(artistName),
                            ],
                          ),
                        ),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.play_arrow,
                              size: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert),
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