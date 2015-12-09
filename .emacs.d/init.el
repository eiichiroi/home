;;;;; Can locate emacs config files in independent directories and load them
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))

;;;;; El-Get
;;;;; Enable El-Get if being installed otherwise download and install it
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;;;; Remap the C-h as delete instead of displaying help
(global-set-key "\C-h" 'delete-backward-char)

;;;;; Shift + arrow keys move windows
(windmove-default-keybindings)
(global-set-key "\e[1;2A" 'windmove-up)
(global-set-key "\e[1;2B" 'windmove-down)
(global-set-key "\e[1;2C" 'windmove-right)
(global-set-key "\e[1;2D" 'windmove-left)

;;;;; Flush instead of beep for warnings
(setq visible-bell t)

;;;;; Settings for color
(global-font-lock-mode t) ; Use always font-lock-mode
(setq font-lock-support-mode 'jit-lock-mode) ; Just in Time

;;;;; Highlight the coressponding parenthesis
(show-paren-mode t)

;;;;; Display the line number in the mode line
(line-number-mode t)

;;;;; Display the column number in the mode line
(column-number-mode t)

;;;;; Display current region strongly
(transient-mark-mode t)

;;;;; Packages for Emacs
(el-get-bundle auto-complete)
(el-get-bundle google-c-style)
(el-get-bundle markdown-mode)


;;;;; Config for auto-complete.el
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-files "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)
(setq ac-use-menu-map t)
(put 'set-goal-column 'disabled nil)

;;;;; Config for google-c-style
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
