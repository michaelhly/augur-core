pragma solidity 0.4.17;


import 'libraries/Typed.sol';
import 'reporting/IUniverse.sol';
import 'reporting/IMarket.sol';
import 'reporting/IRegistrationToken.sol';
import 'reporting/IReputationToken.sol';
import 'trading/ICash.sol';


contract IReportingWindow is Typed {
    function initialize(IUniverse _universe, uint256 _reportingWindowId) public returns (bool);
    function createNewMarket(uint256 _endTime, uint8 _numOutcomes, uint256 _numTicks, uint256 _feePerEthInWei, ICash _denominationToken, address _creator, address _designatedReporterAddress) public payable returns (IMarket _newMarket);
    function migrateMarketInFromSibling() public returns (bool);
    function migrateMarketInFromNibling() public returns (bool);
    function removeMarket() public returns (bool);
    function noteReport(IMarket _market, address _reporter, bytes32 _payoutDistributionHash) public returns (bool);
    function updateMarketPhase() public returns (bool);
    function getUniverse() public view returns (IUniverse);
    function getReputationToken() public view returns (IReputationToken);
    function getRegistrationToken() public view returns (IRegistrationToken);
    function getStartTime() public view returns (uint256);
    function getEndTime() public view returns (uint256);
    function getNumMarkets() public view returns (uint256);
    function getNumInvalidMarkets() public view returns (uint256);
    function getNumIncorrectDesignatedReportMarkets() public view returns (uint256);
    function getMaxReportsPerLimitedReporterMarket() public view returns (uint256);
    function getAvgReportingGasCost() public returns (uint256);
    function getAvgReportsPerMarket() public returns (uint256);
    function getNextReportingWindow() public returns (IReportingWindow);
    function getPreviousReportingWindow() public returns (IReportingWindow);
    function allMarketsFinalized() public view returns (bool);
    function checkIn() public returns (bool);
    function collectReportingFees(address _reporterAddress, uint256 _attoReportingTokens) public returns (bool);
    function triggerMigrateFeesDueToFork(IReportingWindow _reportingWindow) public returns (bool);
    function migrateFeesDueToFork() public returns (bool);
    function isContainerForRegistrationToken(Typed _shadyTarget) public view returns (bool);
    function isContainerForMarket(Typed _shadyTarget) public view returns (bool);
    function isDoneReporting(address _reporter) public view returns (bool);
    function isForkingMarketFinalized() public view returns (bool);
    function isDisputeActive() public view returns (bool);
}