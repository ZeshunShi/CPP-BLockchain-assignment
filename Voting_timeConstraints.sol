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
        candidatelist[0].name = 'Peter';       
        candidatelist[0].ads = 0x68B87b5eb0908a23FC68788968a67A6d988aC255;       
        candidatelist[0].votes = 0;       
        candidatelist[1].name = 'George';       
        candidatelist[1].ads = 0x72f4752ba880387b3E4b1c229599E348A5381Cb1;       
        candidatelist[1].votes = 0;       
        candidatelist[2].name = 'Richard';       
        candidatelist[2].ads = 0x1727Fb67D31993494114d2fE171DC902085Cc323;       
        candidatelist[2].votes=0;   
        voteStartTime = now;
        voteEndTime = voteStartTime + 1 days;
    }     

    function getCandidate(uint id)
        public
        checkTimeAfter(voteStartTime)   
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