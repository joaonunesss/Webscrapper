import requests
import pandas as pd
from bs4 import BeautifulSoup
import re


product_name = []
price_list = []
quantity_list = []
discount_list = []
prize_list = []
url_list = []
pid_list = []

url = "https://www.continente.pt/bebidas-e-garrafeira/champanhe-e-espumante/?start=0&srule=FOOD-Bebidas&pmin=0.01"

r = requests.get(url)
soup_range = BeautifulSoup(r.text, "lxml")

range_limits = soup_range.find("div", class_="search-results-products-counter d-flex justify-content-center")

text = range_limits.text

integers = re.findall(r'\d+', text)
integers = [int(number) for number in integers]

pages_float =integers[1] / integers[0] + 2

pages = int(pages_float)

print(pages)

for i in range(1, pages):

    r = requests.get(url)
    soup = BeautifulSoup(r.text, "lxml")

    block = soup.find_all("div", class_="col-12 col-sm-3 col-lg-2 productTile")

    for i in block:

        name_final = i.find("a", class_="pwc-tile--description col-tile--description")
        if (name_final == None):
            name = "n/a"
        else:
            name = name_final.text
        product_name.append(name)

        price_final = i.find("span", class_="ct-price-formatted")
        if (price_final == None):
            price = "n/a"
        else:
            price = price_final.text
        price_list.append(price.strip("\n \t\r\v"))


        quantity_final = i.find("p", class_= "pwc-tile--quantity col-tile--quantity")
        if (quantity_final == None):
            quantity = "n/a"
        else:
            quantity = quantity_final.text
        quantity_list.append(quantity)


        discount_final = i.find("span", class_="ct-product-tile-badge-value--pvpr col-product-tile-badge-value--pvpr")
        if ( discount_final == None):
            discount = "n/a"
        else:
            discount = discount_final.text
        discount_list.append(discount.strip("\n \t\r\v"))


        prize_final = i.find("div", class_="ct-product-tile-badge ct-product-tile-badge--general")
        if ( prize_final == None):
            prize = "n/a"
        else:
            prize = "premiado"
        prize_list.append(prize)


        url_final = i.select_one("a", class_="pwc-tile--description col-tile--description").get('href')
        if ( url_final == None):
            url = "n/a"
        else:
            url = url_final
        url_list.append(url)


        pid_final = i.find("div", class_="product").get('data-pid')
        if ( pid_final == None):
            pid = "n/a"
        else:
            pid = pid_final
        pid_list.append(pid)

    next_page_item = soup.find("div", class_="search-view-more-products-btn-wrapper infinite-scroll-placeholder")

    try:
        next_page = next_page_item.get("data-url")
    except:
        break

    url = next_page


df = pd.DataFrame({"Product Name":product_name, "Price": price_list, "Quantity": quantity_list, "Discount": discount_list, "Prize badge": prize_list, "Product Link": url_list, "Product pid": pid_list})

#print(df)

df.to_csv("Continente_all_espumante_final.csv")