;;; prf-string.el --- string manipulation utils

;; REVIEW: see if not redundact w/ s.el

(require 'url-util)

;; -------------------------------------------------------------------------
;; GENERAL

(defun prf/string/replace (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

(defun prf/string/trim (str)
  "Trim leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
				    (: (* (any " \t\n")) eos)))
			    ""
			    str))

;; -------------------------------------------------------------------------
;; PATH

;; alternative to convert-standard-filename
(defun prf/system/get-path-system-format (path)
  (if (windows-nt-p)
      (subst-char-in-string ?/ ?\\ path)
    ;; (prf/string/replace "/" "\\" path) ;; or
    (path)))


;; -------------------------------------------------------------------------
;; URL

(defun prf/url/encode-region (str)
  (url-encode-url str))

(defun prf/url/encode-region (begin end)
  "URL-encode selected region."
  (interactive "r")
  (atomic-change-group
    (let ((txt (delete-and-extract-region begin end)))
      (insert (prf/url/encode-region txt)))))

(defun prf/url/decode (str)
  (decode-coding-string (url-unhex-string str) 'utf-8))

(defun prf/url/decode-region (begin end)
  "URL-decode selected region."
  (interactive "r")
  (atomic-change-group
    (let ((txt (delete-and-extract-region begin end)))
      (insert (prf/url/decode txt)))))


(provide 'prf-string)

;;; prf-string.el ends here
