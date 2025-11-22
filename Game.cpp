#include "Game.h"
#include <iostream>
#include <conio.h> // For _getch() on Windows

Game::Game() : isRunning(true) {}

void Game::run() {
    while (isRunning) {
        render();
        handleInput();
        if (board.isGameWon()) {
            render();
            std::cout << "You Won!\n";
            isRunning = false;
        }
        if (board.isGameOver()) {
            render();
            std::cout << "Game Over!\n";
            isRunning = false;
        }
    }
    std::cout << "Press any key to exit...";
    _getch();
}

void Game::render() {
    system("cls"); // Clear screen (Windows specific)
    std::cout << "2048 - C++ Console Version\n";
    std::cout << "Use WASD or Arrow Keys to move. Q to quit.\n\n";
    board.print();
}

void Game::handleInput() {
    int ch = _getch();
    
    // Handle arrow keys (they return two codes)
    if (ch == 0 || ch == 224) {
        ch = _getch();
        switch (ch) {
            case 72: board.move(Direction::UP); break;    // Up arrow
            case 80: board.move(Direction::DOWN); break;  // Down arrow
            case 75: board.move(Direction::LEFT); break;  // Left arrow
            case 77: board.move(Direction::RIGHT); break; // Right arrow
        }
    } else {
        switch (tolower(ch)) {
            case 'w': board.move(Direction::UP); break;
            case 's': board.move(Direction::DOWN); break;
            case 'a': board.move(Direction::LEFT); break;
            case 'd': board.move(Direction::RIGHT); break;
            case 'q': isRunning = false; break;
        }
    }
}
