Run:
```bash
wget -qO - https://raw.githubusercontent.com/bd-dm/proxmox-backup-install/refs/heads/main/install-restic.sh | bash
```

Docs: https://autorestic.vercel.app/quick

After installation run:
```bash
autorestic check
```

And add this to `crontab -e`:
```bash
0 0 * * * autorestic backup -a
```

To restore, run:
```bash
autorestic restore -l local --from remote --to /
```
