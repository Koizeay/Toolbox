import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toolbox/core/dialogs.dart';
import 'package:toolbox/gen/strings.g.dart';

class GameOfLifePage extends StatefulWidget {
  const GameOfLifePage({Key? key}) : super(key: key);

  @override
  State<GameOfLifePage> createState() => _GameOfLifePage();
}

class _GameOfLifePage extends State<GameOfLifePage> {
  late List<List<bool>> grid;
  int _gridSize = 10;

  int _waitTime = 500;

  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    initializeGrid();
  }

  void initializeGrid() {
    grid = List.generate(_gridSize, (i) => List<bool>.filled(_gridSize, false));
  }

  void updateGrid() {
    List<List<bool>> newGrid = List.generate(_gridSize, (i) => List<bool>.filled(_gridSize, false));

    for (int i = 0; i < _gridSize; i++) {
      for (int j = 0; j < _gridSize; j++) {
        int neighbors = countNeighbors(i, j);
        if (grid[i][j]) {
          newGrid[i][j] = neighbors == 2 || neighbors == 3;
        } else {
          newGrid[i][j] = neighbors == 3;
        }
      }
    }

    if (mounted) {
      setState(() {
        grid = newGrid;
      });
    }
  }

  int countNeighbors(int row, int col) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        int newRow = row + i;
        int newCol = col + j;
        if (newRow >= 0 && newRow < _gridSize && newCol >= 0 && newCol < _gridSize) {
          if (grid[newRow][newCol]) {
            count++;
          }
        }
      }
    }
    return count;
  }

  void startOrStopSimulation() {
    if (!stillAliveCells() && mounted) {
      showOkTextDialog(
          context,
          t.tools.gameoflife.error.no_alive_cells,
          t.tools.gameoflife.error.no_alive_cells_description
      );
      return;
    }
    _isRunning = !_isRunning;
    if (_isRunning) {
      Future.doWhile(() async {
        await Future.delayed(Duration(milliseconds: _waitTime));
        updateGrid();
        if (!stillAliveCells() && mounted) {
          setState(() {
            _isRunning = false;
          });
        }
        return _isRunning;
      });
    }
  }

  bool stillAliveCells() {
    bool isAlive = false;
    for (int i = 0; i < _gridSize; i++) {
      for (int j = 0; j < _gridSize; j++) {
        if (grid[i][j]) {
          isAlive = true;
          break;
        }
      }
    }
    return isAlive;
  }

  void randomizeGrid() {
    if (_isRunning) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.tools.gameoflife.error.please_stop_simulation),
          duration: const Duration(seconds: 1),
        ),
      );
      return;
    }
    final random = Random();
    for (int i = 0; i < _gridSize; i++) {
      for (int j = 0; j < _gridSize; j++) {
        grid[i][j] = random.nextBool();
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  void showGridSizeDialog() {
    if (_isRunning) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.tools.gameoflife.error.please_stop_simulation),
          duration: const Duration(seconds: 1),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, _setState) => AlertDialog(
            title: Text(t.tools.gameoflife.grid_size),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(t.tools.gameoflife.current_size_is_x(size: _gridSize.toString())),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: _gridSize > 5 ? () {
                        if (_gridSize > 5) {
                          _setState(() {
                            _gridSize--;
                          });
                          setState(() {
                            initializeGrid();
                          });
                        }
                      } : null,
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: _gridSize < 20 ? () {
                        if (_gridSize < 20) {
                            _setState(() {
                              _gridSize++;
                            });
                            setState(() {
                              initializeGrid();
                            });
                        }
                      } : null,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(t.generic.cancel),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("${t.generic.app_name} - ${t.tools.gameoflife.title}"),
          actions: [
            IconButton(
              onPressed: () {
                showGridSizeDialog();
              },
              icon: const Icon(Icons.grid_on),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      for (int i = 0; i < _gridSize; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int j = 0; j < _gridSize; j++)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    grid[i][j] = !grid[i][j];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: grid[i][j] ? Theme.of(context).colorScheme.primary : Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    ),
                                  ),
                                  width: (MediaQuery.of(context).size.width - 16) / _gridSize,
                                  height: (MediaQuery.of(context).size.width - 16) / _gridSize,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            const SizedBox(width: 5,),
                            Text(t.tools.gameoflife.waiting, textAlign: TextAlign.center,),
                            const SizedBox(width: 5,),
                            Expanded(
                              child: Slider(
                                value: _waitTime.toDouble(),
                                onChanged: (value) {
                                  setState(() {
                                    _waitTime = value.toInt();
                                  });
                                },
                                onChangeEnd: (value) {
                                  if (_isRunning) {
                                    startOrStopSimulation();
                                  }
                                },
                                min: 100,
                                max: 1000,
                                divisions: 9,
                                label: "$_waitTime ms",
                              ),
                            ),
                          ],
                        )
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            startOrStopSimulation();
                          },
                          child: Text(
                            _isRunning
                                ? t.tools.gameoflife.stop_simulation
                                : t.tools.gameoflife.start_simulation,
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            setState(() {
                              randomizeGrid();
                            });
                          },
                          child: Text(
                            t.tools.gameoflife.randomize_grid,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            setState(() {
                              if (_isRunning) {
                                startOrStopSimulation();
                              }
                              initializeGrid();
                            });
                          },
                          child: Text(
                            t.tools.gameoflife.clear_grid,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
