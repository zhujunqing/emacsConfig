;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;(require 'init-packages)
;;(require 'init-ui)
;;(require 'init-better-defaults)
;;(require 'init-keybindings)
;;(require 'init-org)

;; load-file and load
(load "init-packages")
(load "init-ui")
(load "init-better-defaults")
(load "init-keybindings")
(load "init-org")

;;(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

;;(load-file custom-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (mvn javap-mode jdee jdecomp javadoc-lookup java-snippets java-imports js2-refactor company monokai-theme hungry-delete swiper counsel smartparens js2-mode nodejs-repl exec-path-from-shell popwin web-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
