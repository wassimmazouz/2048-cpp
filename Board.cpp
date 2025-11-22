#include "Board.h"
#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <ctime>
#include <algorithm>

Board::Board() : score(0) {
    std::srand(static_cast<unsigned int>(std::time(nullptr)));
    init();
}

void Board::init() {
    for (int i = 0; i < SIZE; ++i) {
        for (int j = 0; j < SIZE; ++j) {
            grid[i][j] = 0;
        }
    }
    score = 0;
    spawnTile();
    spawnTile();
}

void Board::spawnTile() {
    std::vector<std::pair<int, int>> emptyCells;
    for (int i = 0; i < SIZE; ++i) {
        for (int j = 0; j < SIZE; ++j) {
            if (grid[i][j] == 0) {
                emptyCells.push_back({i, j});
            }
        }
    }

    if (!emptyCells.empty()) {
        int index = std::rand() % emptyCells.size();
        int value = (std::rand() % 10 == 0) ? 4 : 2; // 10% chance for 4
        grid[emptyCells[index].first][emptyCells[index].second] = value;
    }
}

void Board::print() const {
    std::cout << "Score: " << score << "\n\n";
    for (int i = 0; i < SIZE; ++i) {
        std::cout << "+------+------+------+------+\n";
        for (int j = 0; j < SIZE; ++j) {
            std::cout << "| ";
            if (grid[i][j] == 0) {
                std::cout << "    ";
            } else {
                std::cout << std::setw(4) << grid[i][j];
            }
            std::cout << " ";
        }
        std::cout << "|\n";
    }
    std::cout << "+------+------+------+------+\n";
}

// Rotate the board 90 degrees clockwise
void Board::rotate() {
    int newGrid[SIZE][SIZE];
    for (int i = 0; i < SIZE; ++i) {
        for (int j = 0; j < SIZE; ++j) {
            newGrid[j][SIZE - 1 - i] = grid[i][j];
        }
    }
    for (int i = 0; i < SIZE; ++i) {
        for (int j = 0; j < SIZE; ++j) {
            grid[i][j] = newGrid[i][j];
        }
    }
}

// Slide and merge tiles to the left
bool Board::slideAndMerge() {
    bool changed = false;
    for (int i = 0; i < SIZE; ++i) {
        // 1. Slide non-zero to left
        int temp[SIZE] = {0};
        int pos = 0;
        for (int j = 0; j < SIZE; ++j) {
            if (grid[i][j] != 0) {
                temp[pos++] = grid[i][j];
            }
        }

        // 2. Merge
        for (int j = 0; j < pos - 1; ++j) {
            if (temp[j] == temp[j + 1]) {
                temp[j] *= 2;
                score += temp[j];
                temp[j + 1] = 0;
                // Slide everything after merge
                for (int k = j + 1; k < pos - 1; ++k) {
                    temp[k] = temp[k + 1];
                }
                temp[pos - 1] = 0;
                pos--;
            }
        }

        // 3. Check for changes and update row
        for (int j = 0; j < SIZE; ++j) {
            if (grid[i][j] != temp[j]) {
                changed = true;
                grid[i][j] = temp[j];
            }
        }
    }
    return changed;
}

bool Board::move(Direction dir) {
    bool success = false;
    int rotations = 0;

    // Rotate board so we always slide LEFT
    switch (dir) {
        case Direction::LEFT: rotations = 0; break;
        case Direction::DOWN: rotations = 1; break;
        case Direction::RIGHT: rotations = 2; break;
        case Direction::UP: rotations = 3; break;
    }

    for (int i = 0; i < rotations; ++i) rotate();
    
    success = slideAndMerge();

    // Rotate back
    for (int i = 0; i < (4 - rotations) % 4; ++i) rotate();

    if (success) {
        spawnTile();
    }
    return success;
}

bool Board::isGameWon() const {
    for (int i = 0; i < SIZE; ++i) {
        for (int j = 0; j < SIZE; ++j) {
            if (grid[i][j] == 2048) return true;
        }
    }
    return false;
}

bool Board::isGameOver() const {
    if (canMove()) return false;
    // Check if any merges are possible
    for (int i = 0; i < SIZE; ++i) {
        for (int j = 0; j < SIZE; ++j) {
            if (grid[i][j] == 0) return false;
            if (j < SIZE - 1 && grid[i][j] == grid[i][j + 1]) return false;
            if (i < SIZE - 1 && grid[i][j] == grid[i + 1][j]) return false;
        }
    }
    return true;
}

bool Board::canMove() const {
    for(int i=0; i<SIZE; ++i)
        for(int j=0; j<SIZE; ++j)
            if(grid[i][j] == 0) return true;
    return false;
}

int Board::getScore() const {
    return score;
}
