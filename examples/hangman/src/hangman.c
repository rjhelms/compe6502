#include <conio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <compe.h>
#include "word_list.h"

const char hangman_top[] = " +---+\r\n |   ";
const char hangman_bottom[] = "\r\n |\r\n-+----";
const char hangman[7][32] = {
    "\r\n |\r\n |\r\n |",
    "O\r\n |\r\n |\r\n |",
    "O\r\n |   |\r\n |   |\r\n |",
    "O\r\n |  \\|\r\n |   |\r\n |",
    "O\r\n |  \\|/\r\n |   |\r\n |",
    "O\r\n |  \\|/\r\n |   |\r\n |  /",
    "O\r\n |  \\|/\r\n |   |\r\n |  / \\"};

unsigned int seed = 0;
unsigned char word_index = 0;
char input = 0;
char *word;
unsigned char word_length = 0;
unsigned char guess = 0;

char *word_ptr[256];
bool letters_guessed[26];
bool word_found[16];
bool game_won;

void build_word_ptr()
{
    unsigned char i = 0;
    char *j = word_list;

    // first pointer is at word_list
    word_ptr[i] = j;
    ++i;

    while (i > 0)
    {
        ++j;
        if (*j == 0)
        {
            word_ptr[i] = ++j;
            ++i;
        }
    }
}

// welcome - display the welcome screen and set the random seed

void welcome()
{
    textcolor(COLOR_YELLOW);
    bgcolor(COLOR_BLUE);
    clrscr();
    cputs("\r\nHANGMAN\r\n\n");
    cputs("2021-2022 Rob Hailman\r\n\n");

    cputs(hangman_top);
    cputs(hangman[6]);
    cputs(hangman_bottom);
    cputs("\r\n\n");
    
    cputs("Building word list...\r\n\n");
    build_word_ptr();
    cputs("Press any key to begin\r\n");
    // while waiting for key press, increment random seed
    while (!kbhit())
    {
        ++seed;
    }
    cgetc();
    clrscr();
    srand(seed);
}

// initialize a round

void init_game()
{
    unsigned char i = 0;
    word_index = rand() >> 8;
    word = word_ptr[word_index];
    guess = 0;
    word_length = 0;
    for (i = 0; i < 16; i++)
    {
        word_found[i] = false;
        if (word[i] > 0)
        {
            ++word_length;
        }
        else
        {
            break;
        }
    }
    for (i = 0; i < 26; i++)
    {
        letters_guessed[i] = false;
    }
    game_won = false;
}

// draw the hangman

void draw_hangman()
{
    cputs(hangman_top);
    cputs(hangman[guess]);
    cputs(hangman_bottom);
    cputs("\r\n\n");
}

// draw the game screen
void draw_screen()
{
    unsigned char i = 0;
    bgcolor(COLOR_BLACK);
    textcolor(COLOR_WHITE);
    clrscr();
    draw_hangman();

    for (i = 0; i < word_length; i++)
    {
        if (word_found[i])
        {
            cputc(word[i]);
        }
        else
        {
            cputc('_');
        }
    }
    cputs("\r\n\nRemaining letters:\r\n");

    for (i = 0; i < 26; i++)
    {
        if (letters_guessed[i] == true)
        {
            cputc(' ');
        }
        else
        {
            cputc(i + 0x61);
        }
    }
    cputs("\r\n\n");
}

// get a guess from the keyboard

char get_guess()
{
    char key;
    key = cgetc();
    if (key < 0x61) // cast to lower case
        key += 0x20;
    if (key<0x61 | input> 0x7A)
        key = 0;
    return (key);
}

// check a guess against the word

unsigned char check_guess()
{
    unsigned char matches = 0;
    unsigned char i = 0;
    for (i = 0; i < word_length; i++)
    {
        if (word[i] == input)
        {
            ++matches;
            word_found[i] = true;
        }
    }
    if (matches == 0)
    {
        return (1);
    }
    else
    {
        game_won = true;
        for (i = 0; i < word_length; i++)
        {
            if (word_found[i] == false)
                game_won = false;
        }
        return (0);
    }
}

void end_screen()
{
    clrscr();
    draw_hangman();
    if (game_won)
    {
        bgcolor(COLOR_GREEN);
        cputs("You won!\r\n\n");
    }
    else
    {
        bgcolor(COLOR_RED);
        cputs("Game over!\r\n\n");
    }
    cputs("The word was \r\n\n");
    cputs(word);
    cputs("\r\n\n");
}

// main game loop
int play_game()
{
    bool input_valid;
    init_game();
    while (guess < 6)
    {
        draw_screen();
        input_valid = false;
        while (input_valid == false)
        {
            cputs("Guess a letter\r\n");
            input = get_guess();
            if (input > 0)
            {
                if (letters_guessed[input - 0x61])
                {
                    draw_screen();
                    cputs("You already guessed that!\r\n");
                    B_BEEP();
                }
                else
                {
                    input_valid = true;
                }
            }
            else
            {
                draw_screen();
                cputs("Please enter a letter!\r\n");
                B_BEEP();
            }
        }

        letters_guessed[input - 0x61] = true;
        guess += check_guess();
        if (game_won)
        {
            break;
        }
    }
    end_screen();
    input = 0;
    cputs("Play again? (Y/N)");
    while (input != 'y' & input != 'n')
        input = get_guess();
    if (input == 'y')
        return (1);
    return (0);
}

int main()
{
    cursor(1);
    welcome();
    while (play_game())
    {
    }
    bgcolor(COLOR_BLACK);
    textcolor(COLOR_WHITE);
    return (0);
}
