// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Web3RSVP {
    struct CreateEvent {
        bytes32 eventId;
        string eventDataCID;
        address eventOwner;
        uint256 eventTimestamp;
        uint256 deposit;
        uint256 maxCapacity;
        address[] confirmedRSVPs;
        address[] claimedRSVPs;
        bool paidOut;
    }

    mapping(bytes32 => CreateEvent) public idToEvent

    function createNewEvent(
        uint256 eventTimestamp,
        uint256 deposit,
        uint256 maxCapacity,
        string calldata eventDataCIDs
    ) external {
        bytes32 evenId = keccak256(
            abi.encodePacked(
                msg.sender,
                address(this),
                eventTimestamp,
                deposit,
                maxCapacity
            )
        )
    }
}