// OOPs Assignment - Tennis Match

// To be solved in dartpad.

// 1. Create a class Player which has the attributes- name (String), score (int) and skill (int).
// 2. Create an abstract class Tournament which has two methods - play and displayScores.
// 3. After that, create a class MatchOne which extends Tournament.
// 4. MatchOne has two attributes- playerOne and playerTwo both of type Player initialized through the constructor.
// 5. Override the required methods in MathcOne. The displayScoresmethod prints the score of playerOne and playerTwo.
// 6. In the play method, playerOne’s skill is added to his existing score. Same thing is repeated for playerTwo.
// 7. During execution, initialize the MatchOne with the required attributes. Call the match function twice and print the scores.


class Player {
  String name;
  int skill;
  int score;

  Player({
    required this.name,
    required this.skill,
    required this.score,
  });
}

abstract class Tournament {
  void play() {}

  void displayScore() {}
}

class MatchOne extends Tournament {
  Player playerOne;
  Player playerTwo;

  MatchOne({
    required this.playerOne,
    required this.playerTwo,
  });

  @override
  void displayScore() {
    print(playerOne.score);
    print(playerTwo.score);
  }

  @override
  void play() {
    playerOne.score = playerOne.score + playerOne.skill;
    playerTwo.score = playerTwo.score + playerTwo.skill;
  }
}

void main() {
  MatchOne match1 = MatchOne(
      playerOne: Player(name: 'Suyash', skill: 20, score: 0),
      playerTwo: Player(name: 'Kunal', skill: 5, score: 0));
  match1.displayScore();
  match1.play();
  match1.displayScore();
  match1.play();
  match1.displayScore();
  match1.play();
  match1.displayScore();
}