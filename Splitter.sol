pragma solidity ^0.4.18;

// Each deployed Splitter contract has a constant array of recipients.
// When the Splitter receives Ether, it will immediately divide this Ether up
// and send it to the recipients.
contract Splitter
{
	address[] public recipients;
	
	function Splitter(address[] _recipients) public
	{
	    require(_recipients.length >= 1);
		recipients = _recipients;
	}
	
	function() payable public
	{
		uint256 amountOfRecipients = recipients.length;
		uint256 etherPerRecipient = msg.value / amountOfRecipients;
		
		if (etherPerRecipient == 0) return;
		
		for (uint256 i=0; i<amountOfRecipients; i++)
		{
			recipients[i].transfer(etherPerRecipient);
		}
	}
}
