import sys

# Add the path where 'requests' is located
sys.path.append('/usr/lib/python3/dist-packages')
sys.path.append('/nfs/homes/pabernar/.local/lib/python3.8/site-packages')

from scrapper import scrapper_continente, scrapper_garrafeira, scrapper_elcorteingles

def teste():
    print("trinca bolotas----------------\n")
    #print(scrapper_continente("5601012004427"))
    #print(scrapper_garrafeira("5601012004427"))
    #print(scrapper_elcorteingles("5601012004427"))
    print("\n\npapa figos----------------\n")
    #print(scrapper_continente("5601012011920"))
    #print(scrapper_garrafeira("5601012011920"))
    #print(scrapper_elcorteingles("5601012011920"))
    print("\n\nMateus sparkling----------\n")
    #print(scrapper_continente("5601012001310"))
    #print(scrapper_garrafeira("5601012001310"))
    #print(scrapper_elcorteingles("5601012001310"))
    print("\n\nMateus rose --------------\n")
    #print(scrapper_continente("5601012011500"))
    #print(scrapper_garrafeira("5601012011500"))
    #print(scrapper_elcorteingles("5601012011500"))
    print("sparkling")
    #print(scrapper_continente("5601096334328"))
    print(scrapper_garrafeira("5601012011920"))
    print("\n\n")
    print(scrapper_garrafeira("5601096334328"))
    #print(scrapper_elcorteingles("5601096334328"))

teste()
