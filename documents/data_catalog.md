<h1>
  Gold Layer Data Catalog
</h1>

<p>
  The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of dimension tables and fact tables for specific business metrics, and follows <b>star schema model.</b>
</p>

<hr>
<br>

<p fontsize= "8">
  <b>1.gold.dim_product</b>
</p>
<ul>
  <li>
    <b>Purpose:</b> Stores related product data 
  </li>
  <li>
    <b>Columns:</b> 
  </li>
</ul>
<table cellpadding="8" cellspacing="0">
  <thead>
    <tr>
      <th>Column Name</th>
      <th>Data Type</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>productcode</td>
      <td>VARCHAR(50)</td>
      <td>Product type identifier</td>
    </tr>
    <tr>
      <td>productline</td>
      <td>VARCHAR(50)</td>
      <td>Product type (eg. classic cars, trains, etc..)</td>
    </tr>
    <tr>
      <td>msrp</td>
      <td>FLOAT</td>
      <td>Manufacturer`s suggested retail price</td>
    </tr>
  </tbody>
</table>
<hr>
<br>
<p fontsize= "8">
  <b>2.gold.dim_customer</b>
</p>
<ul>
  <li>
    <b>Purpose:</b> Stores related customer data such as geographic location, addresses, phone number.
  </li>
  <li>
    <b>Columns:</b> 
  </li>
</ul>
<table cellpadding="8" cellspacing="0">
  <thead>
    <tr>
      <th>Column Name</th>
      <th>Data Type</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>customerid</td>
      <td>INT</td>
      <td>Surrogate key uniquely identifying each customer record in the dimension table.</td>
    </tr>
    <tr>
      <td>companyy</td>
      <td>VARCHAR(50)</td>
      <td>Company Purchasing product</td>
    </tr>
    <tr>
      <td>contactfullname</td>
      <td>VARCHAR(50)</td>
      <td>Company`s contact fullname </td>
    </tr>
    <tr>
      <td>phone</td>
      <td>VARCHAR(50)</td>
      <td>Company`s contact phone number</td>
    </tr>
    <tr>
      <td>addressline1</td>
      <td>VARCHAR(50)</td>
      <td>Company`s main address </td>
    </tr>
    <tr>
      <td>addressline2</td>
      <td>VARCHAR(50)</td>
      <td>Extra detail on company`s address </td>
    </tr>
    <tr>
      <td>city</td>
      <td>VARCHAR(50)</td>
      <td>City where company is located</td>
    </tr>
    <tr>
      <td>state</td>
      <td>VARCHAR(50)</td>
      <td>State where company is located </td>
    </tr>
    <tr>
      <td>country</td>
      <td>VARCHAR(50)</td>
      <td>Country where company is located </td>
    </tr>
    <tr>
      <td>territory</td>
      <td>VARCHAR(50)</td>
      <td>Territory where company is located </td>
    </tr>
    <tr>
      <td>postalcode</td>
      <td>VARCHAR(50)</td>
      <td>Company`s location postal code </td>
    </tr>
  </tbody>
</table>
<hr>
<br>
<p fontsize= "8">
  <b>3.gold.fact_sales</b>
</p>
<ul>
  <li>
    <b>Purpose:</b> Stores transactional sales data
  </li>
  <li>
    <b>Columns:</b> 
  </li>
</ul>
<table cellpadding="8" cellspacing="0">
  <thead>
    <tr>
      <th>Column Name</th>
      <th>Data Type</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ordernumber</td>
      <td>INT</td>
      <td>Unique Identifier for the orders</td>
    </tr>
    <tr>
      <td>quantity</td>
      <td>INT</td>
      <td>Quantity requested by the customer (quantity sold)</td>
    </tr>
    <tr>
      <td>priceperitem</td>
      <td>FLOAT</td>
      <td>Price per each item sold </td>
    </tr>
    <tr>
      <td>orderlinenumber</td>
      <td>INT</td>
      <td></td>
    </tr>
    <tr>
      <td>orderdate</td>
      <td>DATE</td>
      <td>Date when order is placed by a company </td>
    </tr>
    <tr>
      <td>productcode</td>
      <td>VARCHAR(50)</td>
      <td>Foreign key of related product to dim_product table </td>
    </tr>
    <tr>
      <td>customerid</td>
      <td>INT</td>
      <td>Foreign key of related customer to dim_customer table </td>
    </tr>
    <tr>
      <td>dealsize</td>
      <td>VARCHAR(50)</td>
      <td>Deal size type (eg. large)</td>
    </tr>
    <tr>
      <td>status</td>
      <td>VARCHAR(50)</td>
      <td>Order Status (eg. shipped, disputed) </td>
    </tr>
    <tr>
      <td>quarter</td>
      <td>INT</td>
      <td>Quarter of the year where order took place</td>
    </tr>
    <tr>
      <td>month</td>
      <td>INT</td>
      <td>Month of the year where order took place </td>
    </tr>
    <tr>
      <td>year</td>
      <td>INT</td>
      <td>Year where order took place </td>
    </tr>
  </tbody>
</table>

