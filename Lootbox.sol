// Pseudocode/Example Solidity Contract
contract LootBox {
    mapping(uint => uint) public cosmeticSupply;  // Cosmetic ID -> Supply Count
    address cosmeticNFTContractAddress;

    // Initialize with Chainlink VRF setup
    constructor(address _cosmeticNFTContractAddress) {
        cosmeticNFTContractAddress = _cosmeticNFTContractAddress;
    }

    function openLootBox(uint rarityTier) public {
        // 1. Request random number from Chainlink VRF
        bytes32 requestId = requestRandomness(keyHash, fee);
        requests[requestId] = msg.sender;
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        // 2. Use randomness to select a cosmetic item based on rarity tier
        uint cosmeticId = calculateCosmetic(randomness);
        
        // 3. Update supply count
        require(cosmeticSupply[cosmeticId] > 0, "Out of stock");
        cosmeticSupply[cosmeticId]--;

        // 4. Mint the NFT
        CosmeticNFT(cosmeticNFTContractAddress).mint(requests[requestId], cosmeticId);
    }

    function calculateCosmetic(uint randomness) private view returns (uint) {
        // Implement logic to decide the cosmetic item based on randomness
    }
}
