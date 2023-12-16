# icp_learning

## Lesson 1

```bash
export PATH=$HOME/bin:$PATH
dfx new mysite --no-frontend
dfx start --background
dfx stop
dfx deploy

dfx deploy --network=ic --with-cycles 1000000000000

dfx identity get-principal 
dfx identity get-wallet --network=ic
dfx wallet --network=ic balance
```