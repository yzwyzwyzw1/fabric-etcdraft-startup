
# CLI

```
docker exec -it cli bash

export CHANNEL_NAME=mychannel
peer channel create -o orderer0.chinaso.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/mychannel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/chinaso.com/orderers/orderer0.chinaso.com/msp/tlscacerts/tlsca.chinaso.com-cert.pem 


peer channel join -b mychannel.block

peer chaincode install -n mycc -v 1.0 -p github.com/chaincode/chinaso02

peer chaincode instantiate -o orderer0.chinaso.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/chinaso.com/orderers/orderer0.chinaso.com/msp/tlscacerts/tlsca.chinaso.com-cert.pem -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":["init","a","100","b","200"]}' -P "OR ('Org1MSP.peer')"
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'

peer chaincode invoke -o orderer0.chinaso.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/chinaso.com/orderers/orderer0.chinaso.com/msp/tlscacerts/tlsca.chinaso.com-cert.pem -C $CHANNEL_NAME -n mycc  -c '{"Args":["invoke","a","b","10"]}'
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'

peer chaincode invoke -o orderer0.chinaso.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/chinaso.com/orderers/orderer0.chinaso.com/msp/tlscacerts/tlsca.chinaso.com-cert.pem -C $CHANNEL_NAME -n mycc  -c '{"Args":["delete","a"]}'
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'

```
















```bash
docker exec -it cli bash

export CHANNEL_NAME=mychannel
peer channel create -o orderer0.chinaso.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/mychannel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/chinaso.com/orderers/orderer0.chinaso.com/msp/tlscacerts/tlsca.chinaso.com-cert.pem
peer channel join -b mychannel.block

peer chaincode install -n mycc -v 1.0 -p github.com/chaincode/chinaso02

peer chaincode instantiate -o orderer0.chinaso.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/chinaso.com/orderers/orderer0.chinaso.com/msp/tlscacerts/tlsca.chinaso.com-cert.pem -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":["init","a","100","b","200"]}' -P "OR ('Org1MSP.peer')"
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'

peer chaincode invoke -o orderer0.chinaso.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/chinaso.com/orderers/orderer0.chinaso.com/msp/tlscacerts/tlsca.chinaso.com-cert.pem -C $CHANNEL_NAME -n mycc  -c '{"Args":["invoke","a","b","10"]}'
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'

peer chaincode invoke -o orderer0.chinaso.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/chinaso.com/orderers/orderer0.chinaso.com/msp/tlscacerts/tlsca.chinaso.com-cert.pem -C $CHANNEL_NAME -n mycc  -c '{"Args":["delete","a"]}'
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'
```

分析：

A与B之间的转账，进行了账本状态的修改，使得修改后的数据可以在练上持久化。



