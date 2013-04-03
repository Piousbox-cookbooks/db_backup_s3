mongodb_backup_s3 Cookbook
==========================

Backs up mongodb to S3

Requirements
------------

 * method of connecting to s3
 * s3 connection configuration
 * mongodb connection configuration

TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - mongodb_backup_s3 needs toaster to brown your bagel.

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
    <td><tt>['mongodb_backup_s3']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### mongodb_backup_s3::default

There is a data bag 'utils/s3.json' that has attributes 'key' and 'secret', those are your S3 credentials.

Include `mongodb_backup_s3` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[mongodb_backup_s3]"
  ]
}
```

Contributing
------------

This is a public cookbook. To contribute:

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

This code is distributed under Apache2 license.

The author is Victor Piousbox.
