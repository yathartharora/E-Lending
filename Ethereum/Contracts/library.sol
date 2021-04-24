pragma solidity >=0.7.0 <0.9.0;


contract Library{
    
    struct Book{
        string name;
        string dop;
        uint price;
    }
    
    bytes32  bid;
    mapping(address => mapping(bytes32 => bool)) public isRented;
    mapping(address => Book[]) public books;
    bytes32[] public a;
    
    function rent(bytes32 id) payable public{
        require(!isRented[msg.sender][id]);
    }
    
    function myUploads(string memory n, string memory dop, uint price) public{
        books[msg.sender].push(Book(n,dop,price));
        bid = sha256(bytes(n));
        a.push(bid);
        isRented[msg.sender][bid] = true;
    }
}