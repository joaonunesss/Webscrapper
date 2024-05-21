from sqlalchemy import create_engine, text
from utils.time import get_current_timestamp

connection_string = "mysql+mysqlconnector://sogrape:hackaton42sogrape@127.0.0.1:3306/sogrape"
engine = create_engine(connection_string, echo=True)

def insert_entry(new_entry):
	with engine.connect() as connection:
		query = text("SELECT * FROM product_entries WHERE store_id = :store_id AND product_id = :product_id AND DATE(updated_at) = DATE(curdate())")
		args = { "store_id": new_entry["store_id"], "product_id": new_entry["ean"] }
		old_entry = connection.execute(query, args).first()
		
		# Update old entry is already in DB
		if old_entry:
			print("has rows", old_entry._mapping["product_id"])
			sql = text("UPDATE product_entries SET updated_at = :updated_at, product_name = :product_name, price = :price, currency = :currency, url = :url, year = :year WHERE id = :id")
			args = {"id": old_entry._mapping['id'], "updated_at": get_current_timestamp(), "product_name": new_entry["name"],  "price": new_entry["price"], "currency": new_entry["currency"], "url": new_entry["url"], "year": new_entry["year"]}
			with engine.connect() as connection:
				connection.execute(sql, args)
				connection.commit()
		
		# Insert new entry
		else:
			sql = text("INSERT INTO product_entries (created_at, updated_at, price, url, product_id, store_id, product_name, currency, year) VALUES (:created_at, :updated_at, :price, :url, :ean, :store_id, :name, :currency, :year)")
			with engine.connect() as connection:
				connection.execute(sql, new_entry)
				connection.commit()