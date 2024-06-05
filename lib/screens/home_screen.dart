// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTrunO = false;

  List<String> xOroList = ['', '', '', '', '', '', '', '', ''];
  bool gameHasResult = false;
  int filledBoxes = 0;
  int scoreX = 0;
  int scoreO = 0;
  String winnerTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                clearGame();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
        title: Text(
          'TicTacToe',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            getScoreBoard(),
            SizedBox(
              height: 40,
            ),
            getResultButton(),
            getgrid(),
            getTrun(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget getScoreBoard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player O',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '$scoreO',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Player X',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '$scoreX',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget getgrid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  xOroList[index],
                  style: TextStyle(
                    fontSize: 40,
                    color: xOroList[index] == 'X' ? Colors.white : Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapped(int index) {
    print('tapped $index');
    setState(() {
      if (xOroList[index] == '') {
        if (isTrunO) {
          xOroList[index] = 'O';
          filledBoxes = filledBoxes + 1;
        } else {
          xOroList[index] = 'X';
          filledBoxes = filledBoxes + 1;
        }
        isTrunO = !isTrunO;
      }

      // isTrunO = !isTrunO;

      checkWinner();
    });
  }

  void checkWinner() {
    // Rows
    if (xOroList[0] == xOroList[1] &&
        xOroList[0] == xOroList[2] &&
        xOroList[0] != '') {
      print('winner is ' + xOroList[0]);
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[3] == xOroList[4] &&
        xOroList[3] == xOroList[5] &&
        xOroList[3] != '') {
      print('winner is ' + xOroList[3]);
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[6] == xOroList[7] &&
        xOroList[6] == xOroList[8] &&
        xOroList[6] != '') {
      print('winner is ' + xOroList[6]);
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    // Column
    if (xOroList[0] == xOroList[3] &&
        xOroList[0] == xOroList[6] &&
        xOroList[0] != '') {
      print('winner is ' + xOroList[0]);
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[1] == xOroList[4] &&
        xOroList[1] == xOroList[7] &&
        xOroList[1] != '') {
      print('winner is ' + xOroList[0]);
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[2] == xOroList[5] &&
        xOroList[2] == xOroList[8] &&
        xOroList[2] != '') {
      print('winner is ' + xOroList[0]);
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    //X
    if (xOroList[0] == xOroList[4] &&
        xOroList[0] == xOroList[8] &&
        xOroList[0] != '') {
      print('winner is ' + xOroList[0]);
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[2] == xOroList[4] &&
        xOroList[2] == xOroList[6] &&
        xOroList[2] != '') {
      print('winner is ' + xOroList[0]);
      setResult(xOroList[0], 'winner is ' + xOroList[0]);
      return;
    }

    if (filledBoxes == 9) {
      print('game is end ');
    }
  }

  void setResult(String winner, String title) {
    setState(() {
      gameHasResult = true;
      winnerTitle = title;
      if (winner == 'X') {
        scoreX++;
      } else if (winner == 'O') {
        scoreO++;
      } else {
        scoreO = scoreO;
        scoreX = scoreX;
      }
    });
  }

  Widget getResultButton() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
          color: Colors.white,
        )),
        onPressed: () {
          setState(() {
            gameHasResult = false;
            clearGame();
          });
        },
        child: Text(
          '$winnerTitle',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }

  Widget getTrun() {
    return Text(
      isTrunO ? 'trun O' : 'trun X',
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  void clearGame() {
    setState(() {
      for (var i = 0; i < xOroList.length; i++) {
        xOroList[i] = '';
      }
    });

    filledBoxes = 0;
  }
}
