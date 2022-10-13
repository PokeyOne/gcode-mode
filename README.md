
# Table of Contents

1.  [Features](#org9eac836)
    1.  [Syntax Highlighting](#orgb9c283d)
2.  [Installation](#orgbfcdaa9)

gcode-mode.el is a major mode for editing gcode files in emacs.


<a id="org9eac836"></a>

# Features

Currently the only feature is syntax highlighting.


<a id="orgb9c283d"></a>

## Syntax Highlighting

-   Instruction codes
-   Arguments
-   Comments

![img](./docs/images/readme/example.png "Example syntax highlighting")


<a id="orgbfcdaa9"></a>

# Installation

This package is only available through loading the source. To install:

First, either clone this repo or download the `gcode-mode.el` file. Make note
of the location of this file.

Now in your emacs config, add something like this:

```elisp
(push "~/repos/gcode-mode" load-path)
(require 'gcode-mode)
```

In Spacemacs, this would be in the `dotspacemacs/user-config` function.

Now, if you reload emacs, and open a `.gcode` file, it should open in gcode mode
and have syntax highlighting.

