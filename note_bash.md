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

<p>除了以 ＃ 为开头的文本是被当成注释以外，其它都按如下过程：</p>

- 读取输入，并分成 words 和 operators
- 应用 quoting 规则，为 words 赋予不同的意义
- 将这些 tokens 解析为 cmds，以及后续工作
### 3.1.1 shell operation

<p>最基本的命令执行流程如下：</p>

- 读取输入
- 输入被解析为 words 和 operators，并遵守 quoting rules。这些 tokens 被 metachar 分隔。alias expansion 在这一步发生
- tokens 解析为 single command（简单命令） 或者 compound commands（复合命令）
- 各种 shell expansion 在这一步执行，得到新的命令，并解析为文件名，命令，参数
- 执行一些重定向
- 执行命令
- optionally 等待命令完成，收集 exit status（结束码）
### 3.1.2 Quoting

<p>metechar 对于 shell 来说是有特殊含义的，如果想按其本身的字符来处理，而不当作特征含义来处理的话，就必须 quote（可以联想转义，但是实际上是不一样的）。且当 history expansion 特征开启时，history expansion char，也就是'!'，必须被 quoted 来避免 history expansion</p>

 总共有三种机制来 quote
- escape char : \
- 单引号 ： ' '
- 双引号 ： " "
#### 3.1.2.1 Escape Character

<p>也就是转义。</p>

#### 3.1.2.2 Single Quotes

<p>也是转义。另外不允许嵌套</p>

#### 3.1.2.3 Double Quotes

<p>将 $ '' \ 以外的进行转义。而 $ '' \ 仍然保留着特殊含义和用法</p>

#### 3.1.2.4 ANSI-C Quoting
#### 3.1.2.5 Locale-Specific Translation

<p><font style="background: yellow">$"string" 会触发，但是没看懂，跳过</font></p>

### 3.1.3 Comments
## 3.2
### 3.2.1 Reserved Wrods
### 3.2.2 Simple Commands
### 3.2.3 Pipelines

<p> 被 | 或 |& 分隔的一系列命令</p>

<p> 语法 : [time [-p]] [!] command1 [ | or |& command2 ] ...</p>

<p> 管道的定向优先于命令中指定的重定向</p>

<p> 管道中每个命令都在单独的 subshell 中执行</p>

### 3.2.4 Lists of Commands

