# NFT Template
Smart contract template for your NFT project on ethereum.
## Clone repository.
```Python

git clone git@github.com:WrappedUsername/NftTemplate.git

```
## Yarn or npm i to install dependencies.
```Python

yarn

```
```Python

npm i

```
## Create .env file and update keys.
```Python

INFURA_API_KEY = 
ETHERSCAN_API_KEY = 
PRIVATE_KEY =

```
## Token id will start at 1.
```Solidity

 /// @dev Token id counter increments here to start the token count at 1 to match metadata.  
    constructor() ERC721("Your Project Name", "YPN") {
        _tokenIdCounter.increment();
    }

```
