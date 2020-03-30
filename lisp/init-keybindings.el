(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivyq-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "C-c a") 'org-agenda)

;;config imenu key 
(global-set-key (kbd "M-s i") 'counsel-imenu)
;;config expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

(global-set-key (kbd "C-w") 'backward-kill-word)

(provide 'init-keybindings)
