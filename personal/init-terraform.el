;;; init-terraform.el --- Work with Terraform configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; Terraform

(prelude-require-packages '(terraform-mode
                            company-terraform))

(with-eval-after-load 'terraform-mode
  (add-hook 'terraform-mode-hook
            'terraform-format-on-save-mode)
  (with-eval-after-load 'company-terraform
    (add-hook 'terraform-mode 'company-terraform-init)))

(provide 'init-terraform)
;;; init-terraform.el ends here
