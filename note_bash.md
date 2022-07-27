*参考书是 bash reference manual*
# 二、一些定义
**挑了几个我觉得比较重要的记一下**
- filed ： 是 shell expansions 的结果， 该结果定义为一个文本单元。通常在 expansion 之后，命令执行时，这样的 field 被用作是命令的名字（ls/mv/rm等）或者命令的参数
- token ： 被 shell 看作是一个单独的文本单元的一个 char sequence。token 是一个 operator 或者 word
- operator ： 望文生义，就是运算符
- word ： 被 shell 看作是一个单独的文本单元的一个 char sequence。word 不含有 unquoted metacharacters
- metacharacter ： 当 unquoted 的时候，用来分隔 words 的一个 char。可以是 space，tab，newline，或者 | & ; ( ) < >
# 三、shell 基本特性
## 3.1 shell 语法
除了以 ＃ 为开头的文本是被当成注释以外，其它都按如下过程：
1. 读取输入，并分成 words 和 operators
2. 应用 quoting 规则，为 words 赋予不同的意义
3. 将这些 tokens 解析为 cmds，以及后续工作
### 3.1.1 shell operation
最基本的命令执行流程如下：
1. 读取输入
2. 输入被解析为 words 和 operators，并遵守 quoting rules。这些 tokens 被 metachar 分隔。alias expansion 在这一步发生
3. tokens 解析为 single command（简单命令） 或者 compound commands（复合命令）
4. 各种 shell expansion 在这一步执行，得到新的命令，并解析为文件名，命令，参数
5. 执行一些重定向
6. 执行命令
7. optionally 等待命令完成，收集 exit status（结束码）
### 3.1.2 Quoting
metechar 对于 shell 来说是有特殊含义的，如果想按其本身的字符来处理，而不当作特征含义来处理的话，就必须 quote（可以联想转义，但是实际上是不一样的）。且当 history expansion 特征开启时，history expansion char，也就是'!'，必须被 quoted 来避免 history expansion
> 总共有三种机制来 quote
> 1. escape char : \
> 2. 单引号 ： ' '
> 3. 双引号 ： " "
#### 3.1.2.1 Escape Character
也就是转义。
#### 3.1.2.2 Single Quotes
也是转义。另外不允许嵌套
#### 3.1.2.3 Double Quotes
将 $ '' \ 以外的进行转义。而 $ '' \ 仍然保留着特殊含义和用法
#### 3.1.2.4 ANSI-C Quoting
#### 3.1.2.5 Locale-Specific Translation
<font style="background: yellow">$"string" 会触发，但是没看懂，跳过</font>
### 3.1.3 Comments
## 3.2

