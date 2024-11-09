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
    type: b2
    path: 'myBucket:backup/home'
    env:
      B2_ACCOUNT_ID: account_id
      B2_ACCOUNT_KEY: account_key
 
  hdd:
    type: local
    path: /mnt/my_external_storage
    key: 'if not key is set it will be generated for you'

EOF

echo "Restic is installed! Please edit file ~/.autorestic.yml to configure backups"
echo "Then run `autorestic check` to check backup"
echo "And add `autorestic backup -a` to cron: `crontab -e`"
echo "Example: `0 0 * * * autorestic backup -a`"
