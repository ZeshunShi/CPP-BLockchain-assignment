from web3 import Web3, HTTPProvider
from solc import compile_source
from web3.contract import ConciseContract

#Please replace with you actual web3 provider (for more info: http://web3py.readthedocs.io/en/stable/providers.html)
w3 = Web3(HTTPProvider('http://127.0.0.1:8545'))

#abi can be generated form the command line with solc or online with Remix IDE
abi = '''
[
    {
        "constant": false,
        "inputs": [
            {
                "name": "_sensorData",
                "type": "int256"
            }
        ],
        "name": "setSensorData",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "getSensorData",
        "outputs": [
            {
                "name": "",
                "type": "int256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "constructor"
    }
]
'''

#Replace with real deployed contract address
address = Web3.toChecksumAddress("0xeab01dba3ef110d5584f3315f2b3e4a86d04eb94")
StoreIntegerValue = w3.eth.contract(
    address, abi=abi, ContractFactoryClass=ConciseContract)

#Replace with real account address for raspi
raspi = 0x907c1a1c053ac1d01bda773b9a36b8ffd00c1cc4

#Example function to submit data to the block chain
def submitSensorData(data):
    #note that data must be an integer,
    StoreIntegerValue.setSensorData(int(data), transact={'from': raspi})