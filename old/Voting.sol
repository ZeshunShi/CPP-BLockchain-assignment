pragma solidity >0.5.0;
contract Voting1 {
    // define state of the candidate
   struct candidate {
       string name;
       address ads;
       uint   votes;
   }
   candidate[3] candidatelist;

   mapping(address => bool) public voterList;
   uint totalvoters;

   constructor() public{
       totalvoters=0;
   }

   function getCandidateNumber() public view returns(uint ){
       return candidatelist.length;
   }

   function getCandidate(uint id) public view returns(string memory){
       // start from 0
       
       if (id<candidatelist.length) {
           return candidatelist[id].name;
       }

   }

   /*
    * without return
    */ 
   function setCandidate(uint cid,string memory cname,address caddress) public {
       if (cid<candidatelist.length){
           candidatelist[cid].name=cname;
           candidatelist[cid].ads=caddress;
           candidatelist[cid].votes=0;
       }
   }

   /*
    * with return
    */
   function setCandidateWithReturn(uint cid, string memory cname, address caddress) public payable returns(uint res){
       /*
       res=cid; if it is ok;
       res=-1; cid outof the range
       */
       if (cid<candidatelist.length){
           candidatelist[cid].name=cname;
           candidatelist[cid].ads=caddress;
           candidatelist[cid].votes=0;
           res=1;
       }
       else{
           res=0;
       }
       return res;
   }

   /*
   * Without checking sender
   */
   function voteCandidate(uint id) public  {
       if (id<candidatelist.length)
            candidatelist[id].votes+=1;
   }

   /*
   *  checking sender
   */
   function voted(address ad) internal returns (bool){
       if (voterList[ad])
             return true;
       else return false;
   }

   function voteCandidateValidate(uint id) public payable {
       if (id<candidatelist.length && voted(msg.sender))
            candidatelist[id].votes+=1;
            voterList[msg.sender]=true;
            totalvoters+=1;
   }  
 
   function getVoteResults(uint id) public view returns(uint){
       if (id<candidatelist.length )
            return candidatelist[id].votes;
   }  
 
}
