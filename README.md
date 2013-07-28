db_backup_s3 Cookbook
==========================

Includes a recipe to back up mongodb to S3.

Includes a recipe to back up mysql to S3.


Requirements
------------
 * method of connecting to s3
 * s3 connection configuration
 * mongodb connection configuration
 * mysql connection configuration

#### packages
- `toaster` - db_backup_s3 needs toaster to brown your bagel.

Attributes
----------
TODO: List you cookbook attributes here.

e.g.
#### mongodb_backup_s3::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['db_backup_s3']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### db_backup_s3::mysql
#### db_backup_s3::mongodb

There is a data bag 'utils/s3.json' that has attributes 'key' and 'secret', those are your S3 credentials.

Include `db_backup_s3` in your node's `run_list`, with the appropriate recipe name:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[db_backup_s3::mongodb]",
    "recipe[db_backup_s3::mysql]"
  ]
}
```

Make sure that the bucket exists. Inside the bucket there should be folders:
/mongodb
/sql_backup


License and Authors
-------------------

This code is distributed under Apache2 license.

The author is Victor Piousbox.
