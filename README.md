## My arch settings and instructions

# Comands:

- Update запускает обновление системы:
### Зависимости

```bash
sudo pacman -S --needed nano pacman-contrib
```

### Копирование в систему

```bash
sudo cp update.sh /usr/local/bin/update
sudo chmod +x /usr/local/bin/update
```

### Права - sudoers

```bash
sudo EDITOR=nano visudo
```
И РЯДОМ С ROOT СТАВИМ:

kleshzz ALL=(ALL) NOPASSWD: /usr/bin/pacman, /usr/bin/paccache

### В терминале (zsh)

alias update='/usr/local/bin/update' && source ~/.zshrc
