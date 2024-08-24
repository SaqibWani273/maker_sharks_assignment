
--Supplier table

CREATE TABLE Supplier_Entity (
    id BIGSERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    website VARCHAR(255),
    supplier_location VARCHAR(255),
    nature_of_business VARCHAR(255)
);

--Manufacturing_process table
CREATE TABLE Manufacturing_Process_Entity (
    id BIGSERIAL PRIMARY KEY,
    process VARCHAR(255) NOT NULL
);


-- Supplier_process_mapping table
CREATE TABLE SUPPLIER_PROCESS_MAPPING (
    supplier_id BIGINT REFERENCES Supplier_Entity(id) ON DELETE CASCADE,
    process_id BIGINT REFERENCES Manufacturing_Process_Entity(id) ON DELETE CASCADE,
    PRIMARY KEY (supplier_id, process_id)
);

--insert data into Supplier table
INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('ABC Manufacturing', 'www.abcmfg.com', 'Mumbai', 'SmallScale');
INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('ABC2 Manufacturing', 'www.abc2mfg.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('XYZ Industries', 'www.xyzindustries.com', 'Delhi', 'MediumScale');
INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('XYZABC Industries', 'www.xyzabcindustries.com', 'Delhi', 'LargeScale');
INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('XYZ123 Industries', 'www.xyz123industries.com', 'Delhi', 'MediumScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('PQR Tech', 'www.pqrtech.com', 'Bangalore', 'LargeScale');
INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('PQR1 Tech', 'www.pqr1tech.com', 'Bangalore', 'MediumScale');
INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('PQR2 Tech', 'www.pqr2tech.com', 'Bangalore', 'LargeScale');


---insert data into Manufacturing_Process
INSERT INTO Manufacturing_Process_Entity (process) VALUES ('moulding');
INSERT INTO Manufacturing_Process_Entity (process) VALUES ('3d_printing');
INSERT INTO Manufacturing_Process_Entity (process) VALUES ('casting');
INSERT INTO Manufacturing_Process_Entity (process) VALUES ('coating');

--map the two tables
-- Associating ABC Manufacturing with moulding
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'ABC Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'moulding'));
-- Associating ABC2 Manufacturing with moulding
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'ABC2 Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'moulding'));
-- Associating ABC Manufacturing with 3d_printing
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'ABC Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

-- Associating XYZ Industries with casting
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'XYZ Industries'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'casting'));
-- Associating XYZ Industries with coating
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'XYZ Industries'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'coating'));

-- Associating PQR Tech with coating and 3d_printing
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'PQR Tech'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'coating'));
-- Associating PQR2 Tech with coating and 3d_printing
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'PQR2 Tech'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'coating'));

-- Associating PQR Tech with coating and 3d_printing
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'XYZ123 Industries'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'moulding'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'PQR Tech'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

-- more data for testing

-- Insert more suppliers with various locations and business natures
INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('LMN Manufacturing', 'www.lmnmfg.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('QRS Manufacturing', 'www.qrsmfg.com', 'Delhi', 'MediumScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('TUV Industries', 'www.tuvindustries.com', 'Bangalore', 'LargeScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('JKL Enterprises', 'www.jklenterprises.com', 'Chennai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('DEF Corp', 'www.defcorp.com', 'Kolkata', 'LargeScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('GHI Manufacturing', 'www.ghimfg.com', 'Hyderabad', 'MediumScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('MNO Technologies', 'www.mnotech.com', 'Pune', 'SmallScale');

-- Insert more manufacturing processes
INSERT INTO Manufacturing_Process_Entity (process) VALUES ('machining');
INSERT INTO Manufacturing_Process_Entity (process) VALUES ('assembly');
INSERT INTO Manufacturing_Process_Entity (process) VALUES ('welding');
INSERT INTO Manufacturing_Process_Entity (process) VALUES ('cutting');

-- Map LMN Manufacturing to machining and welding
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'LMN Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'machining'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'LMN Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'welding'));

-- Map QRS Manufacturing to assembly and cutting
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'QRS Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'assembly'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'QRS Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'cutting'));

-- Map TUV Industries to machining and 3d_printing
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'TUV Industries'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'machining'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'TUV Industries'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

-- Map JKL Enterprises to welding and coating
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'JKL Enterprises'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'welding'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'JKL Enterprises'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'coating'));

-- Map DEF Corp to moulding and casting
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'DEF Corp'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'moulding'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'DEF Corp'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'casting'));

-- Map GHI Manufacturing to assembly and coating
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'GHI Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'assembly'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'GHI Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'coating'));

-- Map MNO Technologies to 3d_printing and cutting
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'MNO Technologies'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'MNO Technologies'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = 'cutting'));

-- Adding more suppliers with the same location, nature of business, and different company names
INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('ABC Manufacturing Co.', 'www.abcmfgco.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('XYZ Tech Solutions', 'www.xyztechsolutions.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('MNO Fabrication', 'www.mnofabrication.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('PQR Industrial', 'www.pqrindustrial.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('JKL Metalworks', 'www.jklmetalworks.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('GHI Foundry', 'www.ghifoundry.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('LMN Castings', 'www.lmncastings.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('OPQ Manufacturing', 'www.opqmanufacturing.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('RST Components', 'www.rstcomponents.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('UVW Engineering', 'www.uvwengineering.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('DEF Solutions', 'www.defsolutions.com', 'Mumbai', 'SmallScale');

INSERT INTO Supplier_Entity (company_name, website, supplier_location, nature_of_business) 
VALUES ('QWE Innovations', 'www.qweinnovations.com', 'Mumbai', 'SmallScale');

-- Map these new suppliers to the '3d_printing' process to match the query criteria
INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'ABC Manufacturing Co.'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'XYZ Tech Solutions'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'MNO Fabrication'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'PQR Industrial'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'JKL Metalworks'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'GHI Foundry'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'LMN Castings'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'OPQ Manufacturing'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'RST Components'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'UVW Engineering'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'DEF Solutions'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));

INSERT INTO SUPPLIER_PROCESS_MAPPING (supplier_id, process_id)
VALUES ((SELECT id FROM Supplier_Entity WHERE company_name = 'QWE Innovations'), 
        (SELECT id FROM Manufacturing_Process_Entity WHERE process = '3d_printing'));




