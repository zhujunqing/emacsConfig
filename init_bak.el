
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; change package 
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
;;  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa" (concat proto "://elpa.emacs-china.org/melpa/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
;;    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.emacs-china.org/gnu/")))))
(package-initialize)

;;简写
(abbrev-mode t)
    (define-abbrev-table 'global-abbrev-table '(
					     ;; signature
					     ("zjq" "zhujunqing")
					     ;; Microsoft
					     ("mic" "Microsoft")
					     ;; Google
					     ("google" "Google")
					     ;; Amazon
					     ("amazon" "Amazon")
					     ;; Apple
					     ("apple" "Apple")
					     ))


;;auto refresh
(global-auto-revert-mode t)

;;delete space
(require 'hungry-delete)
(global-hungry-delete-mode)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-indent-mode -1)
(global-linum-mode t)
(setq inhibit-splash-screen t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
)

(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-company-mode t)
;; setq-default is global
(setq-default cursor-type 'bar)
(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode t)

(load-theme 'monokai t)

(require 'smex) ; Not needed if you use package.el
 (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.

(global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
 ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;;当查看变量时，光标到变量中
(require 'popwin)
(popwin-mode 1)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; 自动完成：company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode); 全局开启
(setq company-show-numbers t); 显示序号
(setq company-idle-delay 0.2); 菜单延迟
(setq company-minimum-prefix-length 1); 开始补全字数

;; elpy---主角
(require 'elpy)
(elpy-enable)

;; 语法检查：flycheck
(add-hook 'after-init-hook #'global-flycheck-mode);全局开启
; 关闭flymake，使用flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules(delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; 虚拟环境： virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/pyvirtualenv/");设置虚拟环境目录
;; 如果有多个目录：
;; (setq venv-location '("~/myvenv-1/"
;;                       "~/myvenv-2/"))
;; M-x venv-workon 打开虚拟环境

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(package-selected-packages
   (quote
    (company-anaconda company-jedi flycheck virtualenvwrapper elpy js3-mode js-import js2-highlight-vars js2-mode js2-refactor popwin smartparens counsel smex company hungry-delete ##))))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


