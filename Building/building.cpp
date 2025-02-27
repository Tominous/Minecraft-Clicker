#include "Building/building.h"


Building::Building(QObject *parent) : QObject(parent)
{
}

void Building::loopReset()
{
    check->start(1000 / config->delay);
}

void Building::loop()
{
    if(GetAsyncKeyState(config->btoggleButton) && GetAsyncKeyState(0x02))
    {
        enabled = true;
    }
    if(GetAsyncKeyState(0x02) == 0 || GetAsyncKeyState(config->inventoryKey))
    {
        enabled = false;
    }
    if(enabled && GetAsyncKeyState(0x02))
    {
        rightClick();
    }
}

void Building::loopStart()
{
    connect(check, SIGNAL(timeout()), this, SLOT(loop()));
    check->setInterval(0);
    check->start(1000 / config->delay);
}

void Building::rightClick()
{
    PostMessage(FindWindow(NULL, config->windowID), WM_RBUTTONDOWN, NULL, NULL);
    PostMessage(FindWindow(NULL, config->windowID), WM_RBUTTONUP, NULL, NULL);
}
