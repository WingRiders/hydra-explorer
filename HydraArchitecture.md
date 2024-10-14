## Hydra Head Architecture

In this file, you can find an introduction to Hydra, outlining its functionality, key advantages, and the core building blocks of this Layer 2 solution.

### Introduction

To understand Hydra, the first crucial piece of information is that the Hydra Head is a Layer 2 state channel open on top of the Cardano Layer 1 chain. Hydra enables a small group of users to send each other transactions off-chain, with the security guarantees being comparable to the robust Layer 1. To provide a simple definition, imagine Hydra as a separate "mini-blockchain" where transactions are carried out nearly instantly with high throughput.

### Participants and Hydra Head Lifecycle

The first phase of the Hydra Head lifecycle is opening the Hydra Head, by participants committing the funds by creating a transaction on the Cardano L1 network. After the Hydra Head is opened, the participants can submit transactions on the Hydra L2. This happens off-chain and they are shared only with other participants, not needing the global consensus, which allows the transaction wait time to be nearly zero, as mentioned in the previous section. Hydra nodes are operated by the participants. The Hydra node facilitates synchronization between participants to exchange transaction data and update the L2 state. Given, that this is not carried out on Layer 1, Hydra allows for fast transactions for nearly zero fees (nearly zero, because committing and closing head requires L1 transactions)

### Core services

As mentioned earlier, the core building block is the Hydra node. Without Hydra nodes, the participants would not be able to exchange transactions and communicate the current state changes with each other off-chain. However, there is one more necessary service and that is a Cardano Node. For the security guarantees of the L1, it is needed to also create transactions on the Cardano network when committing funds (given they are in L1 and need to be placed in the Hydra smart contract) and when closing a Hydra Head. For this use case, we can say the Cardano node acts as a "gateway" between Layer 1 and Layer 2 (in layman's terms).

### State Channels

We used the term "State Channels" in this documentation file already a few times, but what exactly is a "State Channel"? A state channel is like a private ledger shared between participants, allowing them to make multiple transactions without constantly interacting with the main blockchain. For any changes to be made, there needs to be a consensus (just the L2 participants, not the whole Cardano network), ensuring all participants have an up-to-date and consistent view of the off-chain state. These updates happen in real-time, so the latest state is always available to everyone in the channel.

### On-Chain Verification and Finality

While most interactions in a Hydra Head happen off-chain, certain key actions need to be confirmed on-chain to keep the system secure. For example, opening and closing a Hydra Head requires creating transactions on the main blockchain. When the Hydra Head closes, the final state is recorded back onto the Cardano blockchain, ensuring that all the off-chain transactions are properly reflected. Additionally, if a participant disagrees with the off-chain state at any point, they can initiate a dispute. This provides a way to prevent any fraudulent or incorrect updates.

### Scalability and Security

Hydra's design finds a balance between scalability and security. By keeping most transactions off-chain, Hydra Heads can handle a large number of transactions quickly and efficiently. At the same time, on-chain verification ensures that the final state remains accurate and protected from tampering. This makes Hydra a great fit for applications that need high transaction speeds without sacrificing security.

To sum it up, Hydra Head allows for fast, scalable, and low-cost transactions while keeping the security and integrity of the blockchain intact. It's a powerful way to boost Cardano's transaction capacity by using off-chain channels. Participants can carry out frequent, complex interactions without overloading the network, while still relying on the strong security and finality provided by the Cardano blockchain.
