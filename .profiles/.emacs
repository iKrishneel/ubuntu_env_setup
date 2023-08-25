(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

; initialize package.el
(package-initialize)

(setq package-list '(auto-complete
		     yasnippet
		     auto-complete
		     hlinum
		     jedi
		     auto-complete
		     nyan-mode
		     iedit
		     auto-complete-clang
		     auto-complete-clang-async
		     google-c-style
		     cmake-mode
		     grandshell-theme
		     ac-math))

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; start auto-complete with emacs
(require 'auto-complete)

;; ; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; ;; ;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

 (nyan-mode 1)
;;(setq-default nyan-wavy-trail nil)
(setq nyan-wavy-trail t)
(setq nyan-bar-length 20)
(setq nyan-animate-nyancat t)
(nyan-start-animation)

;; turn on auto-indent
(add-hook 'c-mode-common-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))

;; iedit
(require 'iedit)
(define-key global-map (kbd "C-c ;") 'iedit-mode)

(require 'flymake)
(require 'use-package)
(use-package flymake-cursor
  :load-path "~/.emacs.d/emacs-flymake-cursor"
  :config
  (flymake-cursor-mode))

;; turn on Semantic
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;;enable global support for Semanticdb
;; turn on Semantic
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;;enable global support for Semanticdb
(global-semanticdb-minor-mode 1)
(global-semanticdb-minor-mode 1)

;; turn on auto-indent
(setq c-default-style "ellemtel" c-basic-offset 5)

(global-ede-mode 1)
(global-semantic-idle-scheduler-mode 1)

;; turn on number line
(global-linum-mode t)
(setq linum-format "%d  ")
(set-face-foreground 'linum "#000000")

;; Show the cursor line
(require 'hlinum)
;; (set-face-foreground 'linum "#707B7C")

(require 'cmake-mode)
(require 'auto-complete-clang)
(require 'auto-complete-clang-async)
(global-semanticdb-minor-mode 1)

;; turn on auto-indent
(setq c-default-style "ellemtel"
      c-basic-offset 5)

;; turn on ede mode
(global-ede-mode 1)
(global-semantic-idle-scheduler-mode 1)

;; turn on highlight paren mode
(show-paren-mode 1)

;; key for opening header file
(global-set-key (kbd "C-x C-o") 'ff-find-other-file)

(setq auto-mode-alist
      (append
       '(("\\.F$"    . fortran-mode)
	 ("\\.inc$"  . fortran-mode)
	 ("\\.C$"    . c++-mode)
	 ("\\.cc$"   . c++-mode)
	 ("\\.cu$"   . c++-mode)
	 ("\\.h$"    . c++-mode)
	 ("\\.hpp$"    . c++-mode)
	 ("\\.cxx$"  . c++-mode)
	 ("\\.html$" . html-mode)
	 ("CMakeLists\\.txt\\'" . cmake-mode)
	 ("\\.cmake\\'" . cmake-mode)
	 ("\\.launch$" . xml-mode)
	 ("\\.hpp\\'" . c++-mode)
	 ("\\.cu\\'" . c++-mode)
	 ("\\.m$" . octave-mode))
       auto-mode-alist))

(put 'upcase-region 'disabled nil)

;;Auto indent
(set (make-local-variable 'aai-indent-function)
     'aai-indent-defun)

(package-install 'flycheck)
(global-flycheck-mode)

(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; start google-c-style with emacs
(require 'google-c-style)
(autoload 'google-set-c-style "google-c-style")
(autoload 'google-make-newline-indent "google-c-style")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)

(setq gc-cons-threshold 1000000)

(require 'ede)

(setq semantic-load-turn-useful-things-on t)

(semantic-add-system-include "/usr/include/" 'c-mode)
(semantic-add-system-include "/usr/include/" 'c++-mode)

(require 'cl)

(defun file-in-directory-list-p (file dirlist)
    "Returns true if the file specified is contained within one of
the directories in the list. The directories must also exist."
    (let ((dirs (mapcar 'expand-file-name dirlist))
	  (filedir (expand-file-name (file-name-directory file))))
      (and
       (file-directory-p filedir)
       (member-if (lambda (x) ; Check directory prefix matches
		    (string-match (substring x 0 (min(length filedir) (length x))) filedir))
		  dirs))))

(defun buffer-standard-include-p ()
    "Returns true if the current buffer is contained within one of
the directories in the INCLUDE environment variable."
    (and (getenv "INCLUDE")
	 (file-in-directory-list-p buffer-file-name (split-string (getenv "INCLUDE") path-separator))))

(add-to-list 'magic-fallback-mode-alist '(buffer-standard-include-p . c++-mode))

;; (c-add-style "my-style"
;; 	     '("stroustrup"
;; 	       (indent-tabs-mode . nil)
;; 	       (c-basic-offset . 4)
;; 	       (c-offsets-alist . ((inline-open . 0)
;; 				   (brace-list-open . 0)
;; 				   (statement-case-open . +)))))

;; (defun my-c++-mode-hook ()
;;   (c-set-style "my-style")
;;   (auto-fill-mode)
;;   (c-toggle-auto-hungry-state 1))
;; (add-hook 'c++-mode-hook 'my-c++-mode-hook)

(autoload 'cmake-mode "/usr/share/emacs/site-lisp/cmake-mode.el" t)

;; color the entire line
(global-hl-line-mode 1)
;; To customize the background color
(set-face-background 'hl-line "magenta")
;; -- color of line
(set-face-background 'hl-line "#cd1076")

;; python auto-complete
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Ignoring electric indentation
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      'no-indent
    nil))
(add-hook 'electric-indent-functions 'electric-indent-ignore-python)

;; Enter key executes newline-and-indent
(defun set-newline-and-indent ()
  "Map the return key with `newline-and-indent'"
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'python-mode-hook 'set-newline-and-indent)

;; Turn on auto-insert
(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.c\\'" . "C skeleton")
     '(
       "Short description: "
       "/**\n * "
       (file-name-nondirectory (buffer-file-name))
       " -- " str \n
       " *" \n
       " * Written on " (format-time-string "%A, %e %B %Y.") \n
       " */" > \n \n
       "#include <stdio.h>" \n
       "#include \""
       (file-name-sans-extension
	(file-name-nondirectory (buffer-file-name)))
       ".h\"" \n \n
       "int main(int argc, const char* argv[]) {" \n
       "return 0;" >
       > _ \n
       "}" > \n)))

;; turn on lisp autocomplete
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

;; turn on offscreen bracket highlight
(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
  (interactive)
  (let* ((cb (char-before (point)))
	 (matching-text (and cb
			     (char-equal (char-syntax cb) ?\) )
			     (blink-matching-open))))
    (when matching-text (message matching-text))))


(if window-system (require 'font-latex))
(setq font-lock-maximum-decoration t)

;; Change color of C/C++ comment
(set-face-foreground 'font-lock-string-face "green")
(set-face-foreground 'font-lock-comment-face "red")

;; split
(setq split-height-threshold nil) 
(setq split-width-threshold 0)

;; latex ac-maths
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)
(defun ac-latex-mode-setup ()
  (setq ac-sources
	(append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
		ac-sources)))
(add-hook 'TeX-mode-hook 'ac-latex-mode-setup)

(require 'ispell)
(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(defun turn-on-outline-minor-mode ()
  (outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o")

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t))

(add-hook 'yaml-mode-hook
        (lambda ()
	  (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(json-mode docker-compose-mode ini-mode toml-mode markdown-preview-mode markdown-mode yaml-mode dockerfile-mode yasnippet use-package nyan-mode jedi iedit hlinum google-c-style flymake-cursor flycheck cmake-mode auto-complete-clang-async auto-complete-clang ac-math)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
