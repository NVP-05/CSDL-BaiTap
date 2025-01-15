use ks23b_database; 

-- a
CREATE TABLE InvoiceDetails (
    InvoiceID INT,                  
    ProductID INT,                  
    Quantity INT NOT NULL,              
    PRIMARY KEY (InvoiceID, ProductID)  
);

-- b
ALTER TABLE InvoiceDetails
ADD CONSTRAINT FK_InvoiceID
FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID);

ALTER TABLE InvoiceDetails
ADD CONSTRAINT FK_ProductID
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

-- c 
SELECT 
    inv.InvoiceID,
    inv.InvoiceDate,
    prod.ProductID,
    prod.ProductName,
    id.Quantity,
    prod.Price
FROM 
    InvoiceDetails id
INNER JOIN Invoices inv ON id.InvoiceID = inv.InvoiceID
INNER JOIN Products prod ON id.ProductID = prod.ProductID;
