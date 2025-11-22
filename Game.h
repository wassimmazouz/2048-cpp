#pragma once
#include "Board.h"

class Game {
public:
    Game();
    void run();

private:
    Board board;
    bool isRunning;
    void handleInput();
    void render();
};
