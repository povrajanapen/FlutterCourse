
class Joke {
  final String title;
  final String description;

  Joke({required this.title, required this.description});
}

final List<Joke> jokes = List.generate(20, 
(index) => Joke
(title: "Joke ${index+1}",
description: "Joke description ${index+1}"));