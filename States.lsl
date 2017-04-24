string playerOne;
string playerTwo;
integer channel = -20;
integer playerOneCanClick;
integer playerTwoCanClick;
integer gameIsWon = 0;


default // default state
{
    state_entry()
    {
        llListen(-5,"Game", NULL_KEY,"");
        
        if(gameIsWon == 0)
        {
            llListen(-50, "", NULL_KEY, "");
            llSetAlpha(0.2, ALL_SIDES);
            llListen(-15, "PlayerPicker", NULL_KEY, "");
            llListen(-16, "PlayerPicker", NULL_KEY, "");
            
            llListen(-1, "Game", NULL_KEY, "");
        }
        else
        {
            llSay(0,"Error, game is over, please click the reset button");
        }
    }
    
    touch_start(integer num_detected)
    {
        llSay(-70, "start");
        
        if(playerOne == llDetectedName(0))
        {
            if(playerOneCanClick == 1)
            {
                llSay(-50, "x");
                state x;
            }
            else
                llSay(0, "It is not your turn");
        }
        else if(playerTwo == llDetectedName(0))
        {
            if(playerTwoCanClick == 1)
                {
                    llSay(-50, "o");
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
        if(channel == -5)  
        {
             gameIsWon = 1;
             llSay(-89, "won");
        }
        if (channel == -15)  playerOne = message;
        else if (channel == -16)  playerTwo = message;
        else if (channel == -1)   state reset;
        else if (channel == -50)
        {
            if(message == "x")
            {
                playerOneCanClick = 0;
                playerTwoCanClick = 1;
            }
            else if(message == "o")
            {
                playerOneCanClick = 1;
                playerTwoCanClick = 0;
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
        llSay(-49, "reset");
        playerOne = "";
        playerTwo = "";
        playerOneCanClick = 1;
        playerTwoCanClick = 0;
        
        llSetColor(<0.0,0.0,0.0>, ALL_SIDES);
        llSetAlpha(0.2, ALL_SIDES);
         state default;
    }
}
