# Cheatsheet for regex

Inspired by [vimtips](http://rayninfo.co.uk/vimtips.html).

## Replace regex

Replace all date in format `YYYYMMDD` to `MM/DD/YYYY`:

```
%s/\(20\d\{2}\)\(\d\{2}\)\(\d\{2}\)/\2\/\3\/\1/g
```

## Delete everything in parentheses

```
:%s/(.*)//g
```

## Grab email only, replacing the whole line

E.g. on the following file:

```
Charlax <toaster@toasting.org>
```

Execute:

```
:%s/.*<//g
:%s/>//g
```

## Delete everything after a character

E.g.:

```
* Toaster: 1
* Toaster: 2
```

To delete everything after `:`:

```
:%s/:.*//
```

## Replace newline character "^M" and "^@"

```
:%s/<Ctrl-V><Ctrl-M>/\r/g
```
