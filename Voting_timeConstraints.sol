pragma solidity > 0.5.0;

/* Define the smart contract Voting*/
contract Voting {  

    /*
      Define a data structure called candidate
    */
    struct candidate {       
        /* Name of the candidate */
        string name;
        /* The Blockchain address of the candidate. This is not directly used in 
         this contract, but please think about what can it be used for? */
        address ads;       
        /* Count the voting results of the candidate */
        uint votes;   
    }    

    /* The list of all candidates. The example we only accepts three candidates */
    candidate[3] candidatelist;   

    /* Define the vote start/end time variable */
    uint public voteStartTime; 
    uint public voteEndTime; 

    /* Define the modifier of checking the voting time */
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

    /* The constructor function of the contract */
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
        voteEndTime = voteStartTime + 1 hours;
    }     

    /* Get a specific candidate based on their id: 0-2 */
    function getCandidate(uint id)
        public
        checkTimeAfter(voteStartTime)
        checkTimeBefore(voteEndTime)     
        view 
        returns(string memory)
    {
        if (id<candidatelist.length) {           
            return candidatelist[id].name;      
        }   
    }   

    /* Vote a specific candidate */
    function voteCandidate(uint id)
        public
        checkTimeAfter(voteStartTime)
        checkTimeBefore(voteEndTime)  
    {
        if (id<candidatelist.length) {
            candidatelist[id].votes+=1;         
        }          
    }        

    /* Get the voting results of a specific candidate */
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