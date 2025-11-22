#include "grid.h"

#include <QList>
#include <QString>
#include <cstdlib>
#include <fstream>

Grid::Grid(QObject *parent) : QObject(parent) {
    Grid::Init();
    // Creation of the table.
    tab.clear();
    for (int i = 0; i < 16; i++) {
        tab.push_back(QString::number(my_grid[i % 4][i - 4 * (i % 4)]));
    }
    // Creation of the color list
    colors.clear();
    colors << "#cfcecc" // couleur de case vide
           << "#750eeb"  // couleur de 2
           << "#c20808"  // couleur de 4
           << "#eded0c"  // couleur de 8
           << "#0ced26"  // couleur de 16
           << "#0cede2"  // couleur de 32
           << "#bf0a98"  // couleur de 64
           << "#fc8803"  // couleur de 128
           << "#063696"  // couleur de 256
           << "#068a96"  // couleur de 512
           << "#964206"  // couleur de 1024
           << "#420303"; // couleur de 2048
}
void Grid::Init() {

    // Initialization of the font, colors and numbers of moves at the initial
    // values:
    font = "Tahoma";

    // Initialization of scores:
    score = 0;
    best = 0;
    nb_move=0;
    order = 0; //"Join the numbers and get to the 2048 tile !"

    // Initialization of the matrix at 0
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            my_grid[i][j] = 0;
        }
    }

    // call add_tesserae twice to add 2 tiles which will be the starting point of
    // the game.
    Grid::add_tesserae();
    Grid::add_tesserae();

    Grid::save();       //Save the initial grid :

}

void Grid::up() {

    bool test =
        false; // Indicate if we must add a tile in support of one of the 4 arrows

    // Shift the numbers if there are empty cells
    for (int j = 0; j < 4; j++) {
        if (my_grid[2][j] == 0 && my_grid[3][j] != 0) {
            my_grid[2][j] = my_grid[3][j];
            my_grid[3][j] = 0;
            test = true;
        }
        if (my_grid[1][j] == 0 && (my_grid[2][j] != 0 || my_grid[3][j] != 0)) {
            my_grid[1][j] = my_grid[2][j];
            my_grid[2][j] = my_grid[3][j];
            my_grid[3][j] = 0;
            test = true;
        }
        if (my_grid[0][j] == 0 &&
            (my_grid[1][j] != 0 || my_grid[2][j] != 0 || my_grid[3][j] != 0)) {
            my_grid[0][j] = my_grid[1][j];
            my_grid[1][j] = my_grid[2][j];
            my_grid[2][j] = my_grid[3][j];
            my_grid[3][j] = 0;
            test = true;
        }
    };
    // Merge the boxes that can be merged

    for (int i = 0; i < 4; i++) {
        if (my_grid[1][i] == my_grid[0][i] && my_grid[1][i] != 0) {
            my_grid[0][i] += my_grid[1][i];
            score += 2 * my_grid[1][i];
            if (my_grid[3][i] == my_grid[2][i]) {
                my_grid[1][i] = my_grid[3][i] + my_grid[2][i];
                score += 2 * my_grid[2][i];
                my_grid[3][i] = 0;
                my_grid[2][i] = 0;
            } else {
                my_grid[1][i] = my_grid[2][i];
                my_grid[2][i] = my_grid[3][i];
                my_grid[3][i] = 0;
            }
            test = true;
        } else {
            if (my_grid[2][i] == my_grid[1][i] && my_grid[2][i] != 0) {
                my_grid[1][i] = my_grid[1][i] + my_grid[2][i];
                score += 2 * my_grid[2][i];
                my_grid[2][i] = my_grid[3][i];
                my_grid[3][i] = 0;
                test = true;
            } else if (my_grid[3][i] == my_grid[2][i] && my_grid[3][i] != 0) {
                my_grid[2][i] += my_grid[3][i];
                score += 2 * my_grid[3][i];
                my_grid[3][i] = 0;
                test = true;
            }
        }
    }

    if (test == true) // A move is done
    {
        nb_move++;
        Grid::add_tesserae();
        Grid::save();
    }

    Grid::win();
    Grid::Best();
    Grid::lose();

    emit nb_move_changed();
    emit grid_changed();
    emit score_changed();
}

