import 'package:meta/meta.dart';

final demoPlayList = new DemoPlayList(
  songs: [
    new DemoSong(
      audioUrl:'http://api.soundcloud.com/tracks/67383567/stream?client_id=3cQaPshpEeLqMsNFAUw1Q',
      albumArtUrl:'https://i.amz.mshcdn.com/h9L3aQ3E8Yf6aeoVdTySccCQmmc=/fit-in/1200x9600/https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com%2Fuploads%2Fcard%2Fimage%2F339018%2Fcf616a1b-9ff6-4444-a449-5f9e3ad327fa.jpg',
      songTitle:'',
      artist:'',
      ),
    new DemoSong(
      audioUrl:'assets/songs/intro.mp3',
      albumArtUrl:'https://i.amz.mshcdn.com/h9L3aQ3E8Yf6aeoVdTySccCQmmc=/fit-in/1200x9600/https%3A%2F%2Fblueprint-api-production.s3.amazonaws.com%2Fuploads%2Fcard%2Fimage%2F339018%2Fcf616a1b-9ff6-4444-a449-5f9e3ad327fa.jpg',
      songTitle:'',
      artist:'',
      ),

    new DemoSong(
      audioUrl:'http://api.soundcloud.com/tracks/9540352/stream?secret_token=s-tj3IS&cli',
      albumArtUrl:'',
      songTitle:'',
      artist:'',
  ),

    new DemoSong(
      audioUrl:'http://api.soundcloud.com/tracks/434370309/stream?secret_token=s-tj3IS&cli',
      albumArtUrl:'',
      songTitle:'',
      artist:'',
      ),
  ],
);

class DemoPlayList
{
  final List<DemoSong> songs;

  DemoPlayList({
    @required this.songs,
});
}

class DemoSong{
  final String audioUrl;
  final String albumArtUrl;
  final String songTitle;
  final String artist;

  DemoSong({
    @required this.audioUrl,
    @required this.albumArtUrl,
    @required this.songTitle,
    @required this.artist,
});
}