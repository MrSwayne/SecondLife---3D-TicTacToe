string playerOne;

default
{
    state_entry()
    {
        llListen(-1, "Reset", NULL_KEY, "");
    }
    
    touch(integer num_detected)
    {
        llSay(0, llDetectedName(0) + ", You are now player 1");
        playerOne = llDetectedName(0);
        
        llSay(-15, playerOne);
    }
    
   listen(integer channel, string name, key id, string message)
    {
       playerOne = "";
       state default;
    }
}

