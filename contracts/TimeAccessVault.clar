;; TimedAccessVault
;; A vault that stores a secret value and releases it only after a specified unlock time.

;; Data storage
(define-data-var admin principal tx-sender)
(define-data-var secret (string-ascii 256) "")
(define-data-var unlock-height uint u0)

;; Added missing assert-admin helper function
(define-private (assert-admin)
  (if (is-eq (var-get admin) tx-sender)
    (ok true)
    (err u1)
  )
)

;; Set the secret and unlock time (admin only)
;; fixed function definition syntax with proper closing parenthesis and match error handling
(define-public (set-secret (new-secret (string-ascii 256)) (unlock-at uint))
  (begin
    (match (assert-admin) err (err err) ok-val
      (begin
        (var-set secret new-secret)
        (var-set unlock-height unlock-at)
        (ok true)
      )
    )
  )
)

;; Update unlock time (admin only)
;; fixed function definition syntax and match statement
(define-public (update-unlock-time (new-unlock uint))
  (begin
    (match (assert-admin) err (err err) ok-val
      (begin
        (var-set unlock-height new-unlock)
        (ok true)
      )
    )
  )
)

;; Transfer admin role (admin only)
;; fixed function definition syntax and match statement
(define-public (transfer-admin (new-admin principal))
  (begin
    (match (assert-admin) err (err err) ok-val
      (begin
        (var-set admin new-admin)
        (ok true)
      )
    )
  )
)
