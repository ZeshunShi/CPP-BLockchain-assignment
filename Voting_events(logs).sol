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
        candidatelist[0].name = 'Peter';       
        candidatelist[0].ads = 0x68B87b5eb0908a23FC68788968a67A6d988aC255;       
        candidatelist[0].votes = 0;       
        candidatelist[1].name = 'George';       
        candidatelist[1].ads = 0x72f4752ba880387b3E4b1c229599E348A5381Cb1;       
        candidatelist[1].votes = 0;       
        candidatelist[2].name = 'Richard';       
        candidatelist[2].ads = 0x1727Fb67D31993494114d2fE171DC902085Cc323;       
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