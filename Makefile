CHANNEL_NAME=mychannel


.PHONY: generatechannelandgenesisblock
generatechannelandgenesisblock:
	@export FABRIC_CFG_PATH=$PWD
	@cd ./fixture && cryptogen generate  --config ./crypto-config.yaml  --output  crypto-config
	@cd ./fixture && configtxgen  -profile SampleMultiNodeEtcdRaft  -outputBlock   ./channel-artifacts/genesis.block
	@cd ./fixture && configtxgen  -profile TwoOrgsChannel -outputCreateChannelTx   ./channel-artifacts/mychannel.tx      -channelID $(CHANNEL_NAME)
	@cd ./fixture && configtxgen  -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $(CHANNEL_NAME) -asOrg Org1MSP
	@cd ./fixture && configtxgen  -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $(CHANNEL_NAME) -asOrg Org2MSP


.PHONY: cleanFiles
cleanFiles:
	@rm -rf ./fixture/crypto-config
	@rm -rf ./fixture/channel-artifacts/*
	@docker volume prune -f
	@docker network prune -f

###########################################################


.PHONY: orderer-up
orderer-up:
	@docker-compose -f deployment/config/orderer0/docker-compose-orderer0.yaml up -d
	@docker-compose -f deployment/config/orderer1/docker-compose-orderer1.yaml up -d
	@docker-compose -f deployment/config/orderer2/docker-compose-orderer2.yaml up -d
	@docker-compose -f deployment/config/orderer3/docker-compose-orderer3.yaml up -d
	@docker-compose -f deployment/config/orderer4/docker-compose-orderer4.yaml up -d

.PHONY: orderer-down
orderer-down:
	@docker-compose -f deployment/config/orderer0/docker-compose-orderer0.yaml down
	@docker-compose -f deployment/config/orderer1/docker-compose-orderer1.yaml down
	@docker-compose -f deployment/config/orderer2/docker-compose-orderer2.yaml down
	@docker-compose -f deployment/config/orderer3/docker-compose-orderer3.yaml down
	@docker-compose -f deployment/config/orderer4/docker-compose-orderer4.yaml down

###########################################################

.PHONY: org-up
org-up:
	@docker-compose -f deployment/config/peer0org1/docker-compose-peer0org1.yaml up -d
	@docker-compose -f deployment/config/peer1org1/docker-compose-peer1org1.yaml up -d

.PHONY: org-down
org-down:
	@docker-compose -f deployment/config/peer0org1/docker-compose-peer0org1.yaml down
	@docker-compose -f deployment/config/peer1org1/docker-compose-peer1org1.yaml down
