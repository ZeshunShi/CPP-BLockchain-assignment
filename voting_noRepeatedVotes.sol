pragma solidity > 0.5.0;

contract Voting {  

	struct candidate {       
		string name;
		address ads;       
		uint votes;   
	}

	struct voter {
    		address addr;
		bool voted;	    	
    }
    mapping (address => voter) public voterPool;
	        

	candidate[3] candidatelist;   

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
		view 
		returns(string memory)
	{
		if (id<candidatelist.length) {           
			return candidatelist[id].name;      
	}   
	}   

	function voteCandidate(uint id)
		public
		payable  
	{
        require (voterPool[msg.sender].voted == false);
        require (msg.value >=  0.1 ether );
	    if (id<candidatelist.length) {
	    	candidatelist[id].votes+=1;
	    	voterPool[msg.sender].voted == true;	    	
	    }          
    }       

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
