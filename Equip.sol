// Example Equip Contract
contract EquipManager {
    mapping(uint => uint) public characterToEquippedCosmetic;

    function equipCosmetic(uint characterId, uint cosmeticId) public {
        // Ensure only the owner of the character can equip cosmetics
        require(ownerOf(characterId) == msg.sender, "Not the owner");

        // Equip the cosmetic
        characterToEquippedCosmetic[characterId] = cosmeticId;
    }

    function unequipCosmetic(uint characterId) public {
        require(ownerOf(characterId) == msg.sender, "Not the owner");
        delete characterToEquippedCosmetic[characterId];
    }
}
