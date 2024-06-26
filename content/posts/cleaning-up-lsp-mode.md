+++
title = "Cleaning up after LSP-mode"
author = ["Arjen Wiersma"]
date = 2022-11-07T00:00:00+01:00
draft = false
+++

I use [lsp-mode](https://emacs-lsp.github.io/lsp-mode/) quite extensively. I switched from eglot when I started using LSP more. The beautify of lsp-mode is that it will automatically install language servers as you need them. It also integrates excellently with [dap-mode](https://emacs-lsp.github.io/dap-mode/) to enable debugging sessions. So, I switched to it, turned off all the information overload and I am quite happy.

One thing I do extensively is that I use LaTeX to make my slides for college class slides and class assignments. That means I have hundreds of directories with presentations, assignments and other documents. Each time I enter a directory for a class it will spawn an LSP session for that set of LaTeX files.

Then there are the assignments that are handed in. Mostly Java and JavaScript types of projects that I grade. This is wonderful work and I am glad I can do it within Emacs, instead of having to spawn up some IDE to just browse code structures.

The downside to all this is that my `lsp-describe-session` list becomes huge. At one point I had over 100 sessions stored in it, most of them fleeting due to work I graded at the end of a semester. Luckily you can just clean those folders up by calling `lsp-workspace-folders-remove`. As an interactive function you can call it, select the folder to remove and be done with it.

Needless to say that I did not feel like doing that manually for 100+ folders. So I created a small snippet of elisp to automate this. It is listed below, feel free to copy it. It will clean out **all** your LSP folders, so you will need to create the ones you need again after using it, but `lsp-mode` will do just that for you.

```emacs-lisp
(defun aw/cleanup-lsp ()
  "Remove all the workspace folders from LSP"
  (interactive)
  (let ((folders (lsp-session-folders (lsp-session))))
    (while folders
      (lsp-workspace-folders-remove (car folders))
      (setq folders (cdr folders)))))
```
