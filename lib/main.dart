import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GomokuViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gomoku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GomokuGame(),
    );
  }
}

class GomokuGame extends StatelessWidget {
  const GomokuGame({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GomokuViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gomoku'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: GomokuViewModel.boardSize,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemCount:
                      GomokuViewModel.boardSize * GomokuViewModel.boardSize,
                  itemBuilder: (context, index) {
                    final row = index ~/ GomokuViewModel.boardSize;
                    final col = index % GomokuViewModel.boardSize;
                    final cell = viewModel.board[row][col];
                    final isWinningCell = viewModel.winningCells
                        .any((cell) => cell[0] == row && cell[1] == col);
                    return GomokuCell(
                      cell: cell,
                      onTap: () => viewModel.makeMove(row, col),
                      isWinningCell: isWinningCell,
                    );
                  },
                ),
              ),
            ),
          ),
          Text(
            viewModel.winner != null
                ? 'Winner: ${viewModel.winner}'
                : 'Current Player: ${viewModel.currentPlayer}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: viewModel.resetGame,
            child: const Text('Reset Game'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class GomokuCell extends StatelessWidget {
  final String cell;
  final VoidCallback onTap;
  final bool isWinningCell;

  const GomokuCell({
    super.key,
    required this.cell,
    required this.onTap,
    required this.isWinningCell,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isWinningCell
            ? Colors.yellow
            : cell == 'X'
                ? Colors.blue
                : cell == 'O'
                    ? Colors.green
                    : Colors.grey,
        child: Center(
          child: Text(
            cell,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
