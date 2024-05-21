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

	url = None
	soup = soup.select("section#main div.products")

	if not len(soup):
		return None
	
	url = soup[0].find("a").get("href")
	# Search for the product content within the url found	
	if not url:
		return None
	response = requests.get(url, headers=headers, timeout=10)
	if not response:
		return None

	product = {}
	soup = BeautifulSoup(response.text, "html.parser")
	try:
		product["name"] = soup.find("meta", {"property": "og:title"}).get("content")
		product["description"] = soup.find("meta", {"property": "og:description"}).get("content")
		product["price"] = soup.find("meta", {"property": "product:price:amount"}).get("content")
		product["currency"] = soup.find("meta", {"property": "product:price:currency"}).get("content")
		product["url"] = url
	except:
		return None
	print(product)
	return product


# def test():
#     scrapper("56010120115", "https://www.portugalvineyards.com/pt/search?controller=search&s=")

# test()