## Replace regex

Replace all date in format `YYYYMMDD` to `MM/DD/YYYY`:

```
%s/\(20\d\{2}\)\(\d\{2}\)\(\d\{2}\)/\2\/\3\/\1/g
```

## Delete everything in parentheses

```
:%s/(.*)//g
```
