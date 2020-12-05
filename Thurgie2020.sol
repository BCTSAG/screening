pragma solidity ^0.4.26;


contract Thurgie2020 {

  struct EntityStruct {
    uint entityData;
    uint listPointer;
    string entityStatus;
    string entityAnlage;
  }

  mapping(address => EntityStruct) public entityStructs;
  address[] public entityList;

  function isEntity(address entityAddress) public constant returns(bool isIndeed) {
    if(entityList.length == 0) return false;
    return (entityList[entityStructs[entityAddress].listPointer] == entityAddress);
  }

  function getEntityCount() public constant returns(uint entityCount) {
    return entityList.length;
  }

  function newEntity(address entityAddress, uint entityData, string entityAnlage, string entityStatus) public returns(bool success) {
    if(isEntity(entityAddress)) throw;
    entityStructs[entityAddress].entityData = entityData;
    entityStructs[entityAddress].entityAnlage = entityAnlage;
    entityStructs[entityAddress].entityStatus = entityStatus;
    entityStructs[entityAddress].listPointer = entityList.push(entityAddress) - 1;
    return true;
  }

  function updateEntity(address entityAddress, uint entityData) public returns(bool success) {
    if(!isEntity(entityAddress)) throw;
    entityStructs[entityAddress].entityData = entityData;
    return true;
  }

  function updateEntityStatus(address entityAddress, string entityStatus) public returns(bool success) {
    if(!isEntity(entityAddress)) throw;
    entityStructs[entityAddress].entityStatus = entityStatus;
    return true;
  }


}
