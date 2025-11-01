+++
date = '2025-11-01T13:28:59+01:00'
title = 'Scratching an Itch'
+++

Yesterday I had a technological itch. I was configuring a package in {{< backlink "Emacs" "Emacs">}}and had to search for a variable name, the completion system mixed variables and functions together and it was a bit of a chore. Then I thought "how hard can it be to just create a utility function to list all customizable variables?". An {{< sidenote "hour" >}}And then I spent quite some time tinkering of course :){{</ sidenote >}} later my new package, `upiv`, was born. You can get it from [my forgejo instance](https://forge.arjenwiersma.nl/arjen/upiv).

If you are unfamiliar with `use-package`, it is a very convenient way to configure packages within Emacs. An example of its usage is this configuration of my new `upiv` package.

```emacs-lisp
(use-package upiv
  :config
  (add-to-list 'marginalia-command-categories '(upiv-at-point . variable))
  :custom
  (upiv-full-form-in-completion nil))
```

A little search lead me to `mapatoms`, which basically allows you to call a function on every existing symbol. From t here it is possible to see if something is a `custom-variable-p` and if it has some form of value `boundp`. I only wanted variables with a certain prefix, so `string-prefix-p` was needed. And there it is, a snippet that will list all `lsp-ui` customizable variables.

```emacs-lisp
(mapatoms
     (lambda (sym)
       (let ((sym-name (symbol-name sym)))
         (when (and (custom-variable-p sym)
                    (boundp sym)
                    (string-prefix-p "lsp-ui" sym-name))
           (message "This is a customizable variable %s" sym-name)))))
```

Then I got the idea to pass this list on to a `completing-read-multiple`, allowing the user (me!) to select multiple candidates and insert them into my buffer. 

```emacs-lisp
(when-let ((selected-settings (completing-read-multiple
                                           "Insert settings: " candidates nil t)))
  ;; do the insertion
)
```

From there on I kept adding small features, such as adding the `:custom` keyword when needed, making sure it even works when the cursor is in a string or an comment.

My final addition has been to add `marginalia` support. This means you can pull up the completion list, the default value will be shown in beautiful highlighting and a documentation string is given for better selection.

The final product is shown in the below screencast, where I fist install and setup `vertico` and `marginalia`, and then insert a custom variable using my package.

![Upiv in actions](https://forge.arjenwiersma.nl/arjen/upiv/raw/branch/main/docs/marginalia-upiv.gif)

I do ❤️ Emacs and its extendibility.

Package: [https://forge.arjenwiersma.nl/arjen/upiv](https://forge.arjenwiersma.nl/arjen/upiv)
