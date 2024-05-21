import requests
from bs4 import BeautifulSoup

#https://www.continente.pt/pesquisa/?q=5601012004427

headers = {
			'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101 Firefox/100.0'
		  }


		#discount_final = i.find("span", class_="ct-product-tile-badge-value--pvpr col-product-tile-badge-value--pvpr")
		#if ( discount_final == None):
		 #   discount = "n/a"
		#else:
		  #  discount = discount_final.text
		#discount_list.append(discount.strip("\n \t\r\v"))


def scrapper_continente(ean):
	print('\n Continente \n')
	url = 'https://www.continente.pt/pesquisa/?q='
	response = requests.get(url + ean, headers=headers)
	
	soup = BeautifulSoup(response.text, 'html.parser')
	product_div = soup.find('div', class_='product')
	if product_div is None:
		print("Product not found")
		return None
	product_name = product_div.find('a', class_='pwc-tile--description col-tile--description')
	product_price = product_div.find('span', class_='ct-price-formatted') 
	product_discount = product_div.find("span", class_="ct-product-tile-badge-value--pvpr col-product-tile-badge-value--pvpr")
	print(product_discount.text)
	if product_name is None or product_price is None:
		print("Product not found")
		return None
	value = {
			"name" : product_name.text.strip(),
			"price" : float(product_price.text.strip()[1:].replace(',','.')),
			"url" : (url + ean),
			"currency" : product_price.text.strip()[0]
			}
	
	if product_discount != None:
		value["discount"] = 1
	else:
		value["discount"] = 0
	print(value["discount"])
	return value
	# Print the contents of the div
	#print(product_name.text)  
	#print(product_price.text.strip())

def scrapper_garrafeira(ean):
	print('\n Garrafeira Soares \n')
	url = 'https://www.garrafeirasoares.pt/pt/resultado-da-pesquisa_36.html?term='
	response = requests.get(url + ean, headers=headers)
	url = response.text.split('\'')[1]
	response = requests.get(url, headers=headers)
	
	soup = BeautifulSoup(response.text, 'html.parser')
	product_name = soup.find('div', class_='name clearfix')
	print(product_name.text)
	product_price = soup.find('span', class_='current')
	print(product_price.text)
	product_discount = soup.find("p", class_="discount")
	if product_name is None or product_price is None:
		print("Product not found")
		return None
	value = {
			"name" : product_name.text.strip(),
			"price" : float(product_price.text.strip().split(' ')[0].replace(',','.')),
			"url"   : (url + ean),
			"currency" : product_price.text.strip().split(' ')[1]
			}
	print(product_price.text)
	if product_discount != None:
		value["discount"] = 1
	else:
		value["discount"] = 0
	print(value["discount"])
	
	return value
	# Print the contents of the div
	#print(product_name.text.strip())  
	#print(product_price.text.strip())
	
def scrapper_elcorteingles(ean):
	print('\n El Corte Ingles \n')
	url = 'https://www.elcorteingles.pt/supermercado/bebidas/pesquisar/?term='
	response = requests.get(url + ean, headers=headers)

	soup = BeautifulSoup(response.text, 'html.parser')
	#print(soup)
	product_name = soup.find('h3', class_='product_tile-description')
	print(product_name.text)
	product_price = soup.find('div', class_='prices-price _current')
	if product_price == None:
		product_price = soup.find('div', class_='prices-price _offer')
	print(product_price.text)
#couldn't find an example with a product on sale (8033064360140) that runing the file returns Product not found
	product_discount = soup.find("span", class_='badge js-auto-tooltip')
	if product_name is None or product_price is None:
		print("Product not found")
		return None
	value = {
			"name" : product_name.text.strip(),
			"price" : float(product_price.text.strip().split(' ')[0].replace(',','.')),
			"url"   : (url + ean),
			"currency" : product_price.text.strip().split(' ')[1]
			}
	if product_discount != None:
		value["discount"] = 1
	else:
		value["discount"] = 0
	print(value["discount"])
	
	return value
	# Print the contents of the div
	#print(product_name.text.strip())
	#print(product_price.text.strip())


def scrapper_auchan(ean):
	print('\n Auchan \n')
	url = 'https://www.auchan.pt/pt/pesquisa?q='
	response = requests.get(url + ean, headers=headers)

	soup = BeautifulSoup(response.text, 'html.parser')
#	print(soup)
	product_name = soup.find('a', class_='link')
	print(product_name.text)
	price = soup.find('span', class_='sales')
	product_price = price.find('span', class_='value')
	print(product_price.text.strip())
	product_discount = soup.find("div", class_='auc-promo--discount--red')
	if product_name is None or product_price is None:
		print("Product not found")
		return None
	value = {
			"name" : product_name.text.strip(),
			"price" : float(product_price.text.strip().split(' ')[0].replace(',','.')),
			"url"   : (url + ean),
			"currency" : product_price.text.strip().split(' ')[1]
			}
	if product_discount != None:
		value["discount"] = 1
	else:
		value["discount"] = 0
	print(value["discount"])
	
	return value
	#Print the contents of the div
#	print(product_name)



def teste():
	print("trinca bolotas----------------\n")
	#scrapper_continente("5601012004427")
	scrapper_garrafeira("5601012004427")
	scrapper_garrafeira("5601194102683")
	scrapper_elcorteingles("5601012004427")
	scrapper_elcorteingles("5606710563108")
	scrapper_auchan("5602168003418")
	scrapper_auchan("5601012004427")
	#print("\n\npapa figos----------------\n")
	#scrapper_continente("5601012011920")
	#scrapper_garrafeira("5601012011920")
	#scrapper_elcorteingles("5601012011920")
	#print("\n\nMateus sparkling----------\n")
	#scrapper_continente("5601012001310")
	#scrapper_garrafeira("5601012001310")
	#scrapper_elcorteingles("5601012001310")
	#print("\n\nMateus rose --------------\n")
	#scrapper_continente("5601012011500")
	#scrapper_garrafeira("5601012011500")
	#scrapper_elcorteingles("5601012011500")

teste()
