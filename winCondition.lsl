list objects = [5,5,5];

default
{
    state_entry()
    {
        llListen(-20,"", NULL_KEY, "");
        llListen(-1, "", NULL_KEY, "");   
       
        
    }
    
    listen(integer channel, string name, key id, string message)
    {   
            if(channel == -1)
                state reset;
                
            objects += message;
            state checkWinCondition;
    }
}

state checkWinCondition
{
    state_entry()
    {
        llListen(-1, "", NULL_KEY, "");
            
            if((llListFindList(objects, ["1o"]) >= 0) && (llListFindList(objects, ["2o"]) >= 0) && (llListFindList(objects, ["3o"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["4o"]) >= 0) && (llListFindList(objects, ["5o"]) >= 0) && (llListFindList(objects, ["6o"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["7o"]) >= 0) && (llListFindList(objects, ["8o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["1o"]) >= 0) && (llListFindList(objects, ["4o"]) >= 0) && (llListFindList(objects, ["7o"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["2o"]) >= 0) && (llListFindList(objects, ["5o"]) >= 0) && (llListFindList(objects, ["8o"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["3o"]) >= 0) && (llListFindList(objects, ["6o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["1o"]) >= 0) && (llListFindList(objects, ["5o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["3o"]) >= 0) && (llListFindList(objects, ["5o"]) >= 0) && (llListFindList(objects, ["7o"]) >= 0) )
                state win;
                       
            else if((llListFindList(objects, ["1x"]) >= 0) && (llListFindList(objects, ["2x"]) >= 0) && (llListFindList(objects, ["3x"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["4x"]) >= 0) && (llListFindList(objects, ["5x"]) >= 0) && (llListFindList(objects, ["6x"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["7x"]) >= 0) && (llListFindList(objects, ["8x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["1x"]) >= 0) && (llListFindList(objects, ["4x"]) >= 0) && (llListFindList(objects, ["7x"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["2x"]) >= 0) && (llListFindList(objects, ["5x"]) >= 0) && (llListFindList(objects, ["8x"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["3x"]) >= 0) && (llListFindList(objects, ["6x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["1x"]) >= 0) && (llListFindList(objects, ["5x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0) )
                state win;
            else if ((llListFindList(objects, ["3x"]) >= 0) && (llListFindList(objects, ["5x"]) >= 0) && (llListFindList(objects, ["7x"]) >= 0) )
                state win;
            else
                state default;
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
        objects = [];
        state default;
    }
}

state win
{
    state_entry()
    {
        llSay(0, "well done you won kaid");
        llListen(-1, "", NULL_KEY, "");
    }
    
    listen(integer channel, string name, key id, string message)
    {   
            if(channel == -1)
                state reset;
    }
}