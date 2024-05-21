from sqlalchemy import create_engine, text
from scrapper import scrapper_continente, scrapper_garrafeira, scrapper_elcorteingles
import datetime

connection_string = "mysql+mysqlconnector://sogrape:hackaton42sogrape@10.18.207.213:3306/sogrape"
engine = create_engine(connection_string, echo=True)

def main():
    with engine.connect() as connection:
        result = connection.execute(text("SELECT * FROM products"))

    # Get the current timestamp
    timestamp = datetime.datetime.now()
    # Format the timestamp as a string in the MySQL-compatible format
    mysql_timestamp = timestamp.strftime('%Y-%m-%d %H:%M:%S')

    for row in result.mappings():
        # Current Product
        print("\nEAN:", row["id"],"Product:" , row["name"], "Brand:", row["brand"])
        
        # Continente:
        continente = scrapper_continente(row["id"])
        if continente is not None:
            print("Name: ", continente["name"], " Price:", continente["price"])
            continente["created_at"] = mysql_timestamp
            continente["updated_at"] = mysql_timestamp
            continente["ean"] = row["id"]
            continente["store"] = "Continente"
            sql = text("INSERT INTO product_entries (created_at, updated_at, price, discount, url, product_id, store_name, product_name, currency) VALUES (:created_at, :updated_at, :price, :discount, :url, :ean, :store, :name, :currency)")
            with engine.connect() as connection:
                connection.execute(sql, continente)
                connection.commit()
        
        # Garrafeira
        garrafeira = scrapper_garrafeira(row["id"])
        if garrafeira is not None:
            print("Name: ", garrafeira["name"], " Price:", garrafeira["price"])
            garrafeira["created_at"] = mysql_timestamp
            garrafeira["updated_at"] = mysql_timestamp
            garrafeira["ean"] = row["id"]
            garrafeira["store"] = "Garrafeira Soares"
            sql = text("INSERT INTO product_entries (created_at, updated_at, price, url, product_id, store_name, product_name, currency) VALUES (:created_at, :updated_at, :price, :url, :ean, :store, :name, :currency)")
            with engine.connect() as connection:
                connection.execute(sql, garrafeira)
                connection.commit()
        
        # El Corte Ingles    
        elcorteingles = scrapper_elcorteingles(row["id"])
        if elcorteingles is not None:
            print("Name: ", elcorteingles["name"], " Price:", elcorteingles["price"])
            elcorteingles["created_at"] = mysql_timestamp
            elcorteingles["updated_at"] = mysql_timestamp
            elcorteingles["ean"] = row["id"]
            elcorteingles["store"] = "El Corte Inglés"
            sql = text("INSERT INTO product_entries (created_at, updated_at, price, url, product_id, store_name, product_name, currency) VALUES (:created_at, :updated_at, :price, :url, :ean, :store, :name, :currency)")
            with engine.connect() as connection:
                connection.execute(sql, elcorteingles)
                connection.commit()


if __name__ == "__main__":
    main()
