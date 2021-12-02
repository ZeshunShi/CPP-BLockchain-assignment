pragma solidity > 0.4.4;

contract SensorDataTest {
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
        // Other sensor infomation
        string sensorInfo;
        // Gateway ID of the sensor
        uint gatewayID;
        // Sensor deposit
        uint deposit; 
    }

    // sensor data mapping
    mapping(address => SensorData) public sensorDataArray;
    address payable [] public sensorAddresses;


    /*
    //   Define an add sensor data function
    // */
    function addSensorData (uint _sensorId, string memory _sensorName, string memory _sensorType, string memory _sensorInfo, uint  _gatewayID) 
        public
        payable
        // checkTimeAfter(startTime)
        // checkTimeBefore(setupEnd)
        returns(bool setupAuctionSuccess)
    {
        require (sensorAddresses.length >= 0);
        require (msg.value >=  1);
        sensorDataArray[msg.sender].sensorId = _sensorId;
        sensorDataArray[msg.sender].sensorInfo = _sensorInfo;
        sensorDataArray[msg.sender].sensorName = _sensorName;
        sensorDataArray[msg.sender].sensorType = _sensorType;
        sensorDataArray[msg.sender].gatewayID = _gatewayID;
        sensorDataArray[msg.sender].deposit = msg.value;
        sensorAddresses.push(msg.sender);
        return true;        
    }

// get all data stream count
    function getDataStreamCount() public view returns(uint) {
        return sensorAddresses.length;
    }

// set a sensor register function so that only registered sensors can submit data
    function sensorRegister() public  {
    }

}





