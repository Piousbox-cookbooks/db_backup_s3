name             'db_backup_s3'
maintainer       'Piousbox'
maintainer_email 'piousbox@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures mongodb_backup_s3'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'


#
# changelog
#
# 0.2.0 It is not mongodb_backup_s3, it is db_backup_s3 now. Introducing mysql functionality.
#       Removing default recipe. The default recipe is now db_backup_s3::mongodb.
#
