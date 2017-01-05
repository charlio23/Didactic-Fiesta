<?php
// Mutual fund info collection
// Source: Morningstar.es
// José Ballester, 12 Dec 2016

// Uses Simple HTML DOM Parser
include('inc/simple_html_dom.php');

/* 	Input: fund's ISIN as a GET variable
		Available options:
		- 'value' (default): last Net Asset Value (NAV)
		- 'change': last change in %
		- 'msid': Morningstar ID
		- 'date' : date of the last NAV */

if(!isset($_GET['isin'])) {
	echo "ISIN not provided.";
} else {
	$isin = $_GET['isin'];

	// Step 1: Getting MStar's fund code
	$html = str_get_html(file_get_contents("http://www.morningstar.es/es/funds/SecuritySearchResults.aspx?search=".$isin));
	$fundlink = $html->find('table[id=ctl00_MainContent_fundTable] td a', 0);
	if(!isset($fundlink)) {
		echo "ISIN not valid.";
	} else {
		$html = str_get_html(file_get_contents("https://www.morningstar.es".$fundlink->getAttribute("href")));
		$option = (isset($_GET['option']) ? $_GET['option'] : "");
		if($option == "date") {
			// Option 'date'
			$fundVLdate = $html->find('div[id=overviewQuickstatsDiv] table td[class="line heading"] span[class=heading]', 0)->innertext;
	  	echo substr($fundVLdate, 6);
		} else if($option == "change") {
			/// Option 'value' or default
			$fundVL = $html->find('div[id=overviewQuickstatsDiv] table td[class="line text"]', 1)->innertext;
			echo str_replace(",", ".", substr($fundVL, 5));
		} else {
			// Option 'value' or default
			$fundVL = $html->find('div[id=overviewQuickstatsDiv] table td[class="line text"]', 0)->innertext;
			echo str_replace(",", ".", substr($fundVL, 5));
		}
	}
}
?>
