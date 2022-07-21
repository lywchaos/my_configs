<details><summary>usr_01.txt</summary>

超链接怎么进入，什么是bars，bars的显示和隐藏：r36
</details>


<details><summary>usr_02.txt</summary>

使vim显示当前的模式：r100

一键合并当前行和下一行：r224

数字作命令的count：r348

另一个保存退出的命令：361

在保存和退出时，叹号的作用：r382

知道命令但不知道用法时，怎么查看帮助：436
</details>

<details><summary>usr_03.txt</summary>

光标精确跳跃到指定行数：176

光标跳跃到指定百分比：205


光标跳跃到当前可见页的中间，顶端，下边：208

显示行数，取消显示行数（boolean型设置）：245

在右下显示当前的光标位置：261

动屏幕显示（行，半页，整页），而不动光标：270

当前所在行置于屏幕最上，中间，最下（也就是上下文的显示）：306

通过设置来保持光标移动时总能保持显示一定的上下文：322

search相关，设置搜索时忽略大小写，正则，反向，历史，直接搜索当前单词，整词搜索，高亮搜索：407

MARK在刚刚的位置和现在的位置之间来回jump：558

什么叫jump：565

向前向后jump：572

:jump命令：600

使用MARKS，查看MARKS，几个特殊的MARKS：642
</details>

<details><summary>usr_04.txt Making small changes</summary>

dd是删除整行，cc呢：106

count重复修改：161

表格形式的visual mode：224

visual mode下，在选中内容时，将光标在选中的部分的最前和最后切换：257

删除整行后的p，在光标下一行paste；删除非整行的，在光标之后paste：284

P和p是反向的：301

不删除的话，复制用y：353

cis daw:406

切换光标所在位置的大小写：498
</details>

<details><summary>usr_05.txt Set your settings（个性化设置，插件等）</summary>
在哪里写自己的配置文件：26

一些设置的例子：59

还可以设置key mapping

以及一些需要根据文件类型来判断的过程：152
不过有点看不懂，好像是有语法的

mapping可以映射到一系列命令的组合:234

package简介，没看懂跟plugin有啥区别：247

plugin也分两种，glolab和filetype：287

global plugin本质是什么，如何安装使用：305

filetype plugin的介绍，安装，使用：351

这些设置也可以通过一个表来修改，即option window：458

一些常用设置：497


</details>

<details><summary>usr_06.txt Using syntax highlighting</summary>
一些设置了语法高亮但是仍然没有颜色的原因：51

可以不用默认颜色，用其它颜色，或者自己改颜色：133

</details>


<details><summary>usr_07.txt Editing more than one file</summary>
总感觉这节不太有用，我直接spliting不就好了，为什么要按这节的方法来呢
如何在保存和不保存当前文件的情况下，编辑另一个文件：25



</details>

<details><summary>usr_08.txt Splitting windows</summary>
开始就是怎么分窗口，怎么在窗口间跳转

用鼠标来调整窗口的大小还是方便：143
但是我拿鼠标试了，没成功啊

如何调整窗口的位置：277

批量处理所有窗口的命令：305

显示两个文件的diff：338

一个屏幕很快就用完了，如何开新tab：509

tab间切换可以gt，精确切换的话要用(:tabn后面加索引，索引从1开始）

</details>

<details><summary>usr_09.Using the GUI</summary>
skip over
</details>

<details><summary>usr_10.Making big changes</summary>
按q可以录制宏：27

录制的宏可能跟平时的按键冲突了，怎么解决：92

录制好的宏也可以appending新的内容：117

查找并替换，也就是常用的:s命令：155

命令的范围，常见的有当前行，最后行，以及range是可pattern可加减的：249

范围也可以用MARK来指示：295

substitue是查找替换，global是查找并执行：343

:read {filename}可以把文件的内容插入到光标之后，也可以指定位置插入：574
类似的，可以把当前文件写入到其它文件

代码格式化：622

改变大小写：668

!{motion}{program}，将文件的一部分作为输入来执行bash命令：693
例如以下4行，把光标放在4上，然后输入!4jsort，再回车，就按顺序了，注意这里不需要冒号
4
3
2
1
另外比如直接!jecho "hello"，猜是什么效果

关于这样的命令是如何执行的，你可以通过这些设置来更改：757

前面讲了如何吃掉文本作输入，来执行命令并输出到当前文本，其实也可以直接将命令的输出到当前文本：763

也可以直接将当前文本作输入，给外部命令执行，结果会显示在一个temp的窗口中：809


</details>

<details><summary>usr_11.txt Recovering from a crash</summary>


</details>

<details><summary>usr_12.txt Clever tricks</summary>
整词匹配pattern用法：26

宏不只可以录制单文件命令，也可以录制诸如:wnext这样的命令，从而一次更改多个文件：54

一个tricky的前后单词位置互换方法：91

一个tricky的多行排序方法：131

通过global和pattern和move来实现文本上下翻转：178

一个特定的快速查找当前文本所对应的命令帮助的方法：232（但是我更想要通用方法，怎么在nvim里面打开一个新窗口的内容是终端呢？）

一个消除行后空格的方法：264

一个vim所有包含某个patter的文件的方法：298
最终还是要找到行才能修改：324
</details>

<details><summary>usr_20.txt Typing commaid-line commands quickly</summary>
总体来讲就是一些让输入vim命令更容易的方法，但是又要记一堆东西，其实没必要

</details>

<details><summary>usr_21.txt Go away and come back</summary>
执行shell命令：48

回到退出前视图：148

最近访问的文件：174

vim会话：229

感觉这节除了shell命令以外，也没什么好看的

</details>

<details><summary>usr_22.txt Finding the file to edit</summary>
其实就是目录，这个用nerdtree插件其实也是一样的

vim文件跳转，但是依赖于path变量：214

然后是buffer的介绍，vim编辑的时候其实就是在写buffer，然后后面才把buffer写入文件来修改文件

</details>
