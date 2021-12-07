pragma solidity > 0.4.4;
// SPDX-License-Identifier: DPP2021

contract SensorDataBasis{
    /*
    //   Define a data structure to store sensor data
    // */
    struct dataSeries {

        // Other sensor infomation
        uint[] sensorValue;

        // Unix time stamp
        uint[] timeStamp;
    }
    struct SensorData {
        // Name of the sensor
        string sensorName;
        // Type of the sensor
        string sensorType;
        // Other sensor infomation
        dataSeries sensorDataSeries;
        // Gateway ID of the sensor
        uint gatewayID;
        // Sensor deposit
        uint deposit; 
    } 

    // Sensor data mapping
    mapping(uint => SensorData) public sensorDataArray;

    /*
    //   Define an add sensor data function
    // */
    function addSensorData (uint _sensorId, string memory _sensorName, string memory _sensorType, uint  _sensorValue, uint  _gatewayID) 
        public
        payable
        virtual
        returns(bool setupAuctionSuccess)
    {
        sensorDataArray[_sensorId].sensorName = _sensorName;
        sensorDataArray[_sensorId].sensorType = _sensorType;
        sensorDataArray[_sensorId].gatewayID = _gatewayID;
        sensorDataArray[_sensorId].deposit = msg.value;
        sensorDataArray[_sensorId].sensorDataSeries.timeStamp.push(block.timestamp);
        sensorDataArray[_sensorId].sensorDataSeries.sensorValue.push(_sensorValue);

        return true;        
    }

}

// Student should fill in the following smart contract, add a new function of getSensorData
contract SensorDataQuery is SensorDataBasis{
    // Students should provide the follow function
     // TO obtainthe sensor ofthe sensor ID
    function getSensorData (uint _sensorId, uint timebefore)
       public
       view
       returns(uint)
    {
       // Add code here, the sensor value meet the time requiremqnt should be returned. 
       // if it is not within the range (before the first data point), or otherinvalid situations, 0 will be returned. 
       return 0;
    }
}


// Student should fill in the following smart contract, add a new function of register sensor
// if possible, override any function from the high level smart contract
contract SensorDataRegister is SensorDataQuery{

    // add your new additional structure here

    // update the addSensorData function
    function addSensorData (uint _sensorId, string memory _sensorName, string memory _sensorType, uint  _sensorValue, uint  _gatewayID) 
        public
        virtual
        override
        payable
        returns(bool)
    {
        return true;
    }


     // add code of the following function
    function registerSensor (uint _sensorId, string memory _sensorName, string memory _sensorType, uint  _gatewayID)
       public
       payable
       returns(bool)
    {
        return true;
    }
 
}

// Student should fill in the following smart contract, update the addSensorData function, and to optimize the change of storage
// if possible, override any function from the high level smart contract
contract SensorDataRegisterOnlyDifferenceData is SensorDataRegister{

     // add code of the following function;
    function addSensorData (uint _sensorId, string memory _sensorName, string memory _sensorType, uint  _sensorValue, uint  _gatewayID) 
        public
        override
        virtual
        payable
        returns(bool)
    {
        return true;
    } 
}


// Student should fill in the following smart contract, update the addSensorData function, and to optimize the change of storage
// if possible, override any function from the high level smart contract
contract SensorDataRegisterOnlyDifferenceDataIPFS is SensorDataRegisterOnlyDifferenceData{

 
}
