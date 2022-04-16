# akitext - Text Archive Handler for AKI Corporation's Nintendo 64 games
`akitext` is a text archive handler for AKI Corporation's Nintendo 64 games.

## Usage
Running `akitext` without any arguments will print the program usage.

- Extract strings:    `akitext -e AKITEXT_FILE`
- Build text archive: `akitext -b INPUT_FILE`

## Optional Arguments
    -o OUTFILE        Set output filename (works in both modes)
	-q                Enable quiet mode (only show error and success messages)
	-i                (decomp matching) Ignore last NULL
	-p NUM_ENTRIES    (decomp matching) Pad offset table to NUM_ENTRIES

### Ignore last NULL
Some AKIText archives don't end with a 0x00 byte for the last string.
If `-i` is set, replicate this behavior.

(todo: This may require string to be on a `uint16_t` boundary...)

### Pad offset table
Some AKIText archives have an offset table with more entries than the number of
actual strings in the table. If `-p` is set and greater than 0, pad the offset
table to the specified number of entries with 0x`0000` values.

## Format Information
Offset list starts at file offset 0. Each entry is two bytes, little endian.

The first offset value is essentially the length of the offset table.

Strings are either in ASCII or Shift-JIS encoding.
This program makes no attempt to convert characters to any specific encoding,
and expects non-ASCII characters to use Shift-JIS encoding (or certain internal
codepoints that need to be documented).

Text archives may or may not have a maximum length. The Edit Mode move names are
split every 512 strings, but there are archives in WWF No Mercy with well over
512 strings, and they seem to work fine. If there is a maximum length, it may be
game-specific.

## License
This program is licensed under the Unlicense. See the `UNLICENSE` file for more information.
