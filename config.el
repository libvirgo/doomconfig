;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "libvirgo"
      user-mail-address "sakurapetgirl@live.com")
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12 :weight 'regular))

(setq doom-theme-dark 'ef-dream
      doom-theme-light 'ef-day
      doom-keyboard-type 'jp
      display-line-numbers-type 'relative
      dashboard-startup-banner (expand-file-name "logo.png" doom-user-dir)
      dashboard-image-banner-max-height 252
      scroll-preserve-screen-position 1
      )
(setq org-directory "~/org/")
(setq doom-leader-alt-key "C-c"
      doom-localleader-alt-key "C-c l")

(defun xah-insert-random-uuid ()
  "Insert a UUID.
This commands calls “uuidgen” on MacOS, Linux, and calls PowelShell on Microsoft Windows.
URL `http://xahlee.info/emacs/emacs/elisp_generate_uuid.html'
Version: 2020-06-04 2023-05-13"
  (interactive)
  (cond
   ((eq system-type 'windows-nt)
    (shell-command "pwsh.exe -Command [guid]::NewGuid().toString()" t))
   ((eq system-type 'darwin) ; Mac
    (shell-command "uuidgen" t))
   ((eq system-type 'gnu/linux)
    (shell-command "uuidgen" t))
   (t
    ;; code here by Christopher Wellons, 2011-11-18.
    ;; and editted Hideki Saito further to generate all valid variants for "N" in xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx format.
    (let ((xstr (md5 (format "%s%s%s%s%s%s%s%s%s%s"
                              (user-uid)
                              (emacs-pid)
                              (system-name)
                              (user-full-name)
                              (current-time)
                              (emacs-uptime)
                              (garbage-collect)
                              (buffer-string)
                              (random)
                              (recent-keys)))))
      (insert (format "%s-%s-4%s-%s%s-%s"
                      (substring xstr 0 8)
                      (substring xstr 8 12)
                      (substring xstr 13 16)
                      (format "%x" (+ 8 (random 4)))
                      (substring xstr 17 20)
                      (substring xstr 20 32)))))))
