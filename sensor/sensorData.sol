pragma solidity > 0.4.4;

contract SensorData {
    /*
    //   Define a data structure to store sensor data
    // */
    struct SensorData {
        // ID of the sensor
        uint sensorId;
        // Name of the sensor
        string sensorName;
        // Type of the sensor
        string sensorType;
        // Sensor infomation
        string sensorValue;
        // Gateway ID of the sensor
        uint gatewayID;
        // Sensor deposit
        uint deposit; 
        // Unix time stamp
        uint timeStamp;
    }

    // Sensor data mapping
    mapping(uint => SensorData) public sensorDataArray;
    uint[] public dataID;

    // Sensor addresses
    address payable [] public sensorAddresses;


    /*
    //   Define an add sensor data function
    // */
    function addSensorData (uint _dataID, uint _sensorId, string memory _sensorName, string memory _sensorType, string memory _sensorValue, uint  _gatewayID) 
        public
        payable
        returns(bool setupAuctionSuccess)
    {
        require (sensorAddresses.length >= 0);
        sensorDataArray[_dataID].sensorId = _sensorId;
        sensorDataArray[_dataID].sensorName = _sensorName;
        sensorDataArray[_dataID].sensorType = _sensorType;
        sensorDataArray[_dataID].sensorValue = _sensorValue;
        sensorDataArray[_dataID].gatewayID = _gatewayID;
        sensorDataArray[_dataID].deposit = msg.value;
        sensorDataArray[_dataID].timeStamp = now;
        sensorAddresses.push(msg.sender);
        return true;        
    }

// Get sensor numbers
    function getSensorNumber() public view returns(uint) {
        return sensorAddresses.length;
    }

}