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

	soup = soup.find("script")
	# ex <script>location='https://www.garrafeirasoares.pt/pt/portugal/vinhos/espumante-casal-garcia-rose-75-cl/item_1149.html?id=36&cat=0&pc=1'</script>
	
	url = None
	if soup:
		url = soup.string.split("\'")[1]
		
	# Search for the product content within the url found	
	if not url:
		return None
	
	response = requests.get(url, headers=headers, timeout=10)
	if not response:
		return None

	soup = BeautifulSoup(response.text, "html.parser")

	product = {}
	product["name"] = soup.find("meta", {"property": "og:title"}).get("content")
	product["description"] = soup.find("meta", {"property": "og:description"}).get("content")
	product["brand"] = soup.find("meta", {"itemprop": "brand"}).get("content")
	product["price"] = float(soup.find("meta", {"itemprop": "price"}).get("content"))
	product["currency"] = soup.find("meta", {"itemprop": "priceCurrency"}).get("content")
	product["url"] = url

	return product



# scrapper("5601012001310", "https://www.garrafeirasoares.pt/pt/resultado-da-pesquisa_36.html?term=")

