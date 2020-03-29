(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://elpa.emacs-china.org/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
  )
;;add whatever packages you want here
(defvar sandwich/packages '(
			    company
			    monokai-theme
			    hungry-delete
			    swiper
			    counsel
			    smartparens
			    js2-mode
			    nodejs-repl
			    exec-path-from-shell
			    popwin
			    ;; 你其他的插件在这里
			    web-mode
			    dash
			    smex
			    reveal-in-osx-finder
			    expand-region
			    iedit
			    helm-ag
			    flycheck
			    yasnippet
			    auto-yasnippet
			    )  "Default packages")

(setq package-selected-packages  sandwich/packages)

(defun sandwich/packages-installed-p ()
  (loop for pkg in sandwich/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (sandwich/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg sandwich/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;let emacs could find the excuable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))



(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; config js2-mode for js file
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

(global-company-mode t)

(setq monokai-highlight "#CC6600")
(setq monokai-green "#33CCFF")
(load-theme 'monokai t)


(require 'popwin)
(popwin-mode t)

(require 'dash)
(eval-after-load 'dash '(dash-enable-font-lock))

;;config smex
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
					; when Smex is auto-initialized on its first run.

;;可以不设置为全局的
(global-flycheck-mode t)
;;(add-hook 'java-mode 'flycheck-mode)

;;(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-packages)
