list objects = [];
integer winner = 0;
string playerOne = ""; string playerTwo = "";

default
{
    state_entry()
    {
        llListen(-16, "", NULL_KEY, "");
       llListen(-15, "", NULL_KEY, "");
        llListen(-20, "", NULL_KEY, "");
        llListen(-1, "", NULL_KEY, "");   
       
        
    }
    
    listen(integer channel, string name, key id, string message)
    {   
            if (channel == -15)
               {
                    playerOne = message;
                    state default;
                }
         else if(channel == -16)
                {
                    playerTwo = message;
                    state default;
                }
                
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
           
            if(llGetListLength(objects) == 27)
                state draw; 

            //handles win conditions for both players
         else if(((llListFindList(objects, ["1x"]) >= 0) && (llListFindList(objects, ["2x"]) >= 0) && (llListFindList(objects, ["3x"]) >= 0)) ||
            ((llListFindList(objects, ["4x"]) >= 0) && (llListFindList(objects, ["5x"]) >= 0) && (llListFindList(objects, ["6x"]) >= 0)) ||
            ((llListFindList(objects, ["7x"]) >= 0) && (llListFindList(objects, ["8x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0)) ||
            ((llListFindList(objects, ["1x"]) >= 0) && (llListFindList(objects, ["4x"]) >= 0) && (llListFindList(objects, ["7x"]) >= 0)) ||
            ((llListFindList(objects, ["2x"]) >= 0) && (llListFindList(objects, ["5x"]) >= 0) && (llListFindList(objects, ["8x"]) >= 0)) ||
            ((llListFindList(objects, ["3x"]) >= 0) && (llListFindList(objects, ["6x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0)) ||
            ((llListFindList(objects, ["1x"]) >= 0) && (llListFindList(objects, ["5x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0)) ||
            ((llListFindList(objects, ["3x"]) >= 0) && (llListFindList(objects, ["5x"]) >= 0) && (llListFindList(objects, ["7x"]) >= 0)) ||
            //handles middle row
            ((llListFindList(objects, ["21x"]) >= 0) && (llListFindList(objects, ["22x"]) >= 0) && (llListFindList(objects, ["23x"]) >= 0)) ||
            ((llListFindList(objects, ["24x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["26x"]) >= 0)) ||
            ((llListFindList(objects, ["27x"]) >= 0) && (llListFindList(objects, ["28x"]) >= 0) && (llListFindList(objects, ["29x"]) >= 0)) ||
            ((llListFindList(objects, ["21x"]) >= 0) && (llListFindList(objects, ["24x"]) >= 0) && (llListFindList(objects, ["27x"]) >= 0)) ||
            ((llListFindList(objects, ["22x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["28x"]) >= 0)) ||
            ((llListFindList(objects, ["23x"]) >= 0) && (llListFindList(objects, ["26x"]) >= 0) && (llListFindList(objects, ["29x"]) >= 0)) ||
            ((llListFindList(objects, ["21x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["29x"]) >= 0)) ||
            ((llListFindList(objects, ["23x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["27x"]) >= 0)) ||
            //handles top row
            ((llListFindList(objects, ["31x"]) >= 0) && (llListFindList(objects, ["32x"]) >= 0) && (llListFindList(objects, ["33x"]) >= 0)) ||
            ((llListFindList(objects, ["34x"]) >= 0) && (llListFindList(objects, ["35x"]) >= 0) && (llListFindList(objects, ["36x"]) >= 0)) ||
            ((llListFindList(objects, ["37x"]) >= 0) && (llListFindList(objects, ["38x"]) >= 0) && (llListFindList(objects, ["39x"]) >= 0)) ||
            ((llListFindList(objects, ["31x"]) >= 0) && (llListFindList(objects, ["34x"]) >= 0) && (llListFindList(objects, ["37x"]) >= 0)) ||
            ((llListFindList(objects, ["32x"]) >= 0) && (llListFindList(objects, ["35x"]) >= 0) && (llListFindList(objects, ["38x"]) >= 0)) ||
            ((llListFindList(objects, ["33x"]) >= 0) && (llListFindList(objects, ["36x"]) >= 0) && (llListFindList(objects, ["39x"]) >= 0)) ||
            ((llListFindList(objects, ["31x"]) >= 0) && (llListFindList(objects, ["35x"]) >= 0) && (llListFindList(objects, ["39x"]) >= 0)) ||
            ((llListFindList(objects, ["33x"]) >= 0) && (llListFindList(objects, ["35x"]) >= 0) && (llListFindList(objects, ["37x"]) >= 0)) ||
            
            //handles going between levels
            //vertical
            ((llListFindList(objects, ["31x"]) >= 0) && (llListFindList(objects, ["21x"]) >= 0) && (llListFindList(objects, ["1x"]) >= 0)) ||
            ((llListFindList(objects, ["32x"]) >= 0) && (llListFindList(objects, ["22x"]) >= 0) && (llListFindList(objects, ["2x"]) >= 0)) ||
            ((llListFindList(objects, ["33x"]) >= 0) && (llListFindList(objects, ["23x"]) >= 0) && (llListFindList(objects, ["3x"]) >= 0)) ||
            ((llListFindList(objects, ["34x"]) >= 0) && (llListFindList(objects, ["24x"]) >= 0) && (llListFindList(objects, ["4x"]) >= 0)) ||
            ((llListFindList(objects, ["35x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["5x"]) >= 0)) ||
            ((llListFindList(objects, ["36x"]) >= 0) && (llListFindList(objects, ["26x"]) >= 0) && (llListFindList(objects, ["6x"]) >= 0)) ||
            ((llListFindList(objects, ["37x"]) >= 0) && (llListFindList(objects, ["27x"]) >= 0) && (llListFindList(objects, ["7x"]) >= 0)) ||
            ((llListFindList(objects, ["38x"]) >= 0) && (llListFindList(objects, ["28x"]) >= 0) && (llListFindList(objects, ["8x"]) >= 0)) ||
            ((llListFindList(objects, ["39x"]) >= 0) && (llListFindList(objects, ["29x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0)) ||
            //diagonal
            ((llListFindList(objects, ["37x"]) >= 0) && (llListFindList(objects, ["28x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0)) ||
            ((llListFindList(objects, ["39x"]) >= 0) && (llListFindList(objects, ["28x"]) >= 0) && (llListFindList(objects, ["7x"]) >= 0)) ||
            ((llListFindList(objects, ["36x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["4x"]) >= 0)) ||
            ((llListFindList(objects, ["34x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["6x"]) >= 0)) ||
            ((llListFindList(objects, ["33x"]) >= 0) && (llListFindList(objects, ["22x"]) >= 0) && (llListFindList(objects, ["1x"]) >= 0)) ||
            ((llListFindList(objects, ["31x"]) >= 0) && (llListFindList(objects, ["22x"]) >= 0) && (llListFindList(objects, ["3x"]) >= 0)) ||
            ((llListFindList(objects, ["33x"]) >= 0) && (llListFindList(objects, ["26x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0)) ||
            ((llListFindList(objects, ["39x"]) >= 0) && (llListFindList(objects, ["26x"]) >= 0) && (llListFindList(objects, ["3x"]) >= 0)) ||
            ((llListFindList(objects, ["32x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["8x"]) >= 0)) ||
            ((llListFindList(objects, ["38x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["2x"]) >= 0)) ||
            ((llListFindList(objects, ["31x"]) >= 0) && (llListFindList(objects, ["24x"]) >= 0) && (llListFindList(objects, ["7x"]) >= 0)) ||
            ((llListFindList(objects, ["37x"]) >= 0) && (llListFindList(objects, ["24x"]) >= 0) && (llListFindList(objects, ["1x"]) >= 0)) ||
            ((llListFindList(objects, ["31x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["9x"]) >= 0)) ||
            ((llListFindList(objects, ["39x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["1x"]) >= 0)) ||
            (((llListFindList(objects, ["33x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["7x"]) >= 0)) ||
            (((llListFindList(objects, ["37x"]) >= 0) && (llListFindList(objects, ["25x"]) >= 0) && (llListFindList(objects, ["33x"]) >= 0)))))
            {
                winner = 1;
               state win; 
            }
        
        
        
        
        
        else if(((llListFindList(objects, ["1o"]) >= 0) && (llListFindList(objects, ["2o"]) >= 0) && (llListFindList(objects, ["3o"]) >= 0)) ||
            ((llListFindList(objects, ["4o"]) >= 0) && (llListFindList(objects, ["5o"]) >= 0) && (llListFindList(objects, ["6o"]) >= 0)) ||
            ((llListFindList(objects, ["7o"]) >= 0) && (llListFindList(objects, ["8o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0)) ||
            ((llListFindList(objects, ["1o"]) >= 0) && (llListFindList(objects, ["4o"]) >= 0) && (llListFindList(objects, ["7o"]) >= 0)) ||
            ((llListFindList(objects, ["2o"]) >= 0) && (llListFindList(objects, ["5o"]) >= 0) && (llListFindList(objects, ["8o"]) >= 0)) ||
            ((llListFindList(objects, ["3o"]) >= 0) && (llListFindList(objects, ["6o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0)) ||
            ((llListFindList(objects, ["1o"]) >= 0) && (llListFindList(objects, ["5o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0)) ||
            ((llListFindList(objects, ["3o"]) >= 0) && (llListFindList(objects, ["5o"]) >= 0) && (llListFindList(objects, ["7o"]) >= 0)) ||
            //handles middle row
            ((llListFindList(objects, ["21o"]) >= 0) && (llListFindList(objects, ["22o"]) >= 0) && (llListFindList(objects, ["23o"]) >= 0)) ||
            ((llListFindList(objects, ["24o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["26o"]) >= 0)) ||
            ((llListFindList(objects, ["27o"]) >= 0) && (llListFindList(objects, ["28o"]) >= 0) && (llListFindList(objects, ["29o"]) >= 0)) ||
            ((llListFindList(objects, ["21o"]) >= 0) && (llListFindList(objects, ["24o"]) >= 0) && (llListFindList(objects, ["27o"]) >= 0)) ||
            ((llListFindList(objects, ["22o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["28o"]) >= 0)) ||
            ((llListFindList(objects, ["23o"]) >= 0) && (llListFindList(objects, ["26o"]) >= 0) && (llListFindList(objects, ["29o"]) >= 0)) ||
            ((llListFindList(objects, ["21o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["29o"]) >= 0)) ||
            ((llListFindList(objects, ["23o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["27o"]) >= 0)) ||
            //handles top row
            ((llListFindList(objects, ["31o"]) >= 0) && (llListFindList(objects, ["32o"]) >= 0) && (llListFindList(objects, ["33o"]) >= 0)) ||
            ((llListFindList(objects, ["34o"]) >= 0) && (llListFindList(objects, ["35o"]) >= 0) && (llListFindList(objects, ["36o"]) >= 0)) ||
            ((llListFindList(objects, ["37o"]) >= 0) && (llListFindList(objects, ["38o"]) >= 0) && (llListFindList(objects, ["39o"]) >= 0)) ||
            ((llListFindList(objects, ["31o"]) >= 0) && (llListFindList(objects, ["34o"]) >= 0) && (llListFindList(objects, ["37o"]) >= 0)) ||
            ((llListFindList(objects, ["32o"]) >= 0) && (llListFindList(objects, ["35o"]) >= 0) && (llListFindList(objects, ["38o"]) >= 0)) ||
            ((llListFindList(objects, ["33o"]) >= 0) && (llListFindList(objects, ["36o"]) >= 0) && (llListFindList(objects, ["39o"]) >= 0)) ||
            ((llListFindList(objects, ["31o"]) >= 0) && (llListFindList(objects, ["35o"]) >= 0) && (llListFindList(objects, ["39o"]) >= 0)) ||
            ((llListFindList(objects, ["33o"]) >= 0) && (llListFindList(objects, ["35o"]) >= 0) && (llListFindList(objects, ["37o"]) >= 0)) ||
            
            //handles going between levels
            //vertical
            ((llListFindList(objects, ["31o"]) >= 0) && (llListFindList(objects, ["21o"]) >= 0) && (llListFindList(objects, ["1o"]) >= 0)) ||
            ((llListFindList(objects, ["32o"]) >= 0) && (llListFindList(objects, ["22o"]) >= 0) && (llListFindList(objects, ["2o"]) >= 0)) ||
            ((llListFindList(objects, ["33o"]) >= 0) && (llListFindList(objects, ["23o"]) >= 0) && (llListFindList(objects, ["3o"]) >= 0)) ||
            ((llListFindList(objects, ["34o"]) >= 0) && (llListFindList(objects, ["24o"]) >= 0) && (llListFindList(objects, ["4o"]) >= 0)) ||
            ((llListFindList(objects, ["35o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["5o"]) >= 0)) ||
            ((llListFindList(objects, ["36o"]) >= 0) && (llListFindList(objects, ["26o"]) >= 0) && (llListFindList(objects, ["6o"]) >= 0)) ||
            ((llListFindList(objects, ["37o"]) >= 0) && (llListFindList(objects, ["27o"]) >= 0) && (llListFindList(objects, ["7o"]) >= 0)) ||
            ((llListFindList(objects, ["38o"]) >= 0) && (llListFindList(objects, ["28o"]) >= 0) && (llListFindList(objects, ["8o"]) >= 0)) ||
            ((llListFindList(objects, ["39o"]) >= 0) && (llListFindList(objects, ["29o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0)) ||
            //diagonal
            ((llListFindList(objects, ["37o"]) >= 0) && (llListFindList(objects, ["28o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0)) ||
            ((llListFindList(objects, ["39o"]) >= 0) && (llListFindList(objects, ["28o"]) >= 0) && (llListFindList(objects, ["7o"]) >= 0)) ||
            ((llListFindList(objects, ["36o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["4o"]) >= 0)) ||
            ((llListFindList(objects, ["34o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["6o"]) >= 0)) ||
            ((llListFindList(objects, ["33o"]) >= 0) && (llListFindList(objects, ["22o"]) >= 0) && (llListFindList(objects, ["1o"]) >= 0)) ||
            ((llListFindList(objects, ["31o"]) >= 0) && (llListFindList(objects, ["22o"]) >= 0) && (llListFindList(objects, ["3o"]) >= 0)) ||
            ((llListFindList(objects, ["33o"]) >= 0) && (llListFindList(objects, ["26o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0)) ||
            ((llListFindList(objects, ["39o"]) >= 0) && (llListFindList(objects, ["26o"]) >= 0) && (llListFindList(objects, ["3o"]) >= 0)) ||
            ((llListFindList(objects, ["32o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["8o"]) >= 0)) ||
            ((llListFindList(objects, ["38o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["2o"]) >= 0)) ||
            ((llListFindList(objects, ["31o"]) >= 0) && (llListFindList(objects, ["24o"]) >= 0) && (llListFindList(objects, ["7o"]) >= 0)) ||
            ((llListFindList(objects, ["37o"]) >= 0) && (llListFindList(objects, ["24o"]) >= 0) && (llListFindList(objects, ["1o"]) >= 0)) ||
            ((llListFindList(objects, ["31o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["9o"]) >= 0)) ||
            ((llListFindList(objects, ["39o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["1o"]) >= 0)) ||
            (((llListFindList(objects, ["33o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["7o"]) >= 0)) ||
            (((llListFindList(objects, ["37o"]) >= 0) && (llListFindList(objects, ["25o"]) >= 0) && (llListFindList(objects, ["33o"]) >= 0)))))
            {
                winner = 2;
                state win;
            }
            
            
            else
                state default;
    }
    
    listen(integer channel, string name, key id, string message)
    {   
            if(channel == -1)
                state reset;
    }
    
}

state win
{
    state_entry()
    {
  
        if(winner == 1)
            llSay(0, playerOne + " is the winner!");
        else if(winner == 2)
            llSay(0, playerTwo + " is the winner!");
        
        llSay(-5, "win");        
        llListen(-1, "", NULL_KEY, "");
    }
    
    listen(integer channel, string name, key id, string message)
    {   
            if(channel == -1)
                state reset;
    }
}

state draw
{
    state_entry()
    {
        llSay(0, "The game ends in a draw!");
    }
}

state reset
{
    state_entry()
    {
        objects = [];
        winner = 0;
        state default;
    }
}

