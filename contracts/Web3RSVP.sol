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

    address[] memory confirmedRSVPs;
    address[] memory claimedRSVPs;

    idToEvent[eventId] = CreateEvent(
        eventId,
        eventName,
        msg.sender,
        eventTimestamp,
        deposit,
        maxCapacity,
        confirmedRSVPs,
        claimedRSVPs,
        false
    )

    function createNewRSVP(bytes32 eventId) external payable {
        CreateEvent storage myEvent = idToEvent[eventId]

        require(msg.value == myEvent.deposit, "NOT ENOUGH");

        require(block.timestamp <= myEvent.eventTimestamp, "Already happened")

        require(myEvent.confirmedRSVPs.length < myEvent.maxCapacity, "This event has reached capacity");

        for (uint8 i = 0, i < myEvent.confirmedRSVPs.lengths; i++) {
            require(myEvent.confirmedRSVPs[i] != msg.sender, "Already confirmed");
        }

        myEvent.confirmed.push(payable(msg.sender))
    }
}