void Grid::down() {
    bool test = false;
    for (int j = 0; j < 4; j++) {
        if (my_grid[1][j] == 0 && my_grid[0][j] != 0) {
            my_grid[1][j] = my_grid[0][j];
            my_grid[0][j] = 0;
            test = true;
        }
        if (my_grid[2][j] == 0 && (my_grid[0][j] != 0 || my_grid[1][j] != 0)) {
            my_grid[2][j] = my_grid[1][j];
            my_grid[1][j] = my_grid[0][j];
            my_grid[0][j] = 0;
            test = true;
        }
        if (my_grid[3][j] == 0 &&
            (my_grid[0][j] != 0 || my_grid[1][j] != 0 || my_grid[2][j] != 0)) {
            my_grid[3][j] = my_grid[2][j];
            my_grid[2][j] = my_grid[1][j];
            my_grid[1][j] = my_grid[0][j];
            my_grid[0][j] = 0;
            test = true;
        }
    };
    for (int i = 0; i < 4; i++) {
        if (my_grid[2][i] == my_grid[3][i] && my_grid[3][i] != 0) {
            my_grid[3][i] += my_grid[2][i];
            score += 2 * my_grid[2][i];
            if (my_grid[0][i] == my_grid[1][i]) {
                my_grid[2][i] = my_grid[0][i] + my_grid[1][i];
                score += 2 * my_grid[1][i];
                my_grid[0][i] = 0;
                my_grid[1][i] = 0;
            } else {
                my_grid[2][i] = my_grid[1][i];
                my_grid[1][i] = my_grid[0][i];
                my_grid[0][i] = 0;
            }
            test = true;
        } else {
            if (my_grid[1][i] == my_grid[2][i] && my_grid[1][i] != 0) {
                my_grid[2][i] = my_grid[2][i] + my_grid[1][i];
                score += 2 * my_grid[1][i];
                my_grid[1][i] = my_grid[0][i];
                my_grid[0][i] = 0;
                test = true;
            } else if (my_grid[0][i] == my_grid[1][i] && my_grid[0][i] != 0) {
                my_grid[1][i] += my_grid[0][i];
                score += 2 * my_grid[0][i];
                my_grid[0][i] = 0;
                test = true;
            }
        }
    }
    if (test == true) {
        Grid::add_tesserae();
        nb_move++;
        Grid::save();
    }
    Grid::win();
    Grid::Best();
    Grid::lose();

    emit nb_move_changed();
    emit grid_changed();
    emit score_changed();
}

void Grid::left() {
    bool test = false;
    for (int j = 0; j < 4; j++) {
        if (my_grid[j][2] == 0 && my_grid[j][3] != 0) {
            my_grid[j][2] = my_grid[j][3];
            my_grid[j][3] = 0;
            test = true;
        }
        if (my_grid[j][1] == 0 && (my_grid[j][2] != 0 || my_grid[j][3] != 0)) {
            my_grid[j][1] = my_grid[j][2];
            my_grid[j][2] = my_grid[j][3];
            my_grid[j][3] = 0;
            test = true;
        }
        if (my_grid[j][0] == 0 &&
            (my_grid[j][1] != 0 || my_grid[j][2] != 0 || my_grid[j][3] != 0)) {
            my_grid[j][0] = my_grid[j][1];
            my_grid[j][1] = my_grid[j][2];
            my_grid[j][2] = my_grid[j][3];
            my_grid[j][3] = 0;
            test = true;
        }
    };
    for (int i = 0; i < 4; i++) {
        if (my_grid[i][1] == my_grid[i][0] && my_grid[i][1] != 0) {
            my_grid[i][0] += my_grid[i][1];
            score += 2 * my_grid[i][1];
            if (my_grid[i][3] == my_grid[i][2]) {
                my_grid[i][1] = my_grid[i][3] + my_grid[i][2];
                score += 2 * my_grid[i][2];
                my_grid[i][3] = 0;
                my_grid[i][2] = 0;
            } else {
                my_grid[i][1] = my_grid[i][2];
                my_grid[i][2] = my_grid[i][3];
                my_grid[i][3] = 0;
            }
            test = true;
        } else {
            if (my_grid[i][2] == my_grid[i][1] && my_grid[i][2] != 0) {
                my_grid[i][1] = my_grid[i][1] + my_grid[i][2];
                score += 2 * my_grid[i][2];
                my_grid[i][2] = my_grid[i][3];
                my_grid[i][3] = 0;
                test = true;
            } else if (my_grid[i][3] == my_grid[i][2] && my_grid[i][3] != 0) {
                my_grid[i][2] += my_grid[i][3];
                score += 2 * my_grid[i][3];
                my_grid[i][3] = 0;
                test = true;
            }
        }
    }
    if (test == true) {
        Grid::add_tesserae();
        nb_move++;
        Grid::save();
    }
    Grid::win();
    Grid::Best();
    Grid::lose();

    emit nb_move_changed();
    emit grid_changed();
    emit score_changed();
}

