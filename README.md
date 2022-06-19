# uor-keyring
Password generation tool with ability to create a sequence of text transformations and execute the sequence to generate/retrieve passwords.
Created sequence is being encrypted with password, so it could be stored openly without risk of data leak.


Implemented transformations:

- [x] Substring

Ability to take a substring from each intermediate result.
Uses 'from' and 'to' indicies as input.
Is case if string input is too short for given indicies - string would be repeated to fit the length.

- [x] Concat

Ability to concat two any intermediate results with optional separator.

- [x] Attach

Ability to attach a string to any intermediate results.

- [ ] Replace

Ability to replace given symbol occurrences with other string.

- [ ] Repeat

Ability to repeat the string given number of times.

- [ ] Reverse

Ability to reverse any intermediate result.

- [ ] MD5 hash

- [ ] SHA256 hash
