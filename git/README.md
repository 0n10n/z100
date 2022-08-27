# git笔记


## 一、设置相关

### 1.1 OpenSSL 出错
```
fatal: unable to access 'https://github.com/0n10n/foobar/': OpenSSL SSL_read: Connection was reset, errno 10054
```

需要做的配置：

> git config --global http.sslVerify false  
> git config --global http.postBuffer 1048576000  
> git config --global core.compression -1  

## 二、基础原理

### 2.1 基本概念

```mermaid
graph LR
A[WorkingTree] --> |Add| B(Index/Staging) --> |Commit| C(Head)
```

https://www.gitkraken.com/learn/git/git-worktree

https://www.geeksforgeeks.org/git-working-tree/

https://www.kimsereylam.com/git/2021/01/08/difference-between-working-tree-and-index-in-git.html

`master`：默认的本地分支

`origin`：默认的远程分支，`git push origin master` 把本地库推送给远程库

`upstream`：默认的上游库

### 2.2 测试区

这是master分支



这是在temp worktree 下的修改。

master 这边也继续修改一下。


## 三、常见操作
### 3.1 Undo一次commit

>\#git revert HEAD 



### 3.2 github库本地/远程初始化

从本地->远程

```
echo "# z100" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:0n10n/z100.git
git push -u origin main
```

从本地推到远程

```
git remote add origin git@github.com:0n10n/z100.git
git branch -M main
git push -u origin main
```