void Grid::right() {
    bool test = false;
    for (int j = 0; j < 4; j++) {
        if (my_grid[j][1] == 0 && my_grid[j][0] != 0) {
            my_grid[j][1] = my_grid[j][0];
            my_grid[j][0] = 0;
            test = true;
        }
        if (my_grid[j][2] == 0 && (my_grid[j][0] != 0 || my_grid[j][1] != 0)) {
            my_grid[j][2] = my_grid[j][1];
            my_grid[j][1] = my_grid[j][0];
            my_grid[j][0] = 0;
            test = true;
        }
        if (my_grid[j][3] == 0 &&
            (my_grid[j][0] != 0 || my_grid[j][1] != 0 || my_grid[j][2] != 0)) {
            my_grid[j][3] = my_grid[j][2];
            my_grid[j][2] = my_grid[j][1];
            my_grid[j][1] = my_grid[j][0];
            my_grid[j][0] = 0;
            test = true;
        }
    };

    for (int i = 0; i < 4; i++) {
        if (my_grid[i][2] == my_grid[i][3] && my_grid[i][3] != 0) {
            my_grid[i][3] += my_grid[i][2];
            score += 2 * my_grid[i][2];
            if (my_grid[i][0] == my_grid[i][1]) {
                my_grid[i][2] = my_grid[i][0] + my_grid[i][1];
                score += 2 * my_grid[i][1];
                my_grid[i][0] = 0;
                my_grid[i][1] = 0;
            } else {
                my_grid[i][2] = my_grid[i][1];
                my_grid[i][1] = my_grid[i][0];
                my_grid[i][0] = 0;
            }
            test = true;
        } else {
            if (my_grid[i][1] == my_grid[i][2] && my_grid[i][2] != 0) {
                my_grid[i][2] = my_grid[i][2] + my_grid[i][1];
                score += 2 * my_grid[i][1];
                my_grid[i][1] = my_grid[i][0];
                my_grid[i][0] = 0;
                test = true;
            } else if (my_grid[i][0] == my_grid[i][1] && my_grid[i][1] != 0) {
                my_grid[i][1] += my_grid[i][0];
                score += 2 * my_grid[i][0];
                my_grid[i][0] = 0;
                test = true;
            }
        }
    }
    if (test == true) {
        Grid::add_tesserae();
        nb_move++;
        Grid::save();
    }
    Grid::win();
    Grid::Best();
    Grid::lose();

    emit nb_move_changed();
    emit grid_changed();
    emit score_changed();
}

void Grid::win() {
    // On regarde si le joueur a atteint 2048 et donc gagné :
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            if (my_grid[i][j] == 2048) // Alors le joueur a gagné
            {                          // Il faut montrer au joueur qu'il a gagné :
                order = 1;               //"You win ! Try to go further or click NEW "
                emit order_changed();
            }
        }
    }
}

