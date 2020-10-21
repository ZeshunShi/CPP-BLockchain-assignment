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

    enum State { Ready, Ended }
    State public VoteState;

    event VoteStateModified(address indexed _who, uint _time, State _newstate);

    modifier checkState(State _state){
        require(VoteState == _state, "The vote is not in the right state");
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
        VoteState = State.Ready;   
        emit VoteStateModified(msg.sender, now, State.Ready);
    }     

    function getCandidate(uint id)
        public 
        checkState(State.Ready)
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
        if (now > voteEndTime) {
            VoteState = State.Ended;
            emit VoteStateModified(msg.sender, now, State.Ended);

        }         
    }        

    function getVoteResults(uint id)
        public
        checkState(State.Ended)
        view
        returns(uint)
    {
        if (id<candidatelist.length) {
            return candidatelist[id].votes;         
        }            
    }         

}