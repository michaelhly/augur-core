pragma solidity 0.4.24;

import './IUniverse.sol';
import './IRepPriceOracle.sol';
import './IAuctionToken.sol';


contract IAuction is IRepPriceOracle {
    IAuctionToken public repAuctionToken; // The token keeping track of ETH provided to purchase the REP being auctioned off
    IAuctionToken public ethAuctionToken; // The token keeping track of REP provided to purchase the ETH being auctioned off
    function initialize(IUniverse _universe) public returns (bool);
    function recordFees(uint256 _feeAmount) public returns (bool);
    function getUniverse() public view returns (IUniverse);
    function getAuctionIndexForCurrentTime() public view returns (uint256);
}
