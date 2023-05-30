// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.6.0;

import "https://github.com/provable-things/ethereum-api/blob/master/provableAPI.sol"; 

contract Oracle is usingProvable {

string public activity;

function getActivity() public {
provable_query("URL", "json(https://www.boredapi.com/api/activity/).activity");
}

function __callback(bytes32 _myid, string memory _result) public {
    require(msg.sender == provable.cbAddress());
    activity = _result;
__callback(_myid, _result, new bytes(0));
_myid;
}

}