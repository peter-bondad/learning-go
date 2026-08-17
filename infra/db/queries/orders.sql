-- name: CreateOrder :one
INSERT INTO orders (
    customer_id,
    status,
    total_amount
)
VALUES (
    $1,
    $2,
    $3
)
RETURNING *;


-- name: GetOrder :one
SELECT *
FROM orders
WHERE id = $1;


-- name: ListOrders :many
SELECT *
FROM orders
ORDER BY created_at DESC;


-- name: UpdateOrderStatus :one
UPDATE orders
SET
    status = $2,
    updated_at = NOW()
WHERE id = $1
RETURNING *;