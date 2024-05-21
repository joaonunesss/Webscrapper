import requests
import json
from bs4 import BeautifulSoup

headers = {
'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101 Firefox/100.0'
 }

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
	soup = soup.find("div", {"class": "product_tile-image"})
	if soup:
		soup = soup.find("a").get("href")
		url = "https://www.elcorteingles.pt" + soup
	
	# Search for the product content within the url found
	if not url:
		return None
	response = requests.get(url, headers=headers, timeout=10)
	if not response:
		return None
	soup = BeautifulSoup(response.text, "html.parser")
	script_tag = soup.find_all("script", {"type": "application/ld+json"})
	arr = list(map(lambda x: json.loads(x.string), script_tag))
	product_data = None
	for item in arr:
		if "@type" in item.keys() and item["@type"] == 'Product':
			product_data = item
			break
	if not product_data:
		return None
	product = {}
	try:
		product["name"] = product_data["name"]
		product["description"] = product_data["description"]
		product["brand"] = product_data["brand"]
		product["price"] = product_data["offers"]["price"]
		product["currency"] = product_data["offers"]["priceCurrency"]
		product["url"] = url
	except:
		return None
	return product
