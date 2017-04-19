string playerOne;
string playerTwo;
integer channel = -20;
integer id = 8;
integer playerOneCanClick;
integer playerTwoCanClick;



default // default state
{
    state_entry()
    {
        llListen(-15, "PlayerPicker", NULL_KEY, "");
        llListen(-16, "PlayerPicker", NULL_KEY, "");
        llListen(-1, "Game", NULL_KEY, "");
    }
    
    touch_start(integer num_detected)
    
        (-50, "Game", NULL_KEY, "");
        
        if(playerOne == llDetectedName(0))
        {
            if(playerOneCanClick == TRUE)
            {
                llSay(-60, "x");
                state x;
            }
            else
                llSay(0, "It is not your turn");
        }
        else if(playerTwo == llDetectedName(0))
        {
            if(playerTwoCanClick == TRUE)
                {
                    state o;
                }
            else
                llSay(0, "It is not your turn");
        }
        else
            llSay(0, "Error");    
    }
    
    
    listen(integer channel, string name, key id, string message)
    {
        if (channel == -15)  playerOne = message;
        else if (channel == -16)  playerTwo = message;
        else if (channel == -1)   state reset;
        else if (channel == -50)    
        {
            if(message == "o")
            {
                playerOneCanClick = 1;
                playerTwoCanClick = 0;
            }
            else if(message == "x")
            {
                playerOneCanClick = 0;
                playerTwoCanClick = 1;
            }
        }
    }
      

}


state x
{
    state_entry()
    {
        llSay(channel,"x");
        llSetColor(<0.0,0.0,1.0>, ALL_SIDES);
        llSetAlpha(1, ALL_SIDES);
        llListen(-1, "Game", NULL_KEY, "");
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
        llSay(channel,"o");
        llSetColor(<1.0,0.0,0.0>, ALL_SIDES);
        llSetAlpha(1, ALL_SIDES);
        llListen(-1, "Game", NULL_KEY, "");
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
        playerOneCanClick = 1;
        playerTwoCanClick = 0;
        
        llSetColor(<0.0,0.0,0.0>, ALL_SIDES);
        llSetAlpha(0.2, ALL_SIDES);
         state default;
    }
}