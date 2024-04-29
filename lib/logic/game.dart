class Game {
  static final boardLength = 9;
  static const String path = './assets/';
  static const String playerO = path +'gunni.png';
  static const String playerX = path + 'hjalti.png';
  static const String tieIcon = path + 'skuli.png';
  String currentPlayerIcon = playerO;
  String winner = '';
  int turnCounter = 0;
  bool currentPlayer = true;
  bool isTie = false;
  // - Game
  bool gameOver = false;
  game(index) {
    if (!gameOver && this.board[index].isEmpty) {
      turnCounter++;
        this.board[index] = currentPlayerIcon;
      if (isWinner() != false) {
        this.turn();
      }
        if (turnCounter == 9 && winner == '') {
          isTie = true;
      }
    }
  }
  turn() {
    currentPlayerIcon = currentPlayerIcon == playerO ? playerX : playerO ;
  }
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  isWinner() {
    List<List<int>> winningpos = [[0,1,2],[3,4,5]];
    for (var pos in winningpos) {
      if (board[pos[0]].isNotEmpty &&
      board[pos[0]] == board[pos[1]] &&
          board[pos[1]] == board[pos[2]]
      ) {
        winner = currentPlayerIcon;
        gameOver = true;
      }
    }
    return !this.gameOver;
  }
}
