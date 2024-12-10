// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
contract MyBook{
    string public title;
    uint16  public price;
    address public owner;
    bool public sold;
    


    function getBookDetails() public view returns(string memory,uint16){
        return (title,price);
    }
    function setBookDetails(string memory _title,uint16 _price)public{
        title = _title;
        price = _price;
        owner = msg.sender;
        sold = false;
    }
    function ethToWei(uint eval)public pure returns(uint){
        return (eval*1000000000000000000);
    }
    function buyBook() public payable {
        if(msg.value>=ethToWei(price)){
            uint bal=msg.value-ethToWei(price);
            if(bal>0)
                 payable (msg.sender).transfer(bal);
            owner = msg.sender;
            sold = true;

        }

    }
}