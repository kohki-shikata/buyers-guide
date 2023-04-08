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
  image_file TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE IF EXISTS Product_Categories;
CREATE TABLE Product_Categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  product_id INTEGER,
  category_id INTEGER,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) REFERENCES Products(id),
  FOREIGN KEY (category_id) REFERENCES Categories(id)
);
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
INSERT INTO Products(name) VALUES ('白菜');
INSERT INTO Products(name) VALUES ('バナナ');
INSERT INTO Products(name) VALUES ('鶏胸肉');
INSERT INTO Products(name) VALUES ('鮭切り身');

INSERT INTO Product_Categories(product_id, category_id) VALUES (1,1);
INSERT INTO Product_Categories(product_id, category_id) VALUES (2,2);
INSERT INTO Product_Categories(product_id, category_id) VALUES (3,3);
INSERT INTO Product_Categories(product_id, category_id) VALUES (4,4);