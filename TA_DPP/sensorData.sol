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

    // //threshold value set by government
    uint public threshold=10;

    mapping(address => SensorData) public sensorDataArray;
    address payable [] public sensorAddresses;


    function addSensorData (uint _sensorId, string memory _sensorName, string memory _sensorType, string memory _sensorInfo, uint  _gatewayID) 
        public
        payable
        // checkTimeAfter(startTime)
        // checkTimeBefore(setupEnd)
        returns(bool setupAuctionSuccess)
    {
        require (sensorAddresses.length >= 0 && sensorAddresses.length <= threshold);
        require (msg.value >=  1 );
        sensorDataArray[msg.sender].sensorId = _sensorId;
        sensorDataArray[msg.sender].sensorInfo = _sensorInfo;
        sensorDataArray[msg.sender].sensorName = _sensorName;
        sensorDataArray[msg.sender].sensorType = _sensorType;
        sensorDataArray[msg.sender].gatewayID = _gatewayID;
        sensorDataArray[msg.sender].deposit = msg.value;
        sensorAddresses.push(msg.sender);
        return true;        
    }

//get all data stream count
    function getDataStreamCount() public view returns(uint) {
        return sensorAddresses.length;
    }


//get current sensor threshold value set
    function getSensorThresholdValue() public view returns(uint) {
        return threshold;
    }


//set sensor threshold value set
    function setSensorThresholdValue(uint newthreshold) public  {
       threshold=newthreshold;
    }

// set a sensor register function so that only registered sensors can submit data
    function sensorRegister() public  {
    }

// set a time window for sensors to submit data
    function submitTime() public  {
    }

// set requirement so that same data will not come in
    function checkDuplicate() public  {
    }

// set deposit threshold that only sensors who submit the deposit can submit new data
    function checkDeposit() public  {
    }
}





