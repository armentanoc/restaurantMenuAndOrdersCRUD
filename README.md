<h1 align="center"> Meal and Restaurant Orders CRUD Application 🍽️</h1>

<p align="center">
  <img src="https://github.com/armentanoc/restaurantMenuAndOrdersCRUD/assets/88147887/49ae87a3-c712-4155-9039-7a940dbd876a" alt="Your Alt Text" style="width: 100%; max-width: 100vw; height: auto;">
</p>

## Overview
This is a Java web application built with JSP (JavaServer Pages) for creating, updating, and deleting (CRUD) meals and restaurant orders. The project uses Apache Tomcat 9 as the web server and PostgreSQL as the embedded database.

## Requirements
Before running the application, ensure you have the following software installed:

* Java Development Kit (JDK) 8 or later
* <a href="https://tomcat.apache.org/download-90.cgi">Apache Tomcat 9</a>
* <a href="https://www.enterprisedb.com/downloads/postgres-postgresql-downloads"> PostgreSQL Database</a>
  
## Getting Started

Clone the repository:

```
git clone https://github.com/armentanoc/restaurantMenuAndOrdersCRUD.git
```

## Setting up the database and tables

1. You need to create locally at PostgreSQL a database named `VillaEleganza`.
2. Inside it, run the following script in Query Tool to create the `menu` and `orders` table: 

```bash

CREATE TABLE menu (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ingredients VARCHAR(255) NOT NULL,
    type VARCHAR(9) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    entrada_id INT REFERENCES menu(id),
    prato_principal_id INT REFERENCES menu(id),
    sobremesa_id INT REFERENCES menu(id),
    status VARCHAR(50) DEFAULT 'pendente',
    created_at TIMESTAMPTZ DEFAULT current_timestamp,
    updated_at TIMESTAMPTZ DEFAULT current_timestamp
);

CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Set up trigger to update updated_at on every update
CREATE TRIGGER orders_update_updated_at
BEFORE UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

-- Set up trigger to set created_at on insert
CREATE TRIGGER orders_set_created_at
BEFORE INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

```

## Go to Eclipse IDE or similar

* We chose to use <a href="https://www.eclipse.org/downloads/packages/release/2023-09/r/eclipse-ide-enterprise-java-and-web-developers">Eclipse IDE for Enterprise Java and Web Developers</a> to make the project and tutorial.

1. Configure the Server in Eclipse IDE >> Servers >> New Server >> Apache Tomcat v9.0 Server >> Browse extracted zip directory. 
2. Alter the password in `DAOMenuItem.java` class as needed at your own machine 
3. Open `villaHome.jsp` with Apache Tomcat 9 server
4. The CRUD in `menu` and `orders` should be working!
