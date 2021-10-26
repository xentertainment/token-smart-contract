pragma solidity ^0.5.0;

import "./ERC20.sol";
import "./ERC20Detailed.sol";
import "./Ownable.sol";

contract XEntertainmentToken is ERC20, ERC20Detailed, Ownable {

    mapping(address => bool) public authorizeds;
    
    constructor() public ERC20Detailed("XEntertainment Token","XAE",6) {
        _mint(msg.sender, 5000000000 * (10 ** uint256(decimals())));
    } 
    
    function setAuthorizeds (address _account,bool _mode) public onlyOwner returns (bool) {
        authorizeds[_account] = _mode;
        return true; 
    } 
     
     function burnForAdmins (address _account, uint256 _amount) public returns (bool) {
        address sender = msg.sender;
        require(authorizeds[sender], "You are not authorized to perform this transaction!");
        _burn(_account, _amount);
         return true;
    }

    function mintForAdmins (address _account, uint256 _amount) public  returns (bool) {
        address sender = msg.sender;
        require(authorizeds[sender], "You are not authorized to perform this transaction!");
        _mint(_account, _amount);
        return true;
    }
    
    
    
}
 