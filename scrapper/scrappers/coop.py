import requests
import json
from bs4 import BeautifulSoup
from babel.numbers import parse_decimal

# TODO dont know how to import from subfolder
import sys
sys.path.append('..')
from utils import parser

headers = {
'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101 Firefox/100.0'
 }

# NOTE this website uses Angular and when the page first renders it has no content in the html body
# we must use a meta tag that has the data and extract it

def	scrapper(ean, url):
	# Search for the product's ean in the url
	url = url + ean
	response = requests.get(url, headers=headers, timeout=10)
	if not response:
		return None
	soup = BeautifulSoup(response.text, "html.parser")
	if not soup:
		return None

	# Find the product URL from the search
	url = None
	metatag = soup.find("meta", {"data-pagecontent-json":True})
	if not metatag:
		return None
	
	obj_data = parser.invalid_json(metatag['data-pagecontent-json'])
	if not obj_data:
		return None

	search_results = None
	for item_data in obj_data['anchors']:
		if item_data['anchor'] == "[data-product-container='searchresults']":
			search_results = item_data['json']['elements']
			break

	if len(search_results) == 0:
		return None
	
	product = {}
	try:
		product["url"] = "https://www.coop.ch" + search_results[0]['href']
		product["currency"] = "EUR" # forcing EUR
		product["name"] = search_results[0]['title']
		product["price"] = float(search_results[0]['price'])
	except:
		return None
	
	return product


# def test():
#     scrapper("5601012011500", "https://www.coop.ch/de/search/?text=")

# test()
