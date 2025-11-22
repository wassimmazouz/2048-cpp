#ifndef GRID_H
#define GRID_H

#include <QObject>

// Import required Libraries
#include <QList>
#include <vector>
using namespace std ;

class Grid : public QObject
{
    Q_OBJECT
public:
    // Constructor
    explicit Grid(QObject *parent = nullptr);
    void Init();

    // Motion Processing :
    Q_INVOKABLE void up();          //for the up arrow
    Q_INVOKABLE void down();        //for the down arrow
    Q_INVOKABLE void left();        //for the left arrow
    Q_INVOKABLE void right();       //for the right arrow


    Q_INVOKABLE void add_tesserae(); //adding a random tesserae each turn (2 or 4)

    Q_PROPERTY(QList<QString> grid_QML READ read_grid NOTIFY grid_changed)     //grille des tesselles.
    Q_PROPERTY(int score_QML READ read_score NOTIFY score_changed)                 // Score
    Q_PROPERTY(int best_QML READ read_best NOTIFY best_score_changed)                  // Best score
    Q_PROPERTY(int order_QML READ read_order NOTIFY order_changed)                // Order
    Q_PROPERTY(QString font_QML READ read_font NOTIFY font_changed)            // Text font
    Q_PROPERTY(QList<QString> color_QML READ read_color NOTIFY colors_changed) // Color

    void win();     //Victory management method
    void lose();    //Ddefeat management method


    // Special Methods

    void Best();                    // Management of the best score - search for maximum
    Q_INVOKABLE void new_game();     // New Game/Reset Method
    Q_INVOKABLE void undo();        // Undo method
    Q_INVOKABLE void save();        // Saving mode method
    //Q_INVOKABLE void load();        // Load last saved game method
    Q_INVOKABLE void quit();        // Quit method

    //C++ ~ QML :
    QList<QString> read_grid();
    int read_score();
    int read_best();
    int read_order();
    QString read_font();
    QList<QString> read_color();
    // Change text font :
    Q_INVOKABLE void setfont0();
    Q_INVOKABLE void setfont1();
    Q_INVOKABLE void setfont2();
    Q_INVOKABLE void setfont3();
    Q_INVOKABLE void setfont4();

    // Change Cases Color :
    Q_INVOKABLE void startColors();
    Q_INVOKABLE void classicColors();
    Q_INVOKABLE void customColors();
    Q_INVOKABLE void primaryColors();
    Q_INVOKABLE void bwColors();
    Q_INVOKABLE void rainbowColors();

signals:

    void grid_changed();               // Matrix modification
    void score_changed();              // Score modification
    void best_score_changed();         // Best score modification
    void order_changed();              // Order modification
    void font_changed();               // Police modification
    void colors_changed();             // Colors modification
    void nb_move_changed();            // Number of moves modification
    //void nb_best_move_changed();       // Number of best moves modification

private:
    QList<QString> tab;
    QString font;                   // Change the text police
    QList<QString> colors;         // Change colors
    int my_grid[4][4];             // Matrix Table of numbers
    int score;
    int best;
    int order;
    int nb_move;


};

#endif // GRID_H
