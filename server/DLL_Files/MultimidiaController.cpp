// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"
#include <windows.h>
#include "MultimidiaController.h"

void press(int KEY)
{
    INPUT inputs[2] = {};
    ZeroMemory(inputs, sizeof(inputs));

    inputs[0].type = INPUT_KEYBOARD;
    inputs[0].ki.wVk = KEY;
    inputs[1].type = INPUT_KEYBOARD;
    inputs[1].ki.wVk = KEY;
    inputs[1].ki.dwFlags = KEYEVENTF_KEYUP;

    UINT uSent = SendInput(ARRAYSIZE(inputs), inputs, sizeof(INPUT));
}

void play() {
    press(0xB3);
}
void stop() {
    press(0xB2);
}
void volume_up() {
    press(0xAF);
}
void volume_down() {
    press(0xAE);
}
void next_track() {
    press(0xB0);
}
void previous_track() {
    press(0xB1);
}
