;;; prf-string.el --- string manipulation utils

(defun prf/string/replace (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

(defun prf/string/trim (str)
  "Trim leading and tailing whitespace from STR."
  (replace-regexp-in-string (rx (or (: bos (* (any " \t\n")))
				    (: (* (any " \t\n")) eos)))
			    ""
			    str))

;; alternative to convert-standard-filename
(defun prf/system/get-path-system-format (path)
  (if (windows-nt-p)
      (subst-char-in-string ?/ ?\\ path)
    ;; (prf/string/replace "/" "\\" path) ;; or
    (path)
    ) )

(provide 'prf-string)

;;; prf-string.el ends here
