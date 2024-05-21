import requests
import json
from bs4 import BeautifulSoup
from babel.numbers import parse_decimal

headers = {
'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101 Firefox/100.0'
 }

# NOT FINISHED

def	scrapper(ean, url):
	# Search for the product's ean in the url
	url = url + ean + "&post_type=product"
	response = requests.get(url, headers=headers, timeout=10)
	if not response:
		return None
	soup = BeautifulSoup(response.text, "html.parser")
	if not soup:
		return None

	# Find the product URL from the search
	url = None
	search_links = soup.select(".shop-container .products .product .product-title a")
	if len(search_links) == 0:
		return None
	
	url = search_links[0].get("href")
	if not url:
		return None
	
	# Search for the product content within the url found
	response = requests.get(url, headers=headers, timeout=10)
	if not response:
		return None

	soup = BeautifulSoup(response.text, "html.parser")

	info_el = soup.select(".product-main .product-info")
	if len(info_el) == 0:
		return None
	
	product = {}
	try:
		product["url"] = url
		product["currency"] = "EUR" # store only supports EUR
		product["name"] = info_el[0].select("h1.product-title.product_title")[0].text
		price_raw = info_el[0].select(".price bdi")[0].text
		product["price"] = parse_decimal(price_raw.strip("€"), locale='pt_PT')
	except:
		return None
	
	return product



# def test():
#     scrapper("5601012001310", "https://garrafinhas.pt/?s=")

# test()
