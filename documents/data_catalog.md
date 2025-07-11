<h1>
  Gold Layer Data Catalog
</h1>

<p>
  The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of dimension tables and fact tables for specific business metrics, and follows <b>star schema model.</b>
</p>

<p>1.gold.dim_product</p>
<table border="1" cellpadding="8" cellspacing="0">
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
