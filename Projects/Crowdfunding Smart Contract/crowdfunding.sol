// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
--> Manager starts a crowdfunding campaign 
--> Manager decodes the target, deadline and minimum Contribution
--> Minimum contribution is fixed by manager 
--> Contributors start putting min contribution (i.e 100 wei)
--> % of crowd agreed when to release the func
--> If Manager unable to collect the target or deadline, the amount revert to the contributors as Refund
--> manager will request for the fund to the contributors with a reason. on whose account, value to send
--> manager will check is the fund request people agreed, how many contributors agreed.
--> A check is required for numbers of request and on what.
--> Contributors can vote on the proposal/request
--> Manager will allocate the requested fund from crowdfund to the required address/proposal.
*/

contract crowdfunding {
    mapping(address => uint) public contributors;
    address public manager;                            // Need to assign manager
    uint public target;
    uint public deadline;
    uint public minimumContribution;
    uint public raisedAmount;                        // Need to check Raised Amount so to revert if not meet target
    uint public noOfContributors;                    // Need to check no of contributors so to have decision power to all not one
    
    struct Request{
        string description;
        address payable recipient;
        uint value;
        bool completed;
        uint noOfVoters;
        mapping(address=>bool) voters;
    }

    mapping(uint=>Request) public requests;
    uint public numRequests;
    
    constructor (uint _target, uint _deadline){
        target = _target;
        deadline = block.timestamp + _deadline;
        minimumContribution = 100 wei;
        manager = msg.sender;
    }

    function senEth() public payable{
        require(block.timestamp<deadline, "deadline is passed");
        require(msg.value>=minimumContribution, "Minimum contribution is not meet");

        if(contributors[msg.sender]==0){
            noOfContributors++;
        }
        contributors[msg.sender]+=msg.value;
        raisedAmount+=msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function refund() public {
        require(block.timestamp>deadline && raisedAmount<target, "You are not eligible for the refund");
        require(contributors[msg.sender]>0);
        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender]=0;
    }

    modifier onlyManager(){
        require(msg.sender==manager, "only manager can call this function");
        _;
    }

    function createRequests(string memory _description, address payable _recipient, uint _value) public onlyManager{
        Request storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description=_description;
        newRequest.recipient=_recipient;
        newRequest.value=_value;
        newRequest.completed=false;
        newRequest.noOfVoters=0;
    }

    function voteRequest(uint _requestNo) public{
        require(contributors[msg.sender]>0, "You must contribute to be a voter");
        Request storage thisRequest=requests[_requestNo];
        require(thisRequest.voters[msg.sender]==false, "you have already voted");
        thisRequest.voters[msg.sender]=true;
        thisRequest.noOfVoters++;
    }

    function makePayment(uint _requestNo) public onlyManager{
        require(raisedAmount>=target);
        Request storage thisRequest = requests[_requestNo];
        require(thisRequest.completed==false, "The request has been completed");
        require(thisRequest.noOfVoters>noOfContributors/2, "Majority does not suport");
        thisRequest.recipient.transfer(thisRequest.value);
        thisRequest.completed=true;
    }
}

