# Linux Notes:
---
- To find and replace word in files: 
  - `find /path/to/files -type f -exec sed -i 's/oldstring/new string/g' {} \;`
- `gsettings set org.gnome.shell.app-switcher current-workspace-only true` to switch windows on activate workspace only (Ubuntu)
