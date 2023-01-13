import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
bool oTurn = true;

// 1st player is O
List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
int oScore = 0;
int xScore = 0;
int filledBoxes = 0;

@override
Widget build(BuildContext context) {
	return Scaffold(
	backgroundColor: Color.fromARGB(255, 0, 0, 48),
	body: Column(
		children: <Widget>[
		Expanded(
      
			flex: 4,
			child: GridView.builder(
				itemCount: 9,
				gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
					crossAxisCount: 3),
				itemBuilder: (BuildContext context, int index) {
				return GestureDetector(
					onTap: () {
					_tapped(index);
					},
					child: Container(
					decoration: BoxDecoration(
						border: Border.all(color: Colors.white)),
					child: Center(
						child: Text(
						displayElement[index],
						style: TextStyle(color: Colors.white, fontSize: 35),
						),
					),
					),
				);
				}),
		),
		Expanded(
			child: Container(
			child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
				Padding(
					padding: const EdgeInsets.all(30.0),
					child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(
						'Player X',
						style: TextStyle(fontSize: 20,
										fontWeight: FontWeight.bold,
										color: Colors.white),
						),
						Text(
						xScore.toString(),
						style: TextStyle(fontSize: 20,color: Colors.white),
						),
					],
					),
				),
				Padding(
					padding: const EdgeInsets.all(30.0),
					child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text('Player O', style: TextStyle(fontSize: 20,
														fontWeight: FontWeight.bold,
														color: Colors.white)
						),
						Text(
						oScore.toString(),
						style: TextStyle(fontSize: 20,color: Colors.white),
						),
					],
					),
				),
				],
			),
			),
		),
		Expanded(
			child: Container(
			child: Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				ElevatedButton(
				style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[50]),
				onPressed: _clearScoreBoard,
				child: Text("Clear Score Board",style: TextStyle(color: Colors.black),),
				),
			],
			),
		))
		],
	),
	);
}

void _tapped(int index) {
	setState(() {
	if (oTurn && displayElement[index] == '') {
		displayElement[index] = 'O';
		filledBoxes++;
	} else if (!oTurn && displayElement[index] == '') {
		displayElement[index] = 'X';
		filledBoxes++;
	}

	oTurn = !oTurn;
	_checkWinner();
	});
}

void _checkWinner() {
	
	// Checking rows
	if (displayElement[0] == displayElement[1] &&
		displayElement[0] == displayElement[2] &&
		displayElement[0] != '') {
	_showWinDialog(displayElement[0]);
	}
	if (displayElement[3] == displayElement[4] &&
		displayElement[3] == displayElement[5] &&
		displayElement[3] != '') {
	_showWinDialog(displayElement[3]);
	}
	if (displayElement[6] == displayElement[7] &&
		displayElement[6] == displayElement[8] &&
		displayElement[6] != '') {
	_showWinDialog(displayElement[6]);
	}

	// Checking Column
	if (displayElement[0] == displayElement[3] &&
		displayElement[0] == displayElement[6] &&
		displayElement[0] != '') {
	_showWinDialog(displayElement[0]);
	}
	if (displayElement[1] == displayElement[4] &&
		displayElement[1] == displayElement[7] &&
		displayElement[1] != '') {
	_showWinDialog(displayElement[1]);
	}
	if (displayElement[2] == displayElement[5] &&
		displayElement[2] == displayElement[8] &&
		displayElement[2] != '') {
	_showWinDialog(displayElement[2]);
	}

	// Checking Diagonal
	if (displayElement[0] == displayElement[4] &&
		displayElement[0] == displayElement[8] &&
		displayElement[0] != '') {
	_showWinDialog(displayElement[0]);
	}
	if (displayElement[2] == displayElement[4] &&
		displayElement[2] == displayElement[6] &&
		displayElement[2] != '') {
	_showWinDialog(displayElement[2]);
	} else if (filledBoxes == 9) {
	_showDrawDialog();
	}
}

void _showWinDialog(String winner) {
	showDialog(
		barrierDismissible: false,
		context: context,
		builder: (BuildContext context) {
		return AlertDialog(
			title: Text("\" " + winner + " \" is Winner!!!"),
			actions: [
			ElevatedButton(
				child: Text("Play Again"),
				onPressed: () {
				_clearBoard();
				Navigator.of(context).pop();
				},
			)
			],
		);
		});

	if (winner == 'O') {
	oScore++;
	} else if (winner == 'X') {
	xScore++;
	}
}

void _showDrawDialog() {
	showDialog(
		barrierDismissible: false,
		context: context,
		builder: (BuildContext context) {
		return AlertDialog(
			title: Text("Draw"),
			actions: [
			ElevatedButton(
				child: Text("Play Again"),
				onPressed: () {
				_clearBoard();
				Navigator.of(context).pop();
				},
			)
			],
		);
		});
}

void _clearBoard() {
	setState(() {
	for (int i = 0; i < 9; i++) {
		displayElement[i] = '';
	}
	});

	filledBoxes = 0;
}

void _clearScoreBoard() {
	setState(() {
	xScore = 0;
	oScore = 0;
	for (int i = 0; i < 9; i++) {
		displayElement[i] = '';
	}
	});
	filledBoxes = 0;
}
}
