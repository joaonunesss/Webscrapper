import requests
import json
from bs4 import BeautifulSoup

headers = {
'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101 Firefox/100.0'
 }

def	scrapper(ean, url):
	response = requests.get(url + ean, headers=headers, timeout=10)
	
	soup = BeautifulSoup(response.text, 'html.parser')
	product_div = soup.find('div', class_='product')
	if product_div is None:
		print("Product not found")
		return None
	product_name = product_div.find('a', class_='pwc-tile--description col-tile--description')
	product_price = product_div.find('span', class_='ct-price-formatted') 
	product_discount = product_div.find("span", class_="ct-product-tile-badge-value--pvpr col-product-tile-badge-value--pvpr")
	print(product_discount.strip())
	if product_name is None or product_price is None:
		print("Product not found")
		return None
	value = {
			"name" : product_name.text.strip(),
			"price" : float(product_price.text.strip()[1:].replace(',','.')),
			"url" : (url + ean),
			"currency" : product_price.text.strip()[0]
			}
	return value

def test():
    scrapper("5601012001310", "https://www.delhaize.be/shop/search?q=")


test()