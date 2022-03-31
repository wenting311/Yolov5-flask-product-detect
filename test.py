import pandas as pd
import pymysql
 
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='robin0311',
                             database='ai_retail',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

with connection:
    with connection.cursor() as cursor:
        # Read a single record
        sql = "SELECT `product_name`, `price` FROM `products1` WHERE `product_id`=2007203568243"
        cursor.execute(sql)
        result = cursor.fetchone()
        print(result)