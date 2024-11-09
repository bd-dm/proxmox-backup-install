apt-get update
apt-get install bzip2
wget -qO - https://raw.githubusercontent.com/cupcakearmy/autorestic/master/install.sh | bash

cat << 'EOF' > ~/.autorestic.yml
# See more: https://autorestic.vercel.app/quick
version: 2
 
locations:
  home:
    from: /home
    # Or multiple
    # from:
    #  - /foo
    #  - /bar
    to: remote
 
  important:
    from: /path/to/important/stuff
    to:
      - remote
      - hdd
 
backends:
  remote:
    type: s3
    path: 's3.amazonaws.com/bucket_name'
    key: some-random-password-198rc79r8y1029c8yfewj8f1u0ef87yh198uoieufy
    env:
      AWS_ACCESS_KEY_ID: account_id
      AWS_SECRET_ACCESS_KEY: account_key
 
  hdd:
    type: local
    path: /mnt/my_external_storage
    key: 'if not key is set it will be generated for you'

EOF

echo "Restic is installed! Please edit file ~/.autorestic.yml to configure backups"