void Grid::lose() {
    bool lose = true;
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            // Si on trouve un 0 alors on a pas perdu :
            if (my_grid[i][j] == 0)
                lose = false;

            // Si on trouve 2 chiffres adjacents égaux alors on a pas perdu :
            else if (i != 0 && j != 0 && i != 3 && j != 3) {
                if (my_grid[i - 1][j] == my_grid[i][j] ||
                    my_grid[i + 1][j] == my_grid[i][j] ||
                    my_grid[i][j - 1] == my_grid[i][j] ||
                    my_grid[i][j + 1] == my_grid[i][j])
                    lose = false;
            }
        }
    }
    if (my_grid[0][0] == my_grid[1][0] || my_grid[1][0] == my_grid[2][0] ||
        my_grid[2][0] == my_grid[3][0] || my_grid[0][3] == my_grid[1][3] ||
        my_grid[1][3] == my_grid[2][3] || my_grid[2][3] == my_grid[3][3])
        lose = false;
    else if (my_grid[0][0] == my_grid[0][1] || my_grid[0][1] == my_grid[0][2] ||
             my_grid[0][2] == my_grid[0][3] || my_grid[3][0] == my_grid[3][1] ||
             my_grid[3][1] == my_grid[3][2] || my_grid[3][2] == my_grid[3][3])
        lose = false;

    if (lose == true) // Alors le joueur a perdu :
    {
        order = 2;

    } else
        order = 0;
    emit order_changed();
}



void Grid::Best(){
    if (score > best)
        best = score;
    // if (nbcoup>nbcoupbest) nbcoupbest=nbcoup;
    emit best_score_changed();
    //emit nbcoupbestChanged();
}
void Grid::add_tesserae(){
    //Method to add a case

    //First we retrieve the coordinates (absciss and ordinate) of the empty boxes in the vectors veci and vecj.
    int *veci;
    int *vecj;
    veci=new int[15];
    vecj=new int[15];
    //We set an integer n=0 that we increment each time we find an empty box in the table.
    int n=0;

    //first we search the 0 in the matrix of tesserae
    for (int i=0;i<4;i++)
    {
        for (int j=0;j<4;j++)
        {
            if (my_grid[i][j]==0)
            //if we find a 0 we store its indices
            //we memorize with n the number of 0 found
            {
                veci[n]=i;
                vecj[n]=j;
                n++;
            }
        }
    }
    //from here we found all the 0s and stored their indices.

    //if n=0, game end :

    //we select a couplet of index at random among the n couplets listed:
    int k=rand()%n;
    int value = 2;
    if(rand()%10 > 7) value = 4;
    my_grid[veci[k]][vecj[k]]=value;

    //removal of dynamically allocated lists:
    delete [] veci;
    delete [] vecj;
}

void Grid::new_game() {
    // remove("save.txt");
    int tmp = best;

    Grid::Init();
    best = tmp;
    order = 0;
    nb_move=0;

    emit order_changed();
    emit grid_changed();
    emit score_changed();
    emit best_score_changed();

}
void Grid::save()
{   //save after every movement of save.txtfile
    ofstream flux("save.txt",ios::app);
    flux<<score<<endl;

    flux<<order<<endl;
    flux<<nb_move<<endl;
    for (int i=0;i<4;i++){
        for (int j=0;j<4;j++)
        {
            flux<<my_grid[i][j];
            flux<<" ";
        }
        flux<<endl;
    }
    flux.close();
}

void Grid::undo(){
    ifstream flux("save.txt");
    if (flux){
        ofstream flux2("save(1).txt",ios::app);
        //Variable to store the input value
        int tmp;
        //Read des n-2 last move
        if (nb_move>0){
            for (int k=0;k<nb_move;k++)
            {
                //Score
                flux>>tmp;
                flux2<<tmp<<endl;

                //Order
                flux>>tmp;
                flux2<<tmp<<endl;
                //Moves numver
                flux>>tmp;
                flux2<<tmp<<endl;

                //matrix :
                for (int i=0;i<4;i++)
                {
                    for (int j=0;j<4;j++)
                    {
                        flux>>tmp;
                        flux2<<tmp<<" ";

                    }
                    flux2<<endl;
                }
            }
            //read and catch the n-1 coup move :
            flux>>tmp;
            score=tmp;
            flux2<<score<<endl;

            flux>>tmp;
            order=tmp;
            flux2<<order<<endl;
            flux>>tmp;
            nb_move--;
            flux2<<nb_move<<endl;

            //matrix :
            for (int l=0;l<4;l++)
            {
                for (int f=0;f<4;f++)
                {
                    flux>>tmp;
                    my_grid[l][f]=tmp;
                    flux2<<tmp<<" ";
                }
                flux2<<endl;
            }
            //close files et rename flux2 :
            flux.close();
            remove("save.txt");
            flux2.close();
        }
        rename("save(1).txt","save.txt");}
    //change the parameters :
    Grid::win();
    Grid::Best();
    Grid::lose();
    emit grid_changed();
    emit score_changed();
    emit nb_move_changed();
}


