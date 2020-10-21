pragma solidity > 0.5.0;

contract Voting {  

    struct candidate {       
        string name;
        address ads;       
        uint votes;   
    }    

    candidate[3] candidatelist;  

    uint public voteStartTime; 
    uint public voteEndTime; 


    modifier checkTimeBefore(uint _time) 
    {   
        require(now < _time, "The time is not before the time point");
        _;          
    }
    modifier checkTimeAfter(uint _time)
    {    
        require(now > _time, "The time is not after the time point");
        _;          
    }

    constructor()
        public
    {       
        candidatelist[0].name='Peter';       
        candidatelist[0].votes=0;       
        candidatelist[1].name='George';       
        candidatelist[1].votes=0;       
        candidatelist[2].name='Richard';       
        candidatelist[2].votes=0;   
    }     

    function getCandidate(uint id)
        public
        checkTimeBefore(voteStartTime)   
        view 
        returns(string memory)
    {
        if (id<candidatelist.length) {           
            return candidatelist[id].name;      
    }   
    }   

    function voteCandidate(uint id)
        public
        checkTimeAfter(voteStartTime)
        checkTimeBefore(voteEndTime)  
    {
        if (id<candidatelist.length) {
            candidatelist[id].votes+=1;         
        }          
    }        

    function getVoteResults(uint id)
        public
        checkTimeAfter(voteEndTime)  
        view
        returns(uint)
    {
        if (id<candidatelist.length) {
            return candidatelist[id].votes;         
        }            
    }         

}