(defun singlefile-bibtex (x)
  "Takes a URL and stores it at the desired location. Then it updates the first item in the completion bibliography with the stripped URL as the bibtex key, the page title to the best of its ability, the URL, and the associated HTML file."
  (interactive "sEnter your URL: ")
  (defvar strippedurl (shell-command-to-string (format "echo -n %s | sed -e 's/[^A-Za-z0-9._-]/_/g'" x)))
  (defvar thetimenow (format-time-string "%Y%m%d%H%M%S"))
  (write-region (concat "\n@online{" thetimenow strippedurl ",\n  title = {" (shell-command-to-string (format "%s %s %s" "./sfcaller.sh" x thetimenow)) "},\n  url = {" x "},\n  file={" singlefile-destination-dir thetimenow strippedurl "},\n}") nil (car bibtex-completion-bibliography) 'append)
  )

(defcustom singlefile-destination-dir "/mydata/references/webpages/"
  "Files downloaded by single-file go here."
  :type 'string)
