# Linux Printing with CUPS and IPP

## References

- https://wiki.archlinux.org/title/CUPS
- https://wiki.archlinux.org/title/Avahi

Epson drivers for Arch:

- https://aur.archlinux.org/packages/epson-inkjet-printer-escpr

## Steps to configure a printer

(If you don't want to use web-GUI)

1. Compare available backends and drivers with your printer with lpinfo.
2. Add printer to server with lpadmin.
3. Print with lp.

## Services/daemons

```
cups
avahi-daemon
```

Add your user to lpadmin group or add sudo group to admin groups in cups configuration file to edit without being root all the time.

## cups

**Allow admin changes from localhost browser**

```
<Location /admin>
  Order allow,deny
  Allow localhost
</Location
```

### Find your printer

```
ippfind
avahi-browse -rt _ipp._tcp
avahi-discover
```

### lp

```
# Print a document.
lp <FILENAME>
```

### lpadmin

**Set default printer**

```
lpadmin -d <PRINTERNAME> -D
```

**Removing a printer**

```
lpadmin -x <PRINTERNAME>
```

**Adding a network printer**

The 'everywhere' driver can be used on almost all network printers(IPP).

```
lpadmin -p <NAME-TO-BE> -E -v <URI> -m everywhere
```

### lpinfo

```
# List available backends and URIs
lpinfo -v

# List available drivers
lpinfo -m
```
