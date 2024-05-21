import requests
import json
from bs4 import BeautifulSoup

# ---------------------------------------------------------------------------- #
#                              Check Support Type                              #
# ---------------------------------------------------------------------------- #
def hasSchemaLdJsonItemList(soup):
	# get all script elements with ld+json
	script_tag = soup.find_all("script", {"type": "application/ld+json"})
	# create a list with the parsed objects of each element
	arr = list(map(lambda x: json.loads(x.string), script_tag))
	for item in arr:
		if "@type" in item.keys() and item["@type"] == 'ItemList':
			return True
	return False

def hasSchemaLdJsonProduct(soup):
	# get all script elements with ld+json
	script_tag = soup.find_all("script", {"type": "application/ld+json"})
	# create a list with the parsed objects of each element
	arr = list(map(lambda x: json.loads(x.string), script_tag))
	for item in arr:
		if "@type" in item.keys() and item["@type"] == 'Product':
			return True
	return False


def hasSchemaItemProp(soup):
	# NOTE this element is ONLY present in the product page and NOT in the search page
	price_element = soup.find("meta", itemprop="price")
	if price_element:
		return True
	return False


# TODO needs testing
def hasFacebookMetaTag(soup):
	# NOTE this element is ONLY present in the product page and NOT in the search page
	price_element = soup.find("meta", property="product:price:amount")
	if price_element:
		return True
	return False


# ---------------------------------------------------------------------------- #
#                              Page Verifications                              #
# ---------------------------------------------------------------------------- #
def isProductPage(soup):
	if hasSchemaItemProp(soup) or hasFacebookMetaTag(soup) or hasSchemaLdJsonProduct(soup):
		return True
	
	return False
	

def findProductURL(soup, url):
	# some sites when searching might redirect to that page if the search only had one result
	if isProductPage(soup):
		return url
	
	# we can only find the url with the type of ItemList
	# the other types its not possible to find the url of the product in a generic way
	if hasSchemaLdJsonItemList(soup):
		script_tag = soup.find_all("script", {"type": "application/ld+json"})
		arr = list(map(lambda x: json.loads(x.string), script_tag))

		for item in arr:
			if "@type" in item.keys() and item["@type"] == 'ItemList':
				return item["itemListElement"][0]["url"]
	
	# Product page not found (NO SCHEMA Support)
	return None

# ---------------------------------------------------------------------------- #
#                                 Base Scrapper                                #
# ---------------------------------------------------------------------------- #
def scrappeWithLdJson(soup):
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
		if script_tag: # Read data into dictionary
			product["name"] = product_data["name"]
			product["description"] = product_data["description"]
			product["brand"] = product_data["brand"]["name"]
			product["price"] = product_data["offers"]["price"]
			product["currency"] = product_data["offers"]["priceCurrency"]
	except:
		return None
	# Print dictionary for debug purposes
	print(product) 
	return product


def scrappeWithItemprop(soup):
	product = {}
	return product


def scrappeWithFBmetatag(soup):
	product = {}
	return product


def	scrapper(ean, url):
	# Search for the product's ean in the url
	url = url + ean
	response = requests.get(url)
	if not response:
		return None
	soup = BeautifulSoup(response.text, "lxml") # NOTE lxml parser is required
	if not soup:
		return None

	# Find the product URL from the search
	url = findProductURL(soup, url)
	if not url:
		return None
	
	response = requests.get(url)
	if not response:
		return None
	
	soup = BeautifulSoup(response.text, "lxml")
	
	if hasSchemaLdJsonProduct(soup):
		data = scrappeWithLdJson(soup)
		return data
	
	if hasSchemaItemProp(soup):
		data = scrappeWithItemprop(soup)
		return data
	
	if hasFacebookMetaTag(soup):
		data = scrappeWithFBmetatag(soup)
		return data
	
	return None

