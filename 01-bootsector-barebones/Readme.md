`qemu-system-x86_64 --nographic boot_sect_simple.bin`
However, the hexdump of `bool_sect_simple.bin` is different from mentioned in github project 
```keep-learnings-MacBook-Pro:01-bootsector-barebones keep_learning$ hexdump boot_sect_simple.bin 
   0000000 eb fe 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   0000010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   *
   00001f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 aa
   0000200```


