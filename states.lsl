string playerOne;
string playerTwo;
integer channel = -20;
integer id = 8;




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

state reset
{
    state_entry()
    {
        playerOne = "";
        playerTwo = "";
        llSetColor(<0.0,0.0,0.0>, ALL_SIDES);
         state default;
    }
}

state x
{
    state_entry()
    {
        llSay(channel,id + "x");
        llSetColor(<0.0,0.0,1.0>, ALL_SIDES);
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
        llSetColor(<1.0,0.0,0.0>, ALL_SIDES);
        llListen(-1, "Reset", NULL_KEY, "");
    }
    
    listen(integer channel, string name, key id, string message)
    {
        if(channel == -1) 
            state reset;
    }
}




