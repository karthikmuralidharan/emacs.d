;;; config-lsp.el --- Emacs Prelude: LSP configurations.
;;
;; Author: Karthik Muralidharan
;; Version: 1.0.0
;; Keywords: convenience go

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Prelude configuration for Go

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(with-eval-after-load 'lsp-mode
  ;; Additional LSP mode configurations
  (setq lsp-auto-guess-root t)
  (setq lsp-ui-doc-enable nil)

  ;; Programming mode hooks
  (add-hook 'go-mode-hook #'lsp-deferred)
  (add-hook 'dart-mode-hook #'lsp-deferred)
  (add-hook 'csharp-mode-hook #'lsp-deferred)

  ;; configure clients
  (use-package lsp-clients
  :ensure nil
  :functions (lsp-format-buffer lsp-organize-imports)
  :hook ((go-mode . (lambda ()
                      "Format and add/delete imports."
                      (add-hook 'before-save-hook #'lsp-organize-imports t t)
                      (add-hook 'before-save-hook #'lsp-format-buffer t t)))
         (dart-mode . (lambda ()
                      "Format and add/delete imports."
                      (add-hook 'before-save-hook #'lsp-organize-imports t t))))
  :init
  (setq lsp-clients-python-library-directories '("/usr/local/" "/usr/"))
  (unless (executable-find "rls")
    (setq lsp-rust-rls-server-command '("rustup" "run" "stable" "rls"))))

  ;; Ivy integration
  (use-package lsp-ivy
    :bind (:map lsp-mode-map
                ([remap xref-find-apropos] . lsp-ivy-workspace-symbol)))

  ;; Microsoft python-language-server support
  (use-package lsp-python-ms
    :hook (python-mode . (lambda ()
                           (require 'lsp-python-ms)
                           (lsp-deferred))))

  ;; Debug
  (use-package dap-mode
    :diminish
    :functions dap-hydra/nil
    :bind (:map lsp-mode-map
                ("<f5>" . dap-debug)
                ("M-<f5>" . dap-hydra))
    :hook ((after-init . dap-mode)
           (dap-mode . dap-ui-mode)
           (dap-session-created . (lambda (&_rest) (dap-hydra)))
           (dap-terminated . (lambda (&_rest) (dap-hydra/nil)))

           (python-mode . (lambda () (require 'dap-python)))
           (ruby-mode . (lambda () (require 'dap-ruby)))
           (go-mode . (lambda () (require 'dap-go)))
           ((c-mode c++-mode objc-mode swift) . (lambda () (require 'dap-lldb)))
           (php-mode . (lambda () (require 'dap-php)))
           (elixir-mode . (lambda () (require 'dap-elixir)))
           ((js-mode js2-mode) . (lambda () (require 'dap-chrome))))))

(provide 'config-lsp)
;;; config-lsp.el ends here
