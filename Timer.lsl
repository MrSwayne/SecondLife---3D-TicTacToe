integer gap = 1;
integer counter = 0;
integer start = 0;
integer stop = 0;

default
{
    state_entry()
    {
        
        if(start == 0)
            llListen(-70, "", NULL_KEY, "");
        
        llListen(-89, "", NULL_KEY, "");
        llListen(-49, "", NULL_KEY, "");
    }
    
    listen(integer channel, string name, key id, string message)
    {
        if(channel == -70)
        {
            start = 1;
            name = message;
            llSetTimerEvent(gap);
        }
        else if(channel == -49)
            state reset;
        else
            llSay(0, "The game was completed in " + counter + "seconds!");  
    }
    
    timer()
    {
        counter = counter + gap;      
    }
}

state reset
{
    state_entry()
    {
        counter = 0;
        start = 0; 
        stop = 0;
        state default;      
    }
}
