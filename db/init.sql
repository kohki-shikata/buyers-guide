DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  username TEXT,
  email TEXT UNIQUE,
  password TEXT NOT NULL,
  icon_file TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  status TEXT,
  completed_at DATETIME,
  created_by INTEGER,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (created_by) REFERENCES Users(id)
);

DROP TABLE IF EXISTS Categories;
CREATE TABLE Categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT,
  description TEXT,
  jancode TEXT,
  url TEXT,
  category_id INTEGER,
  image_file TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES Categories(id)
);
-- DROP TABLE IF EXISTS Product_Categories;
-- CREATE TABLE Product_Categories (
--   id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
--   product_id INTEGER,
--   category_id INTEGER,
--   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--   FOREIGN KEY (product_id) REFERENCES Products(id),
--   FOREIGN KEY (category_id) REFERENCES Categories(id)
-- );
DROP TABLE IF EXISTS Shops;
CREATE TABLE Shops (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT,
  description TEXT,
  postal_code TEXT,
  prefecture TEXT,
  city TEXT,
  street TEXT,
  building TEXT,
  latitude REAL,
  longitude REAL,
  icon_file TEXT,
  exterior_image_file TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);



DROP TABLE IF EXISTS Order_Products;
CREATE TABLE Order_Products (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  order_id INTEGER,
  product_id INTEGER,
  quantity INTEGER,
  unit TEXT,
  budget_price INTEGER,
  max_price INTEGER,
  min_price INTEGER,
  actual_price INTEGER,
  description TEXT,
  shop_id INTEGER,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES Orders(id),
  FOREIGN KEY (product_id) REFERENCES Products(id),
  FOREIGN KEY (shop_id) REFERENCES Shops(id)
);
INSERT INTO Categories(name) VALUES ('野菜');
INSERT INTO Categories(name) VALUES ('果物');
INSERT INTO Categories(name) VALUES ('肉類');
INSERT INTO Categories(name) VALUES ('魚介類');
INSERT INTO Categories(name) VALUES ('大豆製品');
INSERT INTO Categories(name) VALUES ('乳製品');
INSERT INTO Categories(name) VALUES ('調味料');
INSERT INTO Categories(name) VALUES ('ご飯・穀類');
INSERT INTO Categories(name) VALUES ('麺類');
INSERT INTO Categories(name) VALUES ('飲料水');
INSERT INTO Products(name, category_id) VALUES ('白菜', 1);
INSERT INTO Products(name, category_id) VALUES ('バナナ', 2);
INSERT INTO Products(name, category_id) VALUES ('鶏胸肉', 3);
INSERT INTO Products(name, category_id) VALUES ('鮭切り身', 4);

-- INSERT INTO Product_Categories(product_id, category_id) VALUES (1,1);
-- INSERT INTO Product_Categories(product_id, category_id) VALUES (2,2);
-- INSERT INTO Product_Categories(product_id, category_id) VALUES (3,3);
-- INSERT INTO Product_Categories(product_id, category_id) VALUES (4,4);

INSERT INTO Shops(name) VALUES ('マルヤスJR千里丘店');
INSERT INTO Shops(name) VALUES ('マルヤス吹田新芦屋店');
INSERT INTO Shops(name) VALUES ('業務スーパー千里丘店');
INSERT INTO Shops(name) VALUES ('業務スーパーTAKENOKO茨木市役所前店');
INSERT INTO Shops(name) VALUES ('サンディ茨木駅前店');
INSERT INTO Shops(name) VALUES ('酒のやまやJR茨木駅前店');
INSERT INTO Shops(name) VALUES ('酒のやまやJR吹田千里丘店');
INSERT INTO Shops(name) VALUES ('satake茨木西駅前店');
INSERT INTO Shops(name) VALUES ('satakeビエラ千里丘店');
INSERT INTO Shops(name) VALUES ('フレッシュバザールグランドセンター千里丘店');

INSERT INTO Orders(status) VALUES ('not_yet');
INSERT INTO Order_Products(order_id, product_id, shop_id, quantity, unit, budget_price, max_price, description) VALUES (1,1,1,0.25,'玉',98,120, '業務スーパーで買っても良い');
INSERT INTO Order_Products(order_id, product_id, shop_id, quantity, unit, budget_price, max_price, description) VALUES (1,2,3,1,'パック',400,480, '1パック400g程度');