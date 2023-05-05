import 'package:mume_music_player_app/models/artists_model.dart';
import 'package:mume_music_player_app/models/music_model.dart';

List recentlyPlayed = [
  MusicModel(
      imageUrl: 'assets/images/shades-of-love.jpeg',
      musicName: 'Shades of Love - Anna Szarmach'),
  MusicModel(
      imageUrl: 'assets/images/without-you.jpeg',
      musicName: 'Without You - The Kid LAROI'),
  MusicModel(
      imageUrl: 'assets/images/save-your-tears.jpeg',
      musicName: 'Save Your Tears - The Weeknd')
];

List artistsList = [
  ArtistsModel('01:25:43 mins',
      imageUrl: 'assets/images/ariana.jpeg',
      artistName: 'Ariana Grande',
      songs: [
        MusicModel(
            imageUrl: 'assets/images/shades-of-love.jpeg',
            musicName: 'Bang Bang'),
        MusicModel(
            imageUrl: 'assets/images/without-you.jpeg',
            musicName: 'The Light is Coming'),
        MusicModel(
            imageUrl: 'assets/images/save-your-tears.jpeg',
            musicName: 'Dangerous Woman')
      ]),
  ArtistsModel('01:25:43 mins',
      imageUrl: 'assets/images/the-weeknd.jpeg',
      artistName: 'The Weeknd',
      songs: [
        MusicModel(
            imageUrl: 'assets/images/shades-of-love.jpeg',
            musicName: 'Bang Bang'),
        MusicModel(
            imageUrl: 'assets/images/without-you.jpeg',
            musicName: 'The Light is Coming'),
        MusicModel(
            imageUrl: 'assets/images/save-your-tears.jpeg',
            musicName: 'Dangerous Woman')
      ]),
  ArtistsModel('01:25:43 mins',
      imageUrl: 'assets/images/acidrap.jpeg',
      artistName: 'Acidrap',
      songs: [
        MusicModel(
            imageUrl: 'assets/images/shades-of-love.jpeg',
            musicName: 'Bang Bang'),
        MusicModel(
            imageUrl: 'assets/images/without-you.jpeg',
            musicName: 'The Light is Coming'),
        MusicModel(
            imageUrl: 'assets/images/save-your-tears.jpeg',
            musicName: 'Dangerous Woman')
      ])
];
