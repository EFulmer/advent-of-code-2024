#!/usr/bin/env -S sbcl --script
;; -*- Common Lisp -*

(defun main ()
  (let ((args (cdr sb-ext:*posix-argv*)))
    (format t "Arguments: ~a~%" args)
    (mapcar #'cat args)))

(defun cat (file-name)
  "Just cat. Like the Unix tool."
  (with-open-file (in-stream file-name)
    (when in-stream
      (loop for line = (read-line in-stream nil)
            while line do (format t "~a~%" line)))))
