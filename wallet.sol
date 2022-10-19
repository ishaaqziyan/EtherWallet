pragma solidity 0.8.17;
pragma abicoder v2;

// Only to be run on Remix//

contract Wallet {
        address[] public owners;
        unit limit;
        
        struct Transfer{
         uint amount;
         address payable receiver;
         uint approvals;
         bool HasBeensent;
         unit id;
 }
 
 event TransferRequestCreated (unit _id, uint _amount, address _initiator, address _receiver);
 event ApprovalReceived (unit _id, uont _approvals, address_approver);
 event TransferApproved(uint_id);
 
 Transfer[]transferRequests;
 
 mapping (address => mapping (uint => bool)) approvals;
 
 // This allows only people in the owners list to continue administrative rights
 modifier onlyOwners(){
 bool owner =false;
 for (uint i=0; i<owners.length; i++)
      { if (owners[i}== msg.sender)
          {owner=true;
          }
       }
    require (owner==true);
    _;
 }
 // Initialization of the owners list and the limit
 constructor (address[] memory _owners, unit _limit){
     owners= _owners;
     limit= _limit;
   }
   
   //The payable function
   function deposit(0 public payable{}
   
   // Create the instance of the transfer struct and add it to the transfer function
   function createTransfer(uint _amount, address payable _receiver) public onlyOwners
             {
    emit TransferRequestCreated (transferRequests.length, _amount, msg.sender, _reciever);
    transferRequests.push(
             transfer (_amount, _receiver,0 ,false, transferRequests.length));
             }
             
     //Set your approval for one of the transfer requests
     //Need to update the transfer object.
     //Need to update the mapping to record the approval for msg.sender
     //When the amount of approvals for a transfer has reached its limit, this function should send the transfer to the rightful receiver.
     //An owner cannot vote twice
     //An owner cannot do the same transfer twice.
     
     function approve(uint _id) public OnlyOwners{
         require(approvals[msg.sender][_id]== false;
         require(transferRequests[_id].hasBeeSent == false);
         
         approvals[msg.sender][_id]=true;
         transferRequests[_id].aprovals++;
         emit ApprovalReceived (_id, transferrequests[_id].approvals, msg.sender);
         
         if (transferRequests [_id].approvals>=limit)
         {
           transferRequests{_id}hasBeensent=true;
           transferRequests[_id].receiver,transfer(transferRequests{_id}.amount);
           emit TransferApproved(_id);
         }
       }
       
       //must return all transfer requests
       function getTransferRequets() public view returns (Transfer[] memory){
       return transferRequests;
          
         
     
     
             
             
    
