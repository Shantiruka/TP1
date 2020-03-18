//
// Created by Florent on 17/03/2020.
//
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <time.h>

static int score = 0;

void sortie(int signal) {
    if (signal == SIGINT)
        printf("Score = %d", score);
    exit(0);
}

int main() {
    struct sigaction action;

    action.sa_handler = sortie;
    action.sa_flags = 0;
    sigemptyset(&action.sa_mask);
    srand(time(NULL));

    while (42) {
        sigaction(SIGINT, &action, NULL);
    }
}