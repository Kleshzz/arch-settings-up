# Arch-Set-UP

---

## Команды

### `update` - полное обновление системы

**Зависимости**

```bash
sudo pacman -S --needed reflector pacman-contrib
```

**Установка скрипта**

```bash
sudo cp update.sh /usr/local/bin/update
sudo chmod +x /usr/local/bin/update
```

**Права (sudoers)**

```bash
sudo EDITOR=nano visudo
```

Добавить рядом с `root`:

```
kleshzz ALL=(ALL) NOPASSWD: /usr/bin/pacman, /usr/bin/paccache
```

**zsh**

```bash
alias update='/usr/local/bin/update' && source ~/.zshrc
```
