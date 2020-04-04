(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
;;  (add-to-list 'package-archives '("gnu" . "http://elpa.emacs-china.org/gnu/") t)
;;  (add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  (add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
;;  (add-to-list 'package-archives '("marmalade" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/") t)
;;  (add-to-list 'package-archives '("melpa stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/") t)
;;  (add-to-list 'package-archives '("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/") t)
;;(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
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
			    web-mode dash smex
			    reveal-in-osx-finder
			    expand-region
			    iedit
			    helm-ag
			    flycheck
			    yasnippet
			    auto-yasnippet
			    winum
			    evil
			    ;;		    evil-lisp-state
			    use-package
			    projectile
			    scala-mode
			    ace-window
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

(require 'iedit)

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
(add-hook 'java-mode 'flycheck-mode)

;;(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; Enable Evil
(add-to-list 'load-path "~/.emacs.d/elpa/evil-20200304.1421")
(require 'evil)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(setq-default evil-want-C-u-scroll t)
(evil-mode 1)

;;/Users/jessie/.emacs.d/elpa/use-package-20200322.2110
;; This is only needed once, near the top of the file
(eval-when-compile
;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/elpa/use-package-20200322.2110")
  (require 'use-package)
)

(use-package ace-jump-mode
  :bind ("C-." . ace-jump-mode))

(use-package hi-lock
  :bind (("M-o l" . highlight-lines-matching-regexp)
         ("M-o r" . highlight-regexp)
         ("M-o w" . highlight-phrase)))

(use-package helm
  :bind (("M-x" . helm-M-x)
         ("M-<f5>" . helm-find-files)
         ([f10] . helm-buffers-list)
         ([S-f10] . helm-recentf)))

;;(use-package projectile
;;  :bind-keymap
;;  ("C-c p" . projectile-command-map))

(projectile-mode +1)
;;(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; 默认全局使用
(projectile-global-mode)
;; 默认打开缓存
(setq projectile-enable-caching t)

(use-package scala-mode
  :interpreter
    ("scala" . scala-mode))

(require 'winum)
(winum-mode)

(require 'powerline)
(powerline-center-evil-theme)

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)
;;(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(provide 'init-packages)
