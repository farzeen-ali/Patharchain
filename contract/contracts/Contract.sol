// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MyContract {
    uint256 constant public MAX_STATUS_LENGTH = 150;
    //mapping
    mapping (address => string) public statuses;
    event StatusUpdated(address _user, string _status, uint _uat);
    function setStatus(string memory _status) public {
        require(bytes(_status).length <= MAX_STATUS_LENGTH, 'Status length is too long');
        statuses[msg.sender] = _status;
    emit StatusUpdated(msg.sender, _status, block.timestamp);
    }
    function getStatus(address _user) public view returns (string memory){
        string memory status = statuses[_user];
        if(bytes(status).length == 0) {
            return "No Status Found";
        }
        return status;
    }
}