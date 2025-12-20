diff_files
---

+ [10 Best File Comparison and Difference (Diff) Tools in Linux - GeeksforGeeks](https://www.geeksforgeeks.org/linux-unix/10-best-file-comparison-and-difference-diff-tools-in-linux/)
+ [Linux下9种优秀的代码比对工具推荐 - 环信](https://www.easemob.com/news/4770)

## GUI tools

+ WinMerge
+ kdiff3
+ DiffMerge (open-source)
+ Diffuse (python implement)

## CLI

### diffutils

+ `sdiff`
    > 並排顯示差異

    ```
    Usage: sdiff [OPTION]... FILE1 FILE2
    Side-by-side merge of differences between FILE1 and FILE2.

    Mandatory arguments to long options are mandatory for short options too.
      -o, --output=FILE            operate interactively, sending output to FILE

      -i, --ignore-case            consider upper- and lower-case to be the same
      -E, --ignore-tab-expansion   ignore changes due to tab expansion
      -Z, --ignore-trailing-space  ignore white space at line end
      -b, --ignore-space-change    ignore changes in the amount of white space
      -W, --ignore-all-space       ignore all white space
      -B, --ignore-blank-lines     ignore changes whose lines are all blank
      -I, --ignore-matching-lines=RE  ignore changes all whose lines match RE
          --strip-trailing-cr      strip trailing carriage return on input
      -a, --text                   treat all files as text

      -w, --width=NUM              output at most NUM (default 130) print columns
      -l, --left-column            output only the left column of common lines
      -s, --suppress-common-lines  do not output common lines

      -t, --expand-tabs            expand tabs to spaces in output
          --tabsize=NUM            tab stops at every NUM (default 8) print columns

      -d, --minimal                try hard to find a smaller set of changes
      -H, --speed-large-files      assume large files, many scattered small changes
          --diff-program=PROGRAM   use PROGRAM to compare files

          --help                   display this help and exit
      -v, --version                output version information and exit

    ```

    - display diff
        > + `<` 代表左側 file1 有, 但右側 file2 沒有
        > + `>` 代表左側 file1 沒有, 但右側 file2 有
        > + `|`  代表 file1/file2 都有, 但是不相同

        ```
        $ sdiff file1.txt file2.txt

        123     <
        abC     | abc
                > 456
        ```
    - merge files
        > sdiff 進入互動模式 `ed editor`, `%` is the Interactive Prompts
        > ```
        > %?
        > ed:         Except precede each version with
        >               a header that shows what file and lines the version came from.
        > eb:         Concatenate the two versions, edit the result in a temporary file,
        >               then copy the edited result to the output
        > el or e1:   Edit a copy of the left version, then copy the result to the output.
        > er or e2:   Edit a copy of the right version, then copy the result to the output.
        > e:          Discard both versions then edit a new one.
        > l or 1:     Copy the left version to the output.
        > r or 2:     Copy the right version to the output.
        > s:          Silently include common lines.
        > v:          Verbosely include common lines.
        > q:          Quit.
        > ```


        1. Add `EDITOR` environment variable with user preferred editor (e.g. vim)

            ```
            $ export EDITOR=vim; sdiff -w 40 -s -o out.txt  file1.txt file2.txt
            $ sdiff -o out.txt file1.txt file2.txt
            ...
            %
            ```



    - Diff-Directory

        1. 先找出目錄下有差異的檔案

            ```
            # -q: no detail message, -r: recursive
            $ diff -rq ~/android_devp/launcher ~/android/launcher
            ```

        1. 查看單檔案

            ```
            # -l: display full context at Lef, only diff at Right
            # -s: only display the diff context
            $ sdiff -s ~/android_devp/launcher/Workspace.java ~/android/launcher/Workspace.java
                or
            $ sdiff -l ~/android_devp/launcher/Workspace.java ~/android/launcher/Workspace.java
            ```