void Grid::quit() {
    // rename("save.txt","load.txt");
    exit(0);
}

QList<QString> Grid::read_grid() {
    for (int i = 0; i < 16; i++) {
        tab[i] = QString::number(my_grid[i % 4][i - 4 * (i % 4)]);
    }
    return (tab);
}

int Grid::read_score() { return (score); }

int Grid::read_best() { return (best); }

int Grid::read_order() { return (order); }

QString Grid::read_font() { return (font); }

QList<QString> Grid::read_color() { return (colors); }


// Change Cases color :

void Grid::startColors()
{
    colors.clear();
    colors << "#cfcecc"<<"#750eeb"<<"#c20808"<<"#eded0c"<<"#0ced26"<<"#0cede2"<<"#bf0a98"<<"#fc8803"<<"#063696"<<"#068a96"<<"#964206"<<"#420303";
    emit colors_changed();
}

void Grid::classicColors()
{
    colors.clear();
    colors<<"#dcd8c9"<<"#d7d0b4"<<"#ea6f37"<<"#ea6f37"<<"#ea6f37"<<"#e94a2c"<<"#ebcb31"<<"#ebcb31"<<"#e9c81e"<<"#e9c81e"<<"#fdc66c"<<"#d260bf";
    emit colors_changed();
}
void Grid::customColors()
{
    colors.clear();
    colors << "#cfcecc"<<"#750eeb"<<"#c20808"<<"#eded0c"<<"#0ced26"<<"#0cede2"<<"#bf0a98"<<"#fc8803"<<"#063696"<<"#068a96"<<"#964206"<<"#420303";
    emit colors_changed();
}
void Grid::primaryColors()
{
    colors.clear();
    colors<<"#FD4F4F"<<"#FF0D0D"<<"#C80000"<<"#C41E00"<<"#EAE500"<<"#FFFA04"<<"#FFFB26"<<"#FFFC48"<<"#6FBCFE"<<"#2B9DFF"<<"#007BE6"<<"#3D1EFF"<<"#2000E6"<<"#1900B7";
    emit colors_changed();
}
void Grid::bwColors()
{
    colors.clear();
    colors<<"#FFFFFF"<<"#F5F2F0"<<"#E9E2DE"<<"#D8CBC4"<<"#C7B5AB"<<"#B4A49C"<<"#A49086"<<"#827168"<<"#655B56"<<"#524B47"<<"#413D3B"<<"#2C2A29"<<"#1A1919"<<"#060606";
    emit colors_changed();
}
void Grid::rainbowColors()
{
    colors.clear();
    colors<<"#D40000"<<"#D45800"<<"#D84800"<<"#D4BA00"<<"#B7D400"<<"#75D400"<<"#33D400"<<"#00D47C"<<"#00BED4"<<"#003AD4"<<"#5F00D4"<<"#D400BA"<<"#B7618A"<<"#4E2525";
    emit colors_changed();
}

// Change text fonts :
void Grid::setfont0(){
    font="Sofia pro";
    emit font_changed();}
void Grid::setfont1(){
    font="Arial";
    emit font_changed();}
void Grid::setfont2(){
    font="Verdana";
    emit font_changed();}
void Grid::setfont3(){
    font="Montserrat";
    emit font_changed();}
void Grid::setfont4(){
    font="Courier";
    emit font_changed();}


