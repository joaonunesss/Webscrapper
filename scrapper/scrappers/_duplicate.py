from sqlalchemy import create_engine, text

connection_string = "mysql+mysqlconnector://sogrape:hackaton42sogrape@127.0.0.1:3306/sogrape"
engine = create_engine(connection_string, echo=True)



def duplicate():
    with engine.connect() as connection:
        query = text("SELECT * FROM product_entries WHERE DATE(updated_at) = DATE(curdate())")
        entries = connection.execute(query)
        total = 0
    
    for product in entries.mappings():
        total = total + 1

        dup = {}
        dup['price'] = product["price"]
        dup['url'] = product["url"]
        dup['product_id'] = product["product_id"]
        dup['store_id'] = product["store_id"]
        dup['product_name'] = product["product_name"]
        dup['currency'] = product["currency"]
        dup['year'] = product["year"]
        dup["created_at"] = product["created_at"].replace(day=3).strftime('%Y-%m-%d %H:%M:%S')
        dup["updated_at"] = product["updated_at"].replace(day=3).strftime('%Y-%m-%d %H:%M:%S')
        # print(dup)
        # print("total: ", total, "ID:", product["id"], "Product:" , product["product_name"], "created_at:", product["created_at"].replace(day=29), "updated_at:", product["updated_at"].replace(day=29))
        
        # sql = text("INSERT INTO product_entries (created_at, updated_at, price, url, product_id, store_id, product_name, currency, year) VALUES (:created_at, :updated_at, :price, :url, :product_id, :store_id, :product_name, :currency, :year)")
        # with engine.connect() as connection:
        #     connection.execute(sql, dup)
        #     connection.commit()

duplicate()