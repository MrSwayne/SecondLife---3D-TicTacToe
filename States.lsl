string playerOne;
string playerTwo;
integer channel = -20;
integer id = 8;
string xTexture = "ef8c951c-046d-43b7-a104-a84edc8af26f";
string yTexture = "cee5b0aa-ac9d-44e7-bc27-97dcb91d05bb";
string defaultTexture = "5748decc-f629-461c-9a36-a35a221fe21f";



default // default state
{
    state_entry()
    {
        llListen(-15, "PlayerPicker", NULL_KEY, "");
        llListen(-16, "PlayerPicker", NULL_KEY, "");
        llListen(-1, "Reset", NULL_KEY, "");
    }
    
    touch_start(integer num_detected)
    {
        if(playerOne == llDetectedName(0))
            state x;
        else if(playerTwo == llDetectedName(0))
         state o;
        else
            llSay(0, "error, you're not assigned to a player slot");
    }
    
    
    listen(integer channel, string name, key id, string message)
    {
        if (channel == -15)  playerOne = message;
        else if (channel == -16)  playerTwo = message;
        else if (channel == -1)   state reset;
    }
      

}


state x
{
    state_entry()
    {
        llSay(channel,id + "x");
        llSetTexture(xTexture, ALL_SIDES);
        llListen(-1, "Reset", NULL_KEY, "");
    }
    
    listen(integer channel, string name, key id, string message)
    {
        if(channel == -1) 
            state reset;
    }
}

state o
{
    state_entry()
    {
        llSay(channel,id + "o");
        llSetTexture(yTexture, ALL_SIDES);
        llListen(-1, "Reset", NULL_KEY, "");
    }
    
    listen(integer channel, string name, key id, string message)
    {
        if(channel == -1) 
            state reset;
    }
}


state reset
{
    state_entry()
    {
        playerOne = "";
        playerTwo = "";
        llSetTexture(defaultTexture, ALL_SIDES);
         state default;
    }
}