## Vim Notes:
---
### View
- `tabmove` command to move tabs (zero-indexed)
- `zt`, `zz`, `tb` moves cursor to top, center, and bottom of screen.

### Shifting
- In insert mode:
  - `<C-d>` - shift left
  - `<C-t>` - shift right
- In normal mode:
  - `[Shift] + [<<]` - shift current line left
  - `[Shift] + [>>]` - shift current line right
- In visual mode:
  - `[<]` - shift selection left
  - `[>]` - shift selection right

### Substitution
  - whole word:       `%s/\<word\>/newword/g`
  - case-insensitive: `%s/\cword/newword/g`

### Misc
- `;` and `,` repeats or reverses movement
- To indent align pasted text: `<[><p>`
- To view key notation: `:help key-notation`
- In Vim manual, open file under cursor in split window: `<CTRL-W><f>`
