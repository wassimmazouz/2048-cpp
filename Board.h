#pragma once
#include <vector>
#include <iostream>

enum class Direction { UP, DOWN, LEFT, RIGHT };

class Board {
public:
    Board();
    void init();
    void print() const;
    bool move(Direction dir);
    bool isGameOver() const;
    bool isGameWon() const;
    int getScore() const;

private:
    static const int SIZE = 4;
    int grid[SIZE][SIZE];
    int score;

    void spawnTile();
    bool canMove() const;
    // Helper functions for movement logic
    void rotate();
    bool slideAndMerge();
};
