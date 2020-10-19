pragma solidity > 0.5.0;

contract Voting {  

	struct candidate {       
		string name;
		address ads;       
		uint votes;   
	}    

	candidate[3] candidatelist;
    address owner;   

	constructor()
		public
	{
	    owner=msg.sender;       
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
	{
	    if (id<candidatelist.length) {
	    	candidatelist[id].votes+=1;	    	
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

    function killContract() 
    	public
	{
        if(owner==msg.sender){
            selfdestruct(owner);
        }
    }         

}