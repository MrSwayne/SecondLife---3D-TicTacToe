string playerTwo;

default
{
    state_entry()
    {
        llListen(-1, "Reset", NULL_KEY, "");
    }
    
    touch(integer num_detected)
    {
        //llSay(0, llDetectedName(0) + ", You are now player 2");
        playerTwo = llDetectedName(0);
        
        llSay(-16, playerTwo);
    }
    
   listen(integer channel, string name, key id, string message)
    {
       playerTwo = "";
       state default;
    }
}
