# My Nvim configuration #
## Install Reqs ##
pacman -S npm ripgrep wget nodejs fzf unzip

This will show all available keybinds:
<leader>sk      - Search keybinds

## Keybinds ##
### Movement ###
nf              - Go to next function
NF              - Go to previous function
np              - Go to next parameter
NP              - Go to previous parameter
nt              - Go to next todo
NT              - Go to previous todo

### Visual ###
J               - Move selection up
K               - Move selection down
<               - Move selection left 
>               - Move selectino right

### Selection ###
sp              - Select parameter outer
<Ctrl>C         - Stop highlighting / escape insert

### Swap ###
Ctrl-.          - Swap to the next parameter
Ctrl-,          - Swap to the previous 

### Auto completion ###
Ctrl-n          - Next item
Ctrl-p          - Previous item
Enter           - Confirms choice

### Lists ###
<leader>tl      - Open quick fix list for todos
<leader><space> - Smart find files
<leader>,       - Buffer list
<leader>fc      - Find config files
<leader>ff      - File picker
<leader>fg      - Find git file
<leader>fp      - File picker for project
<leader>gb      - Find git brang
<leader>gl      - Show git log
<leader>gd      - Show git diff
<leader>gs      - Show git status
<leader>ss      - Show symbol list
<leader>sS      - Show project symbol list

### Search ###
<leader>fr      - Find and replace highlighted
<leader>sb      - Search buffer lines
<leader>sw      - Search hovered word
<leader>sC      - Search commands
<leader>sd      - Search diagnostics
<leader>sH      - Search highlights
<leader>si      - Search icons
<leader>su      - Search undo tree
<leader>uC      - Search color schemes

### Pasting ###
<leader>P       - Paste from system clipboard

### LSP ###
gd              - Go to definition
gr              - Show references
gI              - Go to implementation
gy              - Goto type definition
qf              - Quickfix list
]]              - Next reference
[[              - Previous reference
<eader>f        - Format code


### File Browser ###
<leader>e       - Open file browser (uses normal vim movement)

### Terminal ###
<Ctrl>t         - Open / close terminal
<Esp>           - Exit terminal insert mode

### Conform ###
<leader>l       - Format
