contract CosmeticNFT is ERC721 {
    uint nextTokenId = 1;
    mapping(uint => uint) public tokenIdToCosmeticId;

    function mint(address to, uint cosmeticId) external {
        _safeMint(to, nextTokenId);
        tokenIdToCosmeticId[nextTokenId] = cosmeticId;
        nextTokenId++;
    }
}
