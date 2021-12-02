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

    /*
      Define a data structure called voter, and define a mapping for all voters
    */
    struct voter {
        bool voted;         
    }
    mapping (address => voter) public voterPool;
            

    /* The constructor function of the contract */
    constructor()
        public
    {       
        /* Initialize three candidates; their names, addresses and votes */
        candidatelist[0].name = 'Peter';       
        candidatelist[0].ads = 0x68B87b5eb0908a23FC68788968a67A6d988aC255;       
        candidatelist[0].votes = 0;       
        candidatelist[1].name = 'George';       
        candidatelist[1].ads = 0x72f4752ba880387b3E4b1c229599E348A5381Cb1;       
        candidatelist[1].votes = 0;       
        candidatelist[2].name = 'Richard';       
        candidatelist[2].ads = 0x1727Fb67D31993494114d2fE171DC902085Cc323;       
        candidatelist[2].votes=0;    
    }     

    /* Get a specific candidate based on their id: 0-2 */
    function getCandidate(uint id)
        public 
        view 
        returns(string memory)
    {
        if (id<candidatelist.length) {           
            return candidatelist[id].name;      
    }   
    }   

    /* Vote a specific candidate. When a voter votes for a candidate, his voted status changes*/
    function voteCandidate(uint id)
        public
        payable  
    {
        require (voterPool[msg.sender].voted == false);
        require (msg.value >=  0.1 ether );
        if (id<candidatelist.length) {
            candidatelist[id].votes+=1;
            voterPool[msg.sender].voted = true;            
        }          
    }       

    /* Get the voting results of a specific candidate */
    function getVoteResults(uint id)
        public
        view
        returns(uint)
    {
        if (id<candidatelist.length) {
            return candidatelist[id].votes;         
        }            
    }         

}
