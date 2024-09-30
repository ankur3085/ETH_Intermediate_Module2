// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract EventManagementSystem {
    address public organizer;

    struct Event {
        uint256 eventId;
        string name;
        uint256 date;
        uint256 maxRegistration;
        bool isCancelled;
    }

    Event[] public events;
    mapping(uint256 => Event) public eventsMap;

    event EventAdded(uint256 indexed eventId, string name, uint256 date, uint256 maxRegistration);
    event EventUpdated(uint256 indexed eventId, string name, uint256 date, uint256 maxRegistration);
    event EventCancelled(uint256 indexed eventId);

    constructor() {
        organizer = msg.sender;
    }

    modifier onlyOrganizer() {
        require(msg.sender == organizer, "You are not the organizer");
        _;
    }

    function isDateAdded(uint256 _date) public view returns (bool) {
        for (uint256 i = 0; i < events.length; i++) {
            if (events[i].date == _date && !events[i].isCancelled) {
                return true;
            }
        }
        return false; 
    }

    function isIdPresent(uint256 _eventId) public view returns (bool) {
        for (uint256 i = 0; i < events.length; i++) {
            if (events[i].eventId == _eventId) {
                return true;
            }
        }
        return false; 
    }

    function addEvent(uint256 _eventId, string memory _name, uint256 _date, uint256 _maxRegistration) public onlyOrganizer {
        require(_date > block.timestamp, "Can not add Event for past dates");
        require(!isDateAdded(_date), "Slot already booked");
        require(!isIdPresent(_eventId), "Event Id already present");  

        Event memory newEvent = Event({
            eventId: _eventId,
            name: _name, 
            date: _date, 
            maxRegistration: _maxRegistration, 
            isCancelled: false 
        });
        events.push(newEvent);
        eventsMap[_eventId] = newEvent; 

        emit EventAdded(_eventId, _name, _date, _maxRegistration);
    }

    function updateEvent(uint256 _eventId, string memory _name, uint256 _date, uint256 _maxRegistration) public onlyOrganizer {
        require(isIdPresent(_eventId), "Event does not exist");
        
        for (uint256 i = 0; i < events.length; i++) {
            if (events[i].eventId == _eventId) {
                require(!events[i].isCancelled, "Event has been cancelled");
                require(_date > block.timestamp, "Can not add Event for past dates");

                events[i].name = _name;
                events[i].date = _date;
                events[i].maxRegistration = _maxRegistration;
                break;
            }
        }

        emit EventUpdated(_eventId, _name, _date, _maxRegistration);
    }

    function cancelEvent(uint256 _eventId) public onlyOrganizer {
        require(isIdPresent(_eventId), "Event does not exist");
        
        for (uint256 i = 0; i < events.length; i++) {
            if (events[i].eventId == _eventId) {
                require(!events[i].isCancelled, "Event has already been cancelled");
                events[i].isCancelled = true; 
                break;
            }
        }

        emit EventCancelled(_eventId);
    }

    function getEventList() public view returns (Event[] memory) {
        return events;
    }
    function clearEvents() public onlyOrganizer() {
        delete events;
    }

}
