npx hardhat run --network goerli scripts/deploy.ts

### コンソールで動作確認

```
// コンソールの起動
npx hardhat console --network localhost
```

```
// デプロイ済みのコントラクトに接続
const Contract = await ethers.getContractFactory("MyNFTsNFT");
var contract = await Contract.attach([コントラクトのアドレス])

// contract.関数で、コントラクトの関数を実行できる
```

### Etherscan verify

```
npx hardhat clean
npx hardhat verify --network [ネットワーク名] [コントラクトのアドレス]
npx hardhat verify --network goerli [コントラクトのアドレス]
npx hardhat verify --network mainnet [コントラクトのアドレス]

```