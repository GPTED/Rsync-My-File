# Rsync My File
Rsync your file to your remote host via rsync, example:

![](https://github.com/GPTED/Rsync-My-File/workflows/test/badge.svg)

```yaml
      - name: Rsync My File
        uses: GPTED/Rsync-My-File@0.1
        with:
          HOST: ${{ secrets.HOST }}
          PORT: ${{ secrets.PORT }}
          USER: ${{ secrets.USER }}
          PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
          SOURCE: ${{ secrets.SOURCE }}
          TARGET: ${{ secrets.TARGET }}
```

## Inputs
- `HOST`: SSH host
- `PORT`: SSH port (*default: `22`*)
- `USER`: SSH User (*default: `root`*)
- `PRIVATE_KEY`: SSH raw private key
- `SOURCE`: source directory
- `TARGET`: target directory (*default: user home*)
