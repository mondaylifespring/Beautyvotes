;; BeautyVotes: A decentralized voting app for beauty tips, trends, or products

;; Data Variables
(define-map votes principal uint)  ;; Tracks users and their votes
(define-map items uint uint)       ;; Tracks items and their vote counts
(define-data-var total-items uint u0)  ;; Keeps count of total items

;; Public function to register a new beauty item
(define-public (add-item)
  (let ((new-item-id (+ (var-get total-items) u1)))
    (map-set items new-item-id u0)  ;; Initialize votes for the new item to 0
    (var-set total-items new-item-id)  ;; Increment total-items
    (ok new-item-id)
  )
)

;; Public function to vote for an item
(define-public (vote (item-id uint))
  (let ((voter tx-sender))
    (if (is-some (map-get? votes voter))
        (err u1000)  ;; Error: User has already voted
        (if (is-none (map-get? items item-id))
            (err u1001)  ;; Error: Item does not exist
            (begin
              ;; Register the user's vote
              (map-set votes voter item-id)
              ;; Increment the item's vote count
              (map-set items item-id (+ (default-to u0 (map-get? items item-id)) u1))
              (ok item-id)
            )
        )
    )
  )
)

;; Read-only function to get total votes for an item
(define-read-only (get-votes (item-id uint))
  (default-to u0 (map-get? items item-id))
)

;; Read-only function to check if a user has voted
(define-read-only (has-voted (voter principal))
  (is-some (map-get? votes voter))
)

;; Read-only function to get the total number of items
(define-read-only (get-total-items)
  (var-get total-items)
)

;; Read-only function to get the maximum of two values
(define-read-only (get-max (a uint) (b uint))
  (if (>= a b)
      a
      b
  )
)