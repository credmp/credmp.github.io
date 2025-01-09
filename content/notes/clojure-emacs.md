+++
date = '2025-01-09T20:25:59+01:00'
title = 'Setting up Emacs for Clojure development'
categories = ['Programming', 'Emacs']
+++

Emacs 🥰 Lisp, and as {{< backlink "clojure" "Clojure">}} is a Lisp like language, Emacs is extremely capable in editing it. I use several packages to make my live a joy inside Emacs, here are the {{< backlink "clojure" "Clojure">}} specific packages:

- [paredit](https://paredit.org/): I highly recommend it to work with any lisp, it makes working with the parenthesis a real joy. There is an [animated guide](http://danmidwood.com/content/2014/11/21/animated-paredit.html) of most of the features.
- [cider](https://cider.mx/): The only thing you need to run and work with Clojure files
- [flycheck-clj-kondo](https://github.com/borkdude/flycheck-clj-kondo): brings the hints from [clj-kondo](https://github.com/clj-kondo/clj-kondo) to the editing screen.
- [clj-refactor](https://github.com/clojure-emacs/clj-refactor.el): provides all the refactoring tools you will need
- [clojure-mode](https://github.com/clojure-emacs/clojure-mode): finally the clojure mode to provide basic features (highlighting, indentation, navigation and basic refactoring) into Emacs.

I have an [YouTube playlist](https://www.youtube.com/playlist?list=PLdKXxqwRv6_y7rHHjbrK38E59t9ost3o3) on my channel that covers most of these tools. The videos are from 2016 (when I did my live coding in Clojure series), but are still very relevant today.

```emacs-lisp
;; http://danmidwood.com/content/2014/11/21/animated-paredit.html
(use-package paredit
  :ensure t
  :hook ((clojure-mode . paredit-mode))
  )

(use-package cider
  :ensure t)

;;First install the package:
(use-package flycheck-clj-kondo
  :ensure t)

(use-package clj-refactor
  :ensure t
  :after clojure-mode
  :config
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))
  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook))
  

;;then install the checker as soon as `clojure-mode' is loaded
(use-package clojure-mode
  :ensure t
  :after flycheck-clj-kondo
  :config
  (require 'flycheck-clj-kondo)
  (flycheck-mode 1))
```
