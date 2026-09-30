void main() {
  List<String> songs = ["Song A", "Song B", "Song C", "Song D", "Song E"];
  print("Initial list: $songs");

  songs.add("Song F");
  print("After add: $songs");

  songs.remove("Song A");
  print("After remove: $songs");

  songs.sort();
  print("After sort: $songs");
}