<p> 定义 : 一个或多个 pipeline 组成的序列,序列中的 pipelines 由 ; & && || 这样的符号分隔(在序列最后可选用 ; & 或者一个 newline 来结尾</p>

<p> 分隔的符号中, && || 优先级大于 ; &</p>

<p> 以 & 结尾的命令,在 subshell 中异步执行</p>

<p> 以 ; 分隔的命令,顺序执行, status取最后一个执行的命令</p>

<p> 以 && 和 || 分隔的命令,短路执行,status取最后一个执行的命令</p>

### 3.2.5 Compound Commands
- 循环
- 条件
- 其它用来将命令组合成一个单元来执行的机制
#### 3.2.5.1 Looping Constructs

<p><font color=" red">跳过了就,用到了再查就完了</font>

#### 3.2.5.2 Conditional Constructs

<p><font color=" red">前面跳过了一些</font>

<p> (( expression )) : 对 expression 进行数学运算,值为非 0 的时候,返回 status 0

<p> [[ expression ]] : 对 expression 进行条件运算. word spliting 和 filename expansion 不执行; tilde expansion, parameter 和 variable expansion, arithmetic expansion, command substitution, process substitution, quote removal 被执行. 此时 =~ 运算符可用. 将右侧 string 看作是一个 pattern 进行匹配 <font color=" red">整个过程非常复杂,详见书</font>

<p> <font style="background: yellow">一个速记:双括号用来条件测试</font>

#### 3.2.5.3 Grouping Commands

<p> 两种机制来将多个命令组成一个单元

- ( list ) : 导致命令在 subshell 中执行
- { list; } : 在当前 shell 执行, <font color=" red">注意;是需要的</font>
### 3.2.6 Coprocesses

<p> <font style="background: yellow">skip</font>

### 3.2.7 GNU Parallel

<p> <font style="background: yellow">skip</font>

## 3.3 Shell Functions

<p> <font style="background: yellow">skip</font>

## 3.4 Shell Parameters

<p> <font style="background: yellow">skip</font>

## 3.5 Shell Expansions

<p> 不同的 expansions 按如下顺序执行

- brace
- tilde
- parameter and variable
- arithmetic
- command substitution ( left to right)
- word splitting
- filename

<p> 最后是 quote removal

### 3.5.1 Brace Expansion

<p> 可以输入 echo a{d,c,b}e 看一下结果就知道了

<p> 把原始输入展开成了空格分隔的一系列

<p> 或者也有这样的形式 echo {1..10}

<p> 可以方便地批量执行命令,比如如果要创建一些文件夹,就可以执行下面这个命令

<p> mkdir ~/my_mess/{a,b,c,d}, 这样就可以同时创建四个文件夹了

<p> 该 expansion 是优先级最高的 expansion

### 3.5.2 Tilde Expansion

<p> 这个是跟目录相关的一些 expansion, <font style="background: yellow">感觉不很重要,跳过了</font>

### 3.5.3 Shell Parameter Expansion

<p> 一个触发 parameter/arithmetic expansion 和 command substitution 的字符: $

<p> 将被扩展的这个东西可能被 {} 包起来, 防止跟后面的连在一直导致错误识别了. 所以最佳实践通常是这样的形式: ${param}

<p> 然后是一堆用法, 用到了再往 cheetsheet 里面记就好了吧

### 3.5.4 Command Substitution

<p> 两种基本形式: $(command) 或者 `command`

<p> 在 subshell 中执行命令,并用命令的输出来替换这一坨

<p> 如果替换发生在双引号之中, 则不会执行 word splitting 和 filename expansion

### 3.5.5 Arithmetic Expansion

<p> 基本形式: $(( expression))

<p> 但是很奇怪, 没太看懂: <font style="background: yellow">bash会当作这个 expression 是被双引号给 queted 住了一样去处理这个 expression, 但是在括号中的双引号并不会被特殊处理. expression 里面的所有 tokens 都要执行 parameter/variable expansion, command substitution 和 quote removal</font>

<p> 最后用表达式的执行结果来替换

### 3.5.6 Process Substitution

<p> <font style="background: yellow">不通用, 跳过</font>

### 3.5.7 Word Splitting

<p> 将前面得到的结果作 word splitting, 而<font color=" red">双引号之内的部分不进行 word splitting</font>

<p> 使用 $IFS 进行分词. 注意这里的 word splitting 是对前面 expansion 的结果进行的, 而不是对整个命令进行的, 虽然我也没太看懂这句话的意思

### 3.5.8 Filename Expansion

<p> 其实就是文件名的通配

#### 3.5.8.1 Pattern Matching

<p> 一些通配规则, 就类似正则

### 3.5.9 Quote Removal
## 3.6 Redirection

<font style="background: yellow">跳过</font>

## 3.7 Executing commands
### 3.7.1 Simple Command Expansion

<p> 简单命令的执行可以分成下面几步

- 解析后被标注为变量赋值的 words，以及重定向，被保存下来留待后续使用
- 非变量赋值和重定向的，被扩展；如果扩展后还存在 words，那么第一个 word 被当成命令的名字，剩下的被当作参数
- 发生重定向
- 在‘＝’后的文本发生 tilde/parameter/arithmetic expansion，command substitution and quote removal

<p> <font style="background: yellow">说实话没看懂</font>

### 3.7.2 Command Search and Expansion

<p> 如果在分词以后，得到简单命令和参数列表，那么如下过程发生

- 如果命令名不包含 slash，那么 shell 开始定位这个命令；如果存在同名函数，则调用函数
- 否则，在 shell builtins 里面进行查找，直到匹配
- 否则，在另外的路径中查找

<p> <font color=" red">后面还有，跳过了</font>

### 3.7.3 Command Execution Environment

<p> <font style="background: yellow">skip</font>

### 3.7.4 Environment

<p> <font style="background: yellow">skip</font>

### 3.7.5 Exit Status

<p> <font style="background: yellow">skip</font>

### 3.7.6 Signals

<p> <font style="background: yellow">skip</font>

## 3.8 Shell Scripts

<p> <font style="background: yellow">skip</font>

# 4 Shell Builtin Commands
## 4.1 Bourne Shell Builtins

<p>一堆内置命令</p>

## 4.2 Bash Builtin Commands

<p>又一堆内置命令</p>

## 4.3 Modifying Shell Behavior
### 4.3.1 The Set Builtin

<p>全篇在讲set命令</p>

### 4.3.2 The Shopt Builtin

<p>全篇在讲 shopt 命令</p>

## 4.4 Special Builtins

<p>大致扫了一眼，感觉不实用</p>

# 5 Shell Variables
## 5.1 Bourne Shell Variables

<p>一系列预定义的变量</p>

## 5.2 Bash Variables

<p>一系列预定义的变量</p>

# 6 Bash Features
## 6.1 Invoking Bash

<p>介绍了 bash 命令的和参数</p>

## 6.2 Bash Startup Files

<p>但是我是 zsh，是不是就不用看这个了</p>

## 6.3 Interactive Shells

<p><font style="background: yellow">感觉没啥用，跳过</font></p>

## 6.4 Bash Conditional Expressions

<p>感觉跟以前的内容重复了</p>

## 6.5 Shell Arithmetic

<p>感觉同上</p>

## 6.6 Aliases

<p>感觉不用看</p>

## 6.7 Arrays

<p>创建数组的方法，我感觉实用的是直接给数组下标赋值，或者用括号来直接创建</p>

<p>在用括号创建的时候，每个值都要进行所有的 shell expansion</p>

<p>还说了下 associated array 的用法，但是我没看</p>

<p>取数组元素：${name[subscript]}</p>

<p>当 subscript 是 ＊ 或者 ＠ 的时候，上面那坨会 expand 为整个数组中所有的元素</p>

<p>虽然但是，expand 的时候还要受到 quoting 的限制</p>

<p>${#name[subscript]} 则 expand 成这个数组的长度</p>

## 6.8 The Directory Stack

<p>可以通过 pushd 和 popd 这两个方法来学这一节</p>

### 6.8.1 Directory Stack Builtins

<p>dirs pushd popd 三个命令的手册</p>

## 6.9 Controlling the Prompt

<p><font style="background: yellow">跳过</font></p>

## 6.10 The Restricted Shell

<p><font style="background: yellow">跳过</font></p>

## 6.11 Bash POSIX Mode

<p><font style="background: yellow">跳过</font></p>

## 6.12 Shell Compatibility Mode

<p><font style="background: yellow">跳过</font></p>

# 7 Job Control

<p><font style="background: yellow">跳过</font></p>

# 8 Command Line Editing

<p><font style="background: yellow">就是讲的在 shell 里面输入命令的时候的一些事情, 感觉可以跳过</font></p>

<p><font color=" red">但是那个 vi 模式输入命令还是有点用的</font></p>

# 9 Using History Interactively

<p><font style="background: yellow">一些历史命令相关,跳过</font></p>

flowchart TB
    a
