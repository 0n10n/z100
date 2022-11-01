#### 提示符

```bash
export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[91m\]\h:\[\033[33;1m\]\W\[\033[m\]$'
```

### 外网服务器上安装 nami (socks server)
参见： https://github.com/txthinking/nami

执行：
```bash
joker brook socks5 --listen :8080 --socks5ServerIP 172.31.94.142 --username Uname --password Upasswd
```
### 个人机器上安装 Proxychains

参见：https://github.com/rofl0r/proxychains-ng

```bash
export PROXY_DNS_SERVER=8.8.8.8
export PROXYCHAINS_CONF_FILE=~/.proxychains/proxychains.conf
```
```bash
## proxychains.conf里的内容
[ProxyList]
socks5  Proxy_server_ip  Proxy_server_port User_name User_passwd

## ~/.profile 里的内容
alias proxychains="proxychains4 -f ~/.proxychains/proxychains.conf"

```
以后就可以：

```text
proxychains4 git clone https://github.com/rofl0r/proxychains-ng
proxychains4 apt-get update
proxychains4 npm install
....
```

### vim

```bash
git clone --depth 1 https://github.com/sheerun/vim-polyglot ~/.vim/pack/plugins/start/vim-polyglot
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
```bash
## ~/.vimrc里的内容
set nocompatible
filetype on
filetype plugin on
filetype indent on
set number
set cursorline
set cursorcolumn
call plug#begin()
Plug 'sheerun/vim-polyglot'
call plug#end()
colorscheme ron
```