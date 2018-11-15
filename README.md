# predictive deployment

```bash
git clone predictive-deployment
cd predictive-deployment
npm install --save ethers
clevis create Simple
```

Simple.sol:
```Solidity
pragma solidity ^0.4.24;

contract Simple {

  constructor(uint256 someArgument) public {
    emit Construct(tx.origin,msg.data,msg.sig,msg.sender,someArgument);
  }
  event Construct(address origin, bytes data, bytes4 sig, address sender,uint256 someArgument);

}
```

Let's compile and craft the counterfactual transaction:
```
clevis compile Simple
cd counterfactual
node craft.js "../contracts/Simple/Simple.abi" "../contracts/Simple/Simple.bytecode" 150000 100000000000 99999 | jq
```


Now let's deploy the contract with:
```
cd ..
clevis sendTo 0.025 0 **THE_FROM_ADDRESS**
node deploy ***
```


Next let's look at the event from the constructor:
```
echo 0 > contracts/Simple/Simple.blockNumber
echo **THE_ADDRESS_OF_CONTRACT** > contracts/Simple/Simple.address
clevis contract eventConstruct Simple
